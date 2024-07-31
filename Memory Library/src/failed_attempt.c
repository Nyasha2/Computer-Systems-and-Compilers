/*
 * mm-explicit.c - The best malloc package EVAR!
 *
 * TODO (bug): Uh..this is an implicit list???
 */

#include <stdint.h>

#include "assert.h"
#include "memlib.h"
#include "mm.h"
#include "stdio.h"
#include "stdlib.h"
#include "string.h"

/** The required alignment of heap payloads */
const size_t ALIGNMENT = 2 * sizeof(size_t);

/** The layout of each block allocated on the heap */
typedef struct {
    /** The size of the block and whether it is allocated (stored in the low bit) */
    size_t header;
    /**
     * We don't know what the size of the payload will be, so we will
     * declare it as a zero-length array.  This allow us to obtain a
     * pointer to the start of the payload.
     */
    uint8_t payload[];
} block_t;

/** The blocks in the explicit free list*/
typedef struct {
    size_t header;
    block_t *previous;
    block_t *next;
} free_header_t;

/** The first and last blocks on the heap */
static block_t *mm_heap_first = NULL;
static block_t *mm_heap_last = NULL;

/** Initialising the explicit free list*/
free_header_t *explicit_free_list = NULL;

/** Definitions of the coalesce and block splitting functions*/
void coalesce();
void *split_block(block_t *block, size_t size);

void add_block_to_free(block_t *block);

void remove_block_from_free(block_t *block);

/** Rounds up `size` to the nearest multiple of `n` */
static size_t round_up(size_t size, size_t n) {
    return (size + (n - 1)) / n * n;
}

/** Set's a block's header with the given size and allocation state */
static void set_header(block_t *block, size_t size, bool is_allocated) {
    block->header = size | is_allocated;
}

/** Extracts a block's size from its header */
static size_t get_size(block_t *block) {
    return block->header & ~1;
}

/** Sets a block's footer to the value size*/
// static void set_footer(block_t *block, size_t size){
//     size_t position = get_size(block) - sizeof(size_t);
//     *(size_t *)((void *)block + position)= size;
// }

// size_t get_footer(block_t *block){
//     size_t position = get_size(block) - sizeof(size_t);
//     return *(size_t *)((void *)block + position);
// }
/** Extracts a block's allocation state from its header */
static bool is_allocated(block_t *block) {
    return block->header & 1;
}

/**
 * Finds the first free block in the heap with at least the given size.
 * If no block is large enough, returns NULL.
 */
static block_t *find_fit(size_t size) {
    // Traverse the blocks in the explict list
    free_header_t *curr = explicit_free_list;
    while (curr != NULL) {
        if (!is_allocated((block_t *) curr) && get_size((block_t *) curr) >= size) {
            return (block_t *) curr;
        }
        if (curr->next != NULL) {
            curr = (free_header_t *) curr->next;
        }
        else {
            break;
        }
    }
    return NULL;
}

/** Gets the header corresponding to a given payload pointer */
static block_t *block_from_payload(void *ptr) {
    return ptr - offsetof(block_t, payload);
}

/**
 * mm_init - Initializes the allocator state
 */
bool mm_init(void) {
    // We want the first payload to start at ALIGNMENT bytes from the start of the heap
    void *padding = mem_sbrk(ALIGNMENT - sizeof(block_t));
    if (padding == (void *) -1) {
        return false;
    }

    // Initialize the heap with no blocks
    mm_heap_first = NULL;
    mm_heap_last = NULL;
    return true;
}

/**
 * mm_malloc - Allocates a block with the given size
 */
void *mm_malloc(size_t size) {
    // The block must have enough space for a header and be 16-byte aligned

    if (size + sizeof(block_t) <= sizeof(free_header_t)) {
        size = round_up(sizeof(free_header_t), ALIGNMENT);
    }
    else {
        size = round_up(size + sizeof(block_t), ALIGNMENT);
    }

    // printf("\nmalloc\n");
    // If there is a large enough free block, use it
    block_t *block = find_fit(size);
    if (block != NULL) {
        set_header(block, get_size(block), true);
        remove_block_from_free(block);
        return block->payload;
        // return split_block(block, size);
    }

    // Otherwise, a new block needs to be allocated at the end of the heap
    block = mem_sbrk(size);
    if (block == (void *) -1) {
        return NULL;
    }

    // Update mm_heap_first and mm_heap_last since we extended the heap
    if (mm_heap_first == NULL) {
        mm_heap_first = block;
    }
    mm_heap_last = block;

    // Initialize the block with the allocated size
    set_header(block, size, true);
    return block->payload;
}

/**
 * mm_free - Releases a block to be reused for future allocations
 */
void mm_free(void *ptr) {
    // mm_free(NULL) does nothing
    if (ptr == NULL) {
        return;
    }
    // printf("free\n");
    // Mark the block as unallocated
    block_t *block = block_from_payload(ptr);
    set_header(block, get_size(block), false);
    add_block_to_free(block); // coalesce(block);
}

/**
 * mm_realloc - Change the size of the block by mm_mallocing a new block,
 *      copying its data, and mm_freeing the old block.
 */
void *mm_realloc(void *old_ptr, size_t size) {
    if (size == 0) {
        mm_free(old_ptr);
        return NULL;
    }

    if (old_ptr == NULL) {
        mm_free(old_ptr);
        void *new_ptr = mm_malloc(size);
        return new_ptr;
    }

    size_t actual_size = round_up(sizeof(block_t) + size, ALIGNMENT);
    block_t *curr_block = block_from_payload(old_ptr);
    size_t block_size = get_size(curr_block);
    if (block_size > actual_size) {
        set_header(curr_block, block_size, true);
        return curr_block->payload;
    }

    if (block_size < actual_size) {
        void *new_mem = mm_malloc(size);
        memcpy(new_mem, old_ptr, block_size - sizeof(block_t));
        mm_free(old_ptr);
        return new_mem;
    }

    return old_ptr;
}

/**
 * mm_calloc - Allocate the block and set it to zero.
 */
void *mm_calloc(size_t nmemb, size_t size) {
    void *mm_ptr = mm_malloc(nmemb * size);
    memset(mm_ptr, 0, size);
    return memset(mm_ptr, 0, size);
}

/**
 * mm_checkheap - So simple, it doesn't need a checker!
 */
void mm_checkheap(void) {
    free_header_t *curr = explicit_free_list;
    size_t count = 0;
    while (curr != NULL) {
        if (is_allocated((block_t *) curr)) {
            fprintf(stderr, "\nAllocated block in free list\n");
            exit(EXIT_FAILURE);
        }
        if ((block_t *) curr < mm_heap_first || (block_t *) curr > mm_heap_last) {
            fprintf(stderr, "\ncount:%zu\n", count);
            fprintf(stderr, "\nOut of bounds\n");
            exit(EXIT_FAILURE);
        }
        curr = (free_header_t *) curr->next;
        count += 1;
    }

    fprintf(stderr, "\nNumber of free blocks: %zu\n", count);

    // for (block_t *curr = mm_heap_first; mm_heap_last != NULL && curr <= mm_heap_last;
    //      curr = (void *) curr + get_size(curr)) {
    //     // If the block is free and large enough for the allocation, return it
    //     if (curr->header != get_footer(curr)) {
    //         fprintf(stderr, "\nHaa zvaramba\n");
    //         exit(EXIT_FAILURE);
    //     }
    // }
}
// add stuff
/**
 * coalesce - This function iterates through all the blocks in the heap, and if
 * there are any two free blocks next to each other, it merges them together
 */

// void coalesce(block_t *block){
//     block_t *next = (void*)block + get_size(block);
//     if (!is_allocated(next)){
//         set_header(block, get_size(block) + get_size(next), false);
//         set_footer(block, get_size(block) + get_size(next));
//         remove_block_from_free(next);
//         add_block_to_free(block);
//         if (next == mm_heap_last){
//             mm_heap_last = block;
//         }
//     }
//     size_t prev_block_size = *(size_t *)((void*)block - sizeof(size_t));
//     block_t *prev = (void*)block - prev_block_size;
//     if (!is_allocated(prev)){
//         set_header(prev, get_size(block) + get_size(prev), false);
//         set_footer(prev, get_size(block) + get_size(prev));
//         remove_block_from_free(block);
//         add_block_to_free(prev);
//         if (block == mm_heap_last){
//             mm_heap_last = prev;
//         }
//     }

//     if (is_allocated(prev) && is_allocated(next)){
//         add_block_to_free(block);
//     }
// }

/**
 * split_block - checks if a given block size is greater than the required size,
 * and if so, splits it into two pieces
 *
 * @param block - the pointer to the block being split
 * @param size - the amount of memory needed to be allocated
 */

// void *split_block(block_t *block, size_t size){
//     size_t block_size = get_size(block);
//     if (round_up(block_size - size, ALIGNMENT) >= ALIGNMENT){
//         set_header(block, size, true);
//         set_footer(block, size);
//         set_header((void *)block + size, block_size - size, false);
//         set_footer((void *)block + size, block_size - size);
//         remove_block_from_free(block);
//         coalesce((void *)block + size);
//         if (block == mm_heap_last){
//             mm_heap_last = (void*)block + size;
//         }
//         return block->payload;
//     }

//     set_header(block, block_size, true);
//     set_footer(block, block_size);
//     return block->payload;
// }

/**
 * add_block_to_free
 */
void add_block_to_free(block_t *block) {
    printf("\nADD\n");
    printf("%p\n", block);
    printf("%p\n", explicit_free_list);
    // assert((block_t *)explicit_free_list >= mm_heap_first && (block_t
    // *)explicit_free_list <= mm_heap_last);
    if (explicit_free_list == NULL) {
        explicit_free_list = (free_header_t *) block;
        // explicit_free_list->header = block->header;
        explicit_free_list->previous = NULL;
        explicit_free_list->next = NULL;
    }
    else {
        free_header_t *new_block = (free_header_t *) block;
        explicit_free_list->previous = block;
        new_block->next = (block_t *) explicit_free_list;
        printf("New-block next: %p", new_block->next);
        new_block->previous = NULL;
        new_block->header = block->header;
        explicit_free_list = new_block;
    }
    assert((block_t *) explicit_free_list >= mm_heap_first &&
           (block_t *) explicit_free_list <= mm_heap_last);
}

void remove_block_from_free(block_t *block) {
    printf("\nREMOVE\n");
    free_header_t *curr_block = (free_header_t *) block;

    if (curr_block->next == NULL && curr_block->previous == NULL) {
        explicit_free_list = NULL;
        return;
    }

    // removing the first block
    if (block == (block_t *) explicit_free_list) {
        free_header_t *next = (free_header_t *) (curr_block->next);
        explicit_free_list = next;
        printf("Next: %p\n", next);
        if (explicit_free_list != NULL) {
            explicit_free_list->previous = NULL;
        }
        return;
    }

    if (curr_block->next == NULL) {
        free_header_t *prev = (free_header_t *) curr_block->previous;
        if (prev != NULL) {
            prev->next = NULL;
        }
        return;
    }

    if (explicit_free_list != NULL && block != NULL) {
        free_header_t *prev = (free_header_t *) curr_block->previous;
        free_header_t *next = (free_header_t *) curr_block->next;
        prev->next = (block_t *) next;
        next->previous = (block_t *) prev;
        curr_block->next = NULL;
        curr_block->previous = NULL;
    }

    assert((block_t *) explicit_free_list > mm_heap_first &&
           (block_t *) explicit_free_list < mm_heap_last);
    // removing the last block
}
/*
 * mm-implicit.c - The best malloc package EVAR!
 *
 * TODO (bug): mm_realloc and mm_calloc don't seem to be working...
 * TODO (bug): The allocator doesn't re-use space very well...
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

/** Define the functions to add and remove from free list*/
void add_to_free(block_t *);
void remove_from_free(block_t *block);
void *split_block(block_t *block, size_t size);
void coalesce(block_t *block);
void coalesce_front(block_t *block);
void coalesce_back(block_t *block);

/** Definitions of the coalesce and block splitting functions*/
// void coalesce();
// void *split_block(block_t *block, size_t size);

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

/** Sets a block's footer*/
static void set_footer(block_t *block) {
    size_t position = get_size(block) - sizeof(size_t);
    *((size_t *) ((void *) block + position)) = block->header;
}

/** Declare the explicit free list*/
free_header_t *explicit_free_list = NULL;

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
    explicit_free_list = NULL;
    return true;
}

/**
 * mm_malloc - Allocates a block with the given size
 */
void *mm_malloc(size_t size) {
    // The block must have enough space for a header and be 16-byte aligned
    if (size + 2 * sizeof(block_t) <= sizeof(free_header_t)) {
        size = round_up(sizeof(free_header_t), ALIGNMENT);
    }
    else {
        size = round_up(size + 2 * sizeof(block_t), ALIGNMENT);
    }

    // If there is a large enough free block, use it
    block_t *block = find_fit(size);
    if (block != NULL) {
        return split_block(block, size);
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
    set_footer(block);
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

    // Mark the block as unallocated
    block_t *block = block_from_payload(ptr);
    set_header(block, get_size(block), false);
    set_footer(block);
    add_to_free(block);
    coalesce(block);
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
    size_t actual_size;
    if (size + 2 * sizeof(block_t) <= sizeof(free_header_t)) {
        actual_size = round_up(sizeof(free_header_t), ALIGNMENT);
    }
    else {
        actual_size = round_up(size + 2 * sizeof(block_t), ALIGNMENT);
    }

    block_t *curr_block = block_from_payload(old_ptr);
    size_t block_size = get_size(curr_block);
    if (block_size > actual_size) {
        set_header(curr_block, block_size, true);
        set_footer(curr_block);
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
}

void add_to_free(block_t *block) {
    if (explicit_free_list == NULL) {
        explicit_free_list = (free_header_t *) block;
        explicit_free_list->next = NULL;
        explicit_free_list->previous = NULL;
    }
    else {
        explicit_free_list->previous = block;
        free_header_t *new_block = (free_header_t *) block;
        new_block->next = (block_t *) explicit_free_list;
        new_block->previous = NULL;
        explicit_free_list = new_block;
    }
}

void remove_from_free(block_t *block) {
    free_header_t *curr_block = (free_header_t *) block;

    if (explicit_free_list == NULL) {
        return;
    }

    if (curr_block->next == NULL && curr_block->previous == NULL) {
        explicit_free_list = NULL;
        return;
    }

    // removing the first block
    if (block == (block_t *) explicit_free_list) {
        free_header_t *next = (free_header_t *) (curr_block->next);
        explicit_free_list = next;
        explicit_free_list->previous = NULL;
        return;
    }

    if (curr_block->next == NULL) {
        free_header_t *prev = (free_header_t *) curr_block->previous;
        prev->next = NULL;
        return;
    }

    free_header_t *prev = (free_header_t *) curr_block->previous;
    free_header_t *next = (free_header_t *) curr_block->next;
    prev->next = (block_t *) next;
    next->previous = (block_t *) prev;
}

/**
 * split_block - checks if a given block size is greater than the required size,
 * and if so, splits it into two pieces
 *
 * @param block - the pointer to the block being split
 * @param size - the amount of memory needed to be allocated
 */

void *split_block(block_t *block, size_t size) {
    size_t block_size = get_size(block);
    if (round_up(block_size - size, ALIGNMENT) >= 2 * ALIGNMENT) {
        set_header(block, size, true);
        set_footer(block);
        set_header((void *) block + size, block_size - size, false);
        set_footer((void *) block + size);
        remove_from_free(block);
        add_to_free((void *) block + size);
        if (block == mm_heap_last) {
            mm_heap_last = (void *) block + size;
        }
        return block->payload;
    }

    set_header(block, block_size, true);
    remove_from_free(block);
    set_footer(block);
    return block->payload;
}

/**
 * coalesce - This function iterates through all the blocks in the heap, and if
 * there are any two free blocks next to each other, it merges them together
 */

void coalesce(block_t *block) {
    if (block != mm_heap_last) {
        coalesce_front(block);
    }
    if (block != mm_heap_first) {
        coalesce_back(block);
    }
}

void coalesce_front(block_t *block) {
    block_t *next = (void *) block + get_size(block);
    if (!is_allocated(next)) {
        set_header(block, get_size(block) + get_size(next), false);
        set_footer(block);
        remove_from_free(next);
        if (next == mm_heap_last) {
            mm_heap_last = block;
        }
    }
}

void coalesce_back(block_t *block) {
    size_t prev_block_size = *(size_t *) ((void *) block - sizeof(block_t)) & ~1;
    block_t *prev = (void *) block - prev_block_size;

    if (!is_allocated(prev)) {
        set_header(prev, get_size(block) + get_size(prev), false);
        set_footer(prev);
        remove_from_free(block);
        if (block == mm_heap_last) {
            mm_heap_last = prev;
        }
    }
}

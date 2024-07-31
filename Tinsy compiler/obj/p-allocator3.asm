
obj/p-allocator3.full:     file format elf64-x86-64


Disassembly of section .text:

0000000000180000 <process_main()>:

// These global variables go on the data page.
uint8_t* heap_top;
uint8_t* stack_bottom;

void process_main() {
  180000:	f3 0f 1e fa          	endbr64 
  180004:	55                   	push   %rbp
  180005:	48 89 e5             	mov    %rsp,%rbp
  180008:	41 54                	push   %r12
  18000a:	53                   	push   %rbx
// make_syscall
//    These functions define the WeensyOS system call calling convention.
//    We provide versions for system calls with 0-2 arguments.

__always_inline uintptr_t make_syscall(int syscallno) {
    register uintptr_t rax asm("rax") = syscallno;
  18000b:	b8 01 00 00 00       	mov    $0x1,%eax
    asm volatile ("syscall"
            : "+a" (rax)
            : /* all input registers are also output registers */
            : "cc", "memory", "rcx", "rdx", "rsi", "rdi", "r8", "r9",
              "r10", "r11");
  180010:	0f 05                	syscall 
    return rax;
  180012:	48 89 c3             	mov    %rax,%rbx


// sys_getpid
//    Return current process ID.
inline pid_t sys_getpid() {
    return make_syscall(SYSCALL_GETPID);
  180015:	41 89 c4             	mov    %eax,%r12d
    pid_t p = sys_getpid();
    srand(p);
  180018:	89 c7                	mov    %eax,%edi
  18001a:	e8 af 01 00 00       	callq  1801ce <srand(unsigned int)>
//    Return the smallest multiple of `m` greater than or equal to `x`.
//    Equivalently, round `x` up to the nearest multiple of `m`.
template <typename T>
inline constexpr T round_up(T x, unsigned m) {
    static_assert(std::is_unsigned<T>::value, "T must be unsigned");
    return round_down(x + m - 1, m);
  18001f:	b8 1b 30 18 00       	mov    $0x18301b,%eax

    // The heap starts on the page right after the 'end' symbol,
    // whose address is the first address not allocated to process code
    // or data.
    heap_top = (uint8_t*) round_up((uintptr_t) end, PAGESIZE);
  180024:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  18002a:	48 89 05 d7 1f 00 00 	mov    %rax,0x1fd7(%rip)        # 182008 <heap_top>
    return x;
}

__always_inline uintptr_t rdrsp() {
    uintptr_t x;
    asm volatile("movq %%rsp, %0" : "=r" (x));
  180031:	48 89 e0             	mov    %rsp,%rax

    // The bottom of the stack is the first address on the current
    // stack page (this process never needs more than one stack page).
    stack_bottom = (uint8_t*) round_down((uintptr_t) rdrsp() - 1, PAGESIZE);
  180034:	48 83 e8 01          	sub    $0x1,%rax
  180038:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  18003e:	48 89 05 bb 1f 00 00 	mov    %rax,0x1fbb(%rip)        # 182000 <stack_bottom>
  180045:	eb 07                	jmp    18004e <process_main()+0x4e>
    register uintptr_t rax asm("rax") = syscallno;
  180047:	b8 02 00 00 00       	mov    $0x2,%eax
              "r10", "r11");
  18004c:	0f 05                	syscall 

    // Allocate heap pages until (1) hit the stack (out of address space)
    // or (2) allocation fails (out of physical memory).
    while (true) {
#if !NO_SLOWDOWN
        if (rand(0, ALLOC_SLOWDOWN - 1) < p) {
  18004e:	be 63 00 00 00       	mov    $0x63,%esi
  180053:	bf 00 00 00 00       	mov    $0x0,%edi
  180058:	e8 90 01 00 00       	callq  1801ed <rand(int, int)>
  18005d:	44 39 e0             	cmp    %r12d,%eax
  180060:	7d e5                	jge    180047 <process_main()+0x47>
#else
        for (int i = 0; i < p; i++) {
#endif
            if (heap_top == stack_bottom
  180062:	48 8b 3d 9f 1f 00 00 	mov    0x1f9f(%rip),%rdi        # 182008 <heap_top>
                || sys_page_alloc(heap_top) < 0) {
  180069:	48 3b 3d 90 1f 00 00 	cmp    0x1f90(%rip),%rdi        # 182000 <stack_bottom>
  180070:	74 28                	je     18009a <process_main()+0x9a>
    register uintptr_t rax asm("rax") = syscallno;
  180072:	b8 04 00 00 00       	mov    $0x4,%eax
            : "cc", "memory", "rcx", "rdx", "rsi", "r8", "r9", "r10", "r11");
  180077:	0f 05                	syscall 
  180079:	85 c0                	test   %eax,%eax
  18007b:	78 1d                	js     18009a <process_main()+0x9a>
                break;
            }
            *heap_top = p;               // check we can write to new page
  18007d:	48 8b 05 84 1f 00 00 	mov    0x1f84(%rip),%rax        # 182008 <heap_top>
  180084:	88 18                	mov    %bl,(%rax)
            console[CPOS(24, 79)] = p;   // check we can write to console
  180086:	66 89 1d 11 8f f3 ff 	mov    %bx,-0xc70ef(%rip)        # b8f9e <console+0xf9e>
            heap_top += PAGESIZE;
  18008d:	48 81 05 70 1f 00 00 	addq   $0x1000,0x1f70(%rip)        # 182008 <heap_top>
  180094:	00 10 00 00 
  180098:	eb ad                	jmp    180047 <process_main()+0x47>
    register uintptr_t rax asm("rax") = syscallno;
  18009a:	b8 02 00 00 00       	mov    $0x2,%eax
              "r10", "r11");
  18009f:	0f 05                	syscall 
    return rax;
  1800a1:	eb f7                	jmp    18009a <process_main()+0x9a>

00000000001800a3 <memmove>:
        *d = *s;
    }
    return dst;
}

void* memmove(void* dst, const void* src, size_t n) {
  1800a3:	f3 0f 1e fa          	endbr64 
  1800a7:	48 89 f8             	mov    %rdi,%rax
    const char* s = (const char*) src;
    char* d = (char*) dst;
    if (s < d && s + n > d) {
  1800aa:	48 39 fe             	cmp    %rdi,%rsi
  1800ad:	73 09                	jae    1800b8 <memmove+0x15>
  1800af:	48 8d 0c 16          	lea    (%rsi,%rdx,1),%rcx
  1800b3:	48 39 cf             	cmp    %rcx,%rdi
  1800b6:	72 1d                	jb     1800d5 <memmove+0x32>
        s += n, d += n;
        while (n-- > 0) {
            *--d = *--s;
        }
    } else {
        while (n-- > 0) {
  1800b8:	b9 00 00 00 00       	mov    $0x0,%ecx
  1800bd:	48 85 d2             	test   %rdx,%rdx
  1800c0:	74 12                	je     1800d4 <memmove+0x31>
            *d++ = *s++;
  1800c2:	0f b6 3c 0e          	movzbl (%rsi,%rcx,1),%edi
  1800c6:	40 88 3c 08          	mov    %dil,(%rax,%rcx,1)
        while (n-- > 0) {
  1800ca:	48 83 c1 01          	add    $0x1,%rcx
  1800ce:	48 39 d1             	cmp    %rdx,%rcx
  1800d1:	75 ef                	jne    1800c2 <memmove+0x1f>
        }
    }
    return dst;
}
  1800d3:	c3                   	retq   
  1800d4:	c3                   	retq   
        while (n-- > 0) {
  1800d5:	48 8d 4a ff          	lea    -0x1(%rdx),%rcx
  1800d9:	48 85 d2             	test   %rdx,%rdx
  1800dc:	74 f5                	je     1800d3 <memmove+0x30>
            *--d = *--s;
  1800de:	0f b6 14 0e          	movzbl (%rsi,%rcx,1),%edx
  1800e2:	88 14 08             	mov    %dl,(%rax,%rcx,1)
        while (n-- > 0) {
  1800e5:	48 83 e9 01          	sub    $0x1,%rcx
  1800e9:	48 83 f9 ff          	cmp    $0xffffffffffffffff,%rcx
  1800ed:	75 ef                	jne    1800de <memmove+0x3b>
  1800ef:	c3                   	retq   

00000000001800f0 <memset>:

void* memset(void* v, int c, size_t n) {
  1800f0:	f3 0f 1e fa          	endbr64 
  1800f4:	48 89 f8             	mov    %rdi,%rax
    for (char* p = (char*) v; n > 0; ++p, --n) {
  1800f7:	48 85 d2             	test   %rdx,%rdx
  1800fa:	74 13                	je     18010f <memset+0x1f>
  1800fc:	48 8d 0c 17          	lea    (%rdi,%rdx,1),%rcx
  180100:	48 89 fa             	mov    %rdi,%rdx
        *p = c;
  180103:	40 88 32             	mov    %sil,(%rdx)
    for (char* p = (char*) v; n > 0; ++p, --n) {
  180106:	48 83 c2 01          	add    $0x1,%rdx
  18010a:	48 39 d1             	cmp    %rdx,%rcx
  18010d:	75 f4                	jne    180103 <memset+0x13>
    }
    return v;
}
  18010f:	c3                   	retq   

0000000000180110 <strlen>:
        }
    }
    return nullptr;
}

size_t strlen(const char* s) {
  180110:	f3 0f 1e fa          	endbr64 
    size_t n;
    for (n = 0; *s != '\0'; ++s) {
  180114:	80 3f 00             	cmpb   $0x0,(%rdi)
  180117:	74 10                	je     180129 <strlen+0x19>
  180119:	b8 00 00 00 00       	mov    $0x0,%eax
        ++n;
  18011e:	48 83 c0 01          	add    $0x1,%rax
    for (n = 0; *s != '\0'; ++s) {
  180122:	80 3c 07 00          	cmpb   $0x0,(%rdi,%rax,1)
  180126:	75 f6                	jne    18011e <strlen+0xe>
  180128:	c3                   	retq   
  180129:	b8 00 00 00 00       	mov    $0x0,%eax
    }
    return n;
}
  18012e:	c3                   	retq   

000000000018012f <strnlen>:

size_t strnlen(const char* s, size_t maxlen) {
  18012f:	f3 0f 1e fa          	endbr64 
    size_t n;
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
  180133:	48 85 f6             	test   %rsi,%rsi
  180136:	74 15                	je     18014d <strnlen+0x1e>
  180138:	b8 00 00 00 00       	mov    $0x0,%eax
  18013d:	80 3c 07 00          	cmpb   $0x0,(%rdi,%rax,1)
  180141:	74 0d                	je     180150 <strnlen+0x21>
        ++n;
  180143:	48 83 c0 01          	add    $0x1,%rax
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
  180147:	48 39 c6             	cmp    %rax,%rsi
  18014a:	75 f1                	jne    18013d <strnlen+0xe>
  18014c:	c3                   	retq   
  18014d:	48 89 f0             	mov    %rsi,%rax
    }
    return n;
}
  180150:	c3                   	retq   

0000000000180151 <strchr>:
        }
        ++a, ++b, --n;
    }
}

char* strchr(const char* s, int c) {
  180151:	f3 0f 1e fa          	endbr64 
    while (*s && *s != (char) c) {
  180155:	0f b6 07             	movzbl (%rdi),%eax
  180158:	84 c0                	test   %al,%al
  18015a:	74 10                	je     18016c <strchr+0x1b>
  18015c:	40 38 f0             	cmp    %sil,%al
  18015f:	74 18                	je     180179 <strchr+0x28>
        ++s;
  180161:	48 83 c7 01          	add    $0x1,%rdi
    while (*s && *s != (char) c) {
  180165:	0f b6 07             	movzbl (%rdi),%eax
  180168:	84 c0                	test   %al,%al
  18016a:	75 f0                	jne    18015c <strchr+0xb>
    }
    if (*s == (char) c) {
        return (char*) s;
    } else {
        return nullptr;
  18016c:	40 84 f6             	test   %sil,%sil
  18016f:	b8 00 00 00 00       	mov    $0x0,%eax
  180174:	48 0f 44 c7          	cmove  %rdi,%rax
  180178:	c3                   	retq   
  180179:	48 89 f8             	mov    %rdi,%rax
    }
}
  18017c:	c3                   	retq   

000000000018017d <rand()>:
// rand, srand

static int rand_seed_set;
static unsigned long rand_seed;

int rand() {
  18017d:	f3 0f 1e fa          	endbr64 
    if (!rand_seed_set) {
  180181:	83 3d 90 1e 00 00 00 	cmpl   $0x0,0x1e90(%rip)        # 182018 <rand_seed_set>
  180188:	74 27                	je     1801b1 <rand()+0x34>
        srand(819234718U);
    }
    rand_seed = rand_seed * 6364136223846793005UL + 1;
  18018a:	48 b8 2d 7f 95 4c 2d 	movabs $0x5851f42d4c957f2d,%rax
  180191:	f4 51 58 
  180194:	48 0f af 05 74 1e 00 	imul   0x1e74(%rip),%rax        # 182010 <rand_seed>
  18019b:	00 
  18019c:	48 83 c0 01          	add    $0x1,%rax
  1801a0:	48 89 05 69 1e 00 00 	mov    %rax,0x1e69(%rip)        # 182010 <rand_seed>
    return (rand_seed >> 32) & RAND_MAX;
  1801a7:	48 c1 e8 20          	shr    $0x20,%rax
  1801ab:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
}
  1801b0:	c3                   	retq   

void srand(unsigned seed) {
    rand_seed = ((unsigned long) seed << 32) | seed;
  1801b1:	48 b8 9e 87 d4 30 9e 	movabs $0x30d4879e30d4879e,%rax
  1801b8:	87 d4 30 
  1801bb:	48 89 05 4e 1e 00 00 	mov    %rax,0x1e4e(%rip)        # 182010 <rand_seed>
    rand_seed_set = 1;
  1801c2:	c7 05 4c 1e 00 00 01 	movl   $0x1,0x1e4c(%rip)        # 182018 <rand_seed_set>
  1801c9:	00 00 00 
}
  1801cc:	eb bc                	jmp    18018a <rand()+0xd>

00000000001801ce <srand(unsigned int)>:
void srand(unsigned seed) {
  1801ce:	f3 0f 1e fa          	endbr64 
    rand_seed = ((unsigned long) seed << 32) | seed;
  1801d2:	89 f8                	mov    %edi,%eax
  1801d4:	48 c1 e7 20          	shl    $0x20,%rdi
  1801d8:	48 09 c7             	or     %rax,%rdi
  1801db:	48 89 3d 2e 1e 00 00 	mov    %rdi,0x1e2e(%rip)        # 182010 <rand_seed>
    rand_seed_set = 1;
  1801e2:	c7 05 2c 1e 00 00 01 	movl   $0x1,0x1e2c(%rip)        # 182018 <rand_seed_set>
  1801e9:	00 00 00 
}
  1801ec:	c3                   	retq   

00000000001801ed <rand(int, int)>:

// rand(min, max)
//    Return a pseudorandom number roughly evenly distributed between
//    `min` and `max`, inclusive. Requires `min <= max` and
//    `max - min <= RAND_MAX`.
int rand(int min, int max) {
  1801ed:	f3 0f 1e fa          	endbr64 
  1801f1:	55                   	push   %rbp
  1801f2:	48 89 e5             	mov    %rsp,%rbp
  1801f5:	41 54                	push   %r12
  1801f7:	53                   	push   %rbx
    assert(min <= max);
  1801f8:	39 f7                	cmp    %esi,%edi
  1801fa:	7f 27                	jg     180223 <rand(int, int)+0x36>
  1801fc:	41 89 fc             	mov    %edi,%r12d
  1801ff:	89 f3                	mov    %esi,%ebx
    assert(max - min <= RAND_MAX);

    unsigned long r = rand();
  180201:	e8 77 ff ff ff       	callq  18017d <rand()>
  180206:	89 c2                	mov    %eax,%edx
    return min + (r * (max - min + 1)) / ((unsigned long) RAND_MAX + 1);
  180208:	44 29 e3             	sub    %r12d,%ebx
  18020b:	8d 43 01             	lea    0x1(%rbx),%eax
  18020e:	48 98                	cltq   
    unsigned long r = rand();
  180210:	48 63 da             	movslq %edx,%rbx
    return min + (r * (max - min + 1)) / ((unsigned long) RAND_MAX + 1);
  180213:	48 0f af c3          	imul   %rbx,%rax
  180217:	48 c1 e8 1f          	shr    $0x1f,%rax
  18021b:	44 01 e0             	add    %r12d,%eax
}
  18021e:	5b                   	pop    %rbx
  18021f:	41 5c                	pop    %r12
  180221:	5d                   	pop    %rbp
  180222:	c3                   	retq   
    assert(min <= max);
  180223:	b9 00 00 00 00       	mov    $0x0,%ecx
  180228:	ba f0 0c 18 00       	mov    $0x180cf0,%edx
  18022d:	be ff 00 00 00       	mov    $0xff,%esi
  180232:	bf fb 0c 18 00       	mov    $0x180cfb,%edi
  180237:	e8 53 0a 00 00       	callq  180c8f <assert_fail(char const*, int, char const*, char const*)>

000000000018023c <printer::vprintf(int, char const*, __va_list_tag*)>:
#define FLAG_NUMERIC            (1<<5)
#define FLAG_SIGNED             (1<<6)
#define FLAG_NEGATIVE           (1<<7)
#define FLAG_ALT2               (1<<8)

void printer::vprintf(int color, const char* format, va_list val) {
  18023c:	f3 0f 1e fa          	endbr64 
  180240:	55                   	push   %rbp
  180241:	48 89 e5             	mov    %rsp,%rbp
  180244:	41 57                	push   %r15
  180246:	41 56                	push   %r14
  180248:	41 55                	push   %r13
  18024a:	41 54                	push   %r12
  18024c:	53                   	push   %rbx
  18024d:	48 83 ec 58          	sub    $0x58,%rsp
  180251:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
#define NUMBUFSIZ 24
    char numbuf[NUMBUFSIZ];

    for (; *format; ++format) {
  180255:	0f b6 02             	movzbl (%rdx),%eax
  180258:	84 c0                	test   %al,%al
  18025a:	0f 84 c6 07 00 00    	je     180a26 <printer::vprintf(int, char const*, __va_list_tag*)+0x7ea>
  180260:	49 89 fe             	mov    %rdi,%r14
  180263:	41 89 f7             	mov    %esi,%r15d
  180266:	48 89 d3             	mov    %rdx,%rbx
  180269:	e9 b9 03 00 00       	jmpq   180627 <printer::vprintf(int, char const*, __va_list_tag*)+0x3eb>
            continue;
        }

        // process flags
        int flags = 0;
        for (++format; *format; ++format) {
  18026e:	4c 8d 63 01          	lea    0x1(%rbx),%r12
  180272:	0f b6 5b 01          	movzbl 0x1(%rbx),%ebx
  180276:	84 db                	test   %bl,%bl
  180278:	0f 84 8a 07 00 00    	je     180a08 <printer::vprintf(int, char const*, __va_list_tag*)+0x7cc>
        int flags = 0;
  18027e:	41 bd 00 00 00 00    	mov    $0x0,%r13d
            const char* flagc = strchr(flag_chars, *format);
  180284:	0f be f3             	movsbl %bl,%esi
  180287:	bf d0 13 18 00       	mov    $0x1813d0,%edi
  18028c:	e8 c0 fe ff ff       	callq  180151 <strchr>
  180291:	48 89 c1             	mov    %rax,%rcx
            if (flagc) {
  180294:	48 85 c0             	test   %rax,%rax
  180297:	74 74                	je     18030d <printer::vprintf(int, char const*, __va_list_tag*)+0xd1>
                flags |= 1 << (flagc - flag_chars);
  180299:	48 81 e9 d0 13 18 00 	sub    $0x1813d0,%rcx
  1802a0:	b8 01 00 00 00       	mov    $0x1,%eax
  1802a5:	d3 e0                	shl    %cl,%eax
  1802a7:	41 09 c5             	or     %eax,%r13d
        for (++format; *format; ++format) {
  1802aa:	49 83 c4 01          	add    $0x1,%r12
  1802ae:	41 0f b6 1c 24       	movzbl (%r12),%ebx
  1802b3:	84 db                	test   %bl,%bl
  1802b5:	75 cd                	jne    180284 <printer::vprintf(int, char const*, __va_list_tag*)+0x48>
                break;
            }
        }

        // process width
        int width = -1;
  1802b7:	c7 45 98 ff ff ff ff 	movl   $0xffffffff,-0x68(%rbp)
            width = va_arg(val, int);
            ++format;
        }

        // process precision
        int precision = -1;
  1802be:	c7 45 a4 ff ff ff ff 	movl   $0xffffffff,-0x5c(%rbp)
        if (*format == '.') {
  1802c5:	41 80 3c 24 2e       	cmpb   $0x2e,(%r12)
  1802ca:	0f 84 cc 00 00 00    	je     18039c <printer::vprintf(int, char const*, __va_list_tag*)+0x160>
            }
        }

        // process length
        int length = 0;
        switch (*format) {
  1802d0:	41 0f b6 04 24       	movzbl (%r12),%eax
  1802d5:	3c 6c                	cmp    $0x6c,%al
  1802d7:	0f 84 54 01 00 00    	je     180431 <printer::vprintf(int, char const*, __va_list_tag*)+0x1f5>
  1802dd:	0f 8f 42 01 00 00    	jg     180425 <printer::vprintf(int, char const*, __va_list_tag*)+0x1e9>
  1802e3:	3c 68                	cmp    $0x68,%al
  1802e5:	0f 85 68 01 00 00    	jne    180453 <printer::vprintf(int, char const*, __va_list_tag*)+0x217>
        case 'z': // size_t, ssize_t
            length = 1;
            ++format;
            break;
        case 'h':
            ++format;
  1802eb:	49 8d 4c 24 01       	lea    0x1(%r12),%rcx
        // process main conversion character
        int base = 10;
        unsigned long num = 0;
        const char* data = "";

        switch (*format) {
  1802f0:	41 0f b6 44 24 01    	movzbl 0x1(%r12),%eax
  1802f6:	8d 50 bd             	lea    -0x43(%rax),%edx
  1802f9:	80 fa 35             	cmp    $0x35,%dl
  1802fc:	0f 87 aa 05 00 00    	ja     1808ac <printer::vprintf(int, char const*, __va_list_tag*)+0x670>
  180302:	0f b6 d2             	movzbl %dl,%edx
  180305:	3e ff 24 d5 10 0d 18 	notrack jmpq *0x180d10(,%rdx,8)
  18030c:	00 
        if (*format >= '1' && *format <= '9') {
  18030d:	8d 43 cf             	lea    -0x31(%rbx),%eax
  180310:	3c 08                	cmp    $0x8,%al
  180312:	77 35                	ja     180349 <printer::vprintf(int, char const*, __va_list_tag*)+0x10d>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  180314:	41 0f b6 04 24       	movzbl (%r12),%eax
  180319:	8d 50 d0             	lea    -0x30(%rax),%edx
  18031c:	80 fa 09             	cmp    $0x9,%dl
  18031f:	77 63                	ja     180384 <printer::vprintf(int, char const*, __va_list_tag*)+0x148>
  180321:	ba 00 00 00 00       	mov    $0x0,%edx
                width = 10 * width + *format++ - '0';
  180326:	49 83 c4 01          	add    $0x1,%r12
  18032a:	8d 14 92             	lea    (%rdx,%rdx,4),%edx
  18032d:	0f be c0             	movsbl %al,%eax
  180330:	8d 54 50 d0          	lea    -0x30(%rax,%rdx,2),%edx
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  180334:	41 0f b6 04 24       	movzbl (%r12),%eax
  180339:	8d 48 d0             	lea    -0x30(%rax),%ecx
  18033c:	80 f9 09             	cmp    $0x9,%cl
  18033f:	76 e5                	jbe    180326 <printer::vprintf(int, char const*, __va_list_tag*)+0xea>
  180341:	89 55 98             	mov    %edx,-0x68(%rbp)
  180344:	e9 75 ff ff ff       	jmpq   1802be <printer::vprintf(int, char const*, __va_list_tag*)+0x82>
        } else if (*format == '*') {
  180349:	80 fb 2a             	cmp    $0x2a,%bl
  18034c:	75 42                	jne    180390 <printer::vprintf(int, char const*, __va_list_tag*)+0x154>
            width = va_arg(val, int);
  18034e:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  180352:	8b 07                	mov    (%rdi),%eax
  180354:	83 f8 2f             	cmp    $0x2f,%eax
  180357:	77 19                	ja     180372 <printer::vprintf(int, char const*, __va_list_tag*)+0x136>
  180359:	89 c2                	mov    %eax,%edx
  18035b:	48 03 57 10          	add    0x10(%rdi),%rdx
  18035f:	83 c0 08             	add    $0x8,%eax
  180362:	89 07                	mov    %eax,(%rdi)
  180364:	8b 02                	mov    (%rdx),%eax
  180366:	89 45 98             	mov    %eax,-0x68(%rbp)
            ++format;
  180369:	49 83 c4 01          	add    $0x1,%r12
  18036d:	e9 4c ff ff ff       	jmpq   1802be <printer::vprintf(int, char const*, __va_list_tag*)+0x82>
            width = va_arg(val, int);
  180372:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  180376:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  18037a:	48 8d 42 08          	lea    0x8(%rdx),%rax
  18037e:	48 89 47 08          	mov    %rax,0x8(%rdi)
  180382:	eb e0                	jmp    180364 <printer::vprintf(int, char const*, __va_list_tag*)+0x128>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  180384:	c7 45 98 00 00 00 00 	movl   $0x0,-0x68(%rbp)
  18038b:	e9 2e ff ff ff       	jmpq   1802be <printer::vprintf(int, char const*, __va_list_tag*)+0x82>
        int width = -1;
  180390:	c7 45 98 ff ff ff ff 	movl   $0xffffffff,-0x68(%rbp)
  180397:	e9 22 ff ff ff       	jmpq   1802be <printer::vprintf(int, char const*, __va_list_tag*)+0x82>
            ++format;
  18039c:	49 8d 54 24 01       	lea    0x1(%r12),%rdx
            if (*format >= '0' && *format <= '9') {
  1803a1:	41 0f b6 44 24 01    	movzbl 0x1(%r12),%eax
  1803a7:	8d 48 d0             	lea    -0x30(%rax),%ecx
  1803aa:	80 f9 09             	cmp    $0x9,%cl
  1803ad:	76 13                	jbe    1803c2 <printer::vprintf(int, char const*, __va_list_tag*)+0x186>
            } else if (*format == '*') {
  1803af:	3c 2a                	cmp    $0x2a,%al
  1803b1:	74 32                	je     1803e5 <printer::vprintf(int, char const*, __va_list_tag*)+0x1a9>
            ++format;
  1803b3:	49 89 d4             	mov    %rdx,%r12
                precision = 0;
  1803b6:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%rbp)
  1803bd:	e9 0e ff ff ff       	jmpq   1802d0 <printer::vprintf(int, char const*, __va_list_tag*)+0x94>
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
  1803c2:	be 00 00 00 00       	mov    $0x0,%esi
                    precision = 10 * precision + *format++ - '0';
  1803c7:	48 83 c2 01          	add    $0x1,%rdx
  1803cb:	8d 0c b6             	lea    (%rsi,%rsi,4),%ecx
  1803ce:	0f be c0             	movsbl %al,%eax
  1803d1:	8d 74 48 d0          	lea    -0x30(%rax,%rcx,2),%esi
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
  1803d5:	0f b6 02             	movzbl (%rdx),%eax
  1803d8:	8d 48 d0             	lea    -0x30(%rax),%ecx
  1803db:	80 f9 09             	cmp    $0x9,%cl
  1803de:	76 e7                	jbe    1803c7 <printer::vprintf(int, char const*, __va_list_tag*)+0x18b>
                    precision = 10 * precision + *format++ - '0';
  1803e0:	49 89 d4             	mov    %rdx,%r12
  1803e3:	eb 1c                	jmp    180401 <printer::vprintf(int, char const*, __va_list_tag*)+0x1c5>
                precision = va_arg(val, int);
  1803e5:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1803e9:	8b 01                	mov    (%rcx),%eax
  1803eb:	83 f8 2f             	cmp    $0x2f,%eax
  1803ee:	77 23                	ja     180413 <printer::vprintf(int, char const*, __va_list_tag*)+0x1d7>
  1803f0:	89 c2                	mov    %eax,%edx
  1803f2:	48 03 51 10          	add    0x10(%rcx),%rdx
  1803f6:	83 c0 08             	add    $0x8,%eax
  1803f9:	89 01                	mov    %eax,(%rcx)
  1803fb:	8b 32                	mov    (%rdx),%esi
                ++format;
  1803fd:	49 83 c4 02          	add    $0x2,%r12
            if (precision < 0) {
  180401:	85 f6                	test   %esi,%esi
  180403:	b8 00 00 00 00       	mov    $0x0,%eax
  180408:	0f 49 c6             	cmovns %esi,%eax
  18040b:	89 45 a4             	mov    %eax,-0x5c(%rbp)
  18040e:	e9 bd fe ff ff       	jmpq   1802d0 <printer::vprintf(int, char const*, __va_list_tag*)+0x94>
                precision = va_arg(val, int);
  180413:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  180417:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  18041b:	48 8d 42 08          	lea    0x8(%rdx),%rax
  18041f:	48 89 47 08          	mov    %rax,0x8(%rdi)
  180423:	eb d6                	jmp    1803fb <printer::vprintf(int, char const*, __va_list_tag*)+0x1bf>
        switch (*format) {
  180425:	3c 74                	cmp    $0x74,%al
  180427:	74 08                	je     180431 <printer::vprintf(int, char const*, __va_list_tag*)+0x1f5>
  180429:	3c 7a                	cmp    $0x7a,%al
  18042b:	0f 85 e2 05 00 00    	jne    180a13 <printer::vprintf(int, char const*, __va_list_tag*)+0x7d7>
            ++format;
  180431:	49 8d 4c 24 01       	lea    0x1(%r12),%rcx
        switch (*format) {
  180436:	41 0f b6 44 24 01    	movzbl 0x1(%r12),%eax
  18043c:	8d 50 bd             	lea    -0x43(%rax),%edx
  18043f:	80 fa 35             	cmp    $0x35,%dl
  180442:	0f 87 64 04 00 00    	ja     1808ac <printer::vprintf(int, char const*, __va_list_tag*)+0x670>
  180448:	0f b6 d2             	movzbl %dl,%edx
  18044b:	3e ff 24 d5 c0 0e 18 	notrack jmpq *0x180ec0(,%rdx,8)
  180452:	00 
  180453:	8d 50 bd             	lea    -0x43(%rax),%edx
  180456:	80 fa 35             	cmp    $0x35,%dl
  180459:	0f 87 4a 04 00 00    	ja     1808a9 <printer::vprintf(int, char const*, __va_list_tag*)+0x66d>
  18045f:	0f b6 d2             	movzbl %dl,%edx
  180462:	3e ff 24 d5 70 10 18 	notrack jmpq *0x181070(,%rdx,8)
  180469:	00 
        case 'd':
        case 'i': {
            long x = length ? va_arg(val, long) : va_arg(val, int);
  18046a:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  18046e:	8b 07                	mov    (%rdi),%eax
  180470:	83 f8 2f             	cmp    $0x2f,%eax
  180473:	0f 87 c9 01 00 00    	ja     180642 <printer::vprintf(int, char const*, __va_list_tag*)+0x406>
  180479:	89 c2                	mov    %eax,%edx
  18047b:	48 03 57 10          	add    0x10(%rdi),%rdx
  18047f:	83 c0 08             	add    $0x8,%eax
  180482:	89 07                	mov    %eax,(%rdi)
  180484:	48 8b 12             	mov    (%rdx),%rdx
  180487:	49 89 cc             	mov    %rcx,%r12
            int negative = x < 0 ? FLAG_NEGATIVE : 0;
  18048a:	48 89 d0             	mov    %rdx,%rax
  18048d:	48 c1 f8 38          	sar    $0x38,%rax
            num = negative ? -x : x;
  180491:	49 89 d0             	mov    %rdx,%r8
  180494:	49 f7 d8             	neg    %r8
  180497:	25 80 00 00 00       	and    $0x80,%eax
  18049c:	4c 0f 44 c2          	cmove  %rdx,%r8
            flags |= FLAG_NUMERIC | FLAG_SIGNED | negative;
  1804a0:	41 09 c5             	or     %eax,%r13d
  1804a3:	41 83 cd 60          	or     $0x60,%r13d
        const char* data = "";
  1804a7:	bb a5 14 18 00       	mov    $0x1814a5,%ebx
                format--;
            }
            break;
        }

        if (flags & FLAG_NUMERIC) {
  1804ac:	44 89 e8             	mov    %r13d,%eax
  1804af:	83 e0 20             	and    $0x20,%eax
  1804b2:	89 45 9c             	mov    %eax,-0x64(%rbp)
  1804b5:	41 b9 0a 00 00 00    	mov    $0xa,%r9d
  1804bb:	0f 85 0e 04 00 00    	jne    1808cf <printer::vprintf(int, char const*, __va_list_tag*)+0x693>
            data = fill_numbuf(numbuf + NUMBUFSIZ, num, base);
        }

        const char* prefix = "";
        if ((flags & FLAG_NUMERIC) && (flags & FLAG_SIGNED)) {
  1804c1:	44 89 6d 8c          	mov    %r13d,-0x74(%rbp)
  1804c5:	44 89 e8             	mov    %r13d,%eax
  1804c8:	83 e0 60             	and    $0x60,%eax
  1804cb:	83 f8 60             	cmp    $0x60,%eax
  1804ce:	0f 84 3e 04 00 00    	je     180912 <printer::vprintf(int, char const*, __va_list_tag*)+0x6d6>
            } else if (flags & FLAG_PLUSPOSITIVE) {
                prefix = "+";
            } else if (flags & FLAG_SPACEPOSITIVE) {
                prefix = " ";
            }
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
  1804d4:	44 89 e8             	mov    %r13d,%eax
  1804d7:	83 e0 21             	and    $0x21,%eax
        const char* prefix = "";
  1804da:	48 c7 45 a8 a5 14 18 	movq   $0x1814a5,-0x58(%rbp)
  1804e1:	00 
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
  1804e2:	83 f8 21             	cmp    $0x21,%eax
  1804e5:	0f 84 66 04 00 00    	je     180951 <printer::vprintf(int, char const*, __va_list_tag*)+0x715>
                   && (num || (flags & FLAG_ALT2))) {
            prefix = (base == -16 ? "0x" : "0X");
        }

        int datalen;
        if (precision >= 0 && !(flags & FLAG_NUMERIC)) {
  1804eb:	8b 4d a4             	mov    -0x5c(%rbp),%ecx
  1804ee:	89 c8                	mov    %ecx,%eax
  1804f0:	f7 d0                	not    %eax
  1804f2:	c1 e8 1f             	shr    $0x1f,%eax
  1804f5:	89 45 88             	mov    %eax,-0x78(%rbp)
  1804f8:	83 7d 9c 00          	cmpl   $0x0,-0x64(%rbp)
  1804fc:	0f 85 8b 04 00 00    	jne    18098d <printer::vprintf(int, char const*, __va_list_tag*)+0x751>
  180502:	84 c0                	test   %al,%al
  180504:	0f 84 83 04 00 00    	je     18098d <printer::vprintf(int, char const*, __va_list_tag*)+0x751>
            datalen = strnlen(data, precision);
  18050a:	48 63 f1             	movslq %ecx,%rsi
  18050d:	48 89 df             	mov    %rbx,%rdi
  180510:	e8 1a fc ff ff       	callq  18012f <strnlen>
  180515:	89 45 a0             	mov    %eax,-0x60(%rbp)
        if ((flags & FLAG_NUMERIC)
            && precision >= 0) {
            zeros = precision > datalen ? precision - datalen : 0;
        } else if ((flags & FLAG_NUMERIC)
                   && (flags & FLAG_ZERO)
                   && !(flags & FLAG_LEFTJUSTIFY)
  180518:	8b 45 8c             	mov    -0x74(%rbp),%eax
  18051b:	83 e0 26             	and    $0x26,%eax
                   && datalen + (int) strlen(prefix) < width) {
            zeros = width - datalen - strlen(prefix);
        } else {
            zeros = 0;
  18051e:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%rbp)
                   && datalen + (int) strlen(prefix) < width) {
  180525:	83 f8 22             	cmp    $0x22,%eax
  180528:	0f 84 97 04 00 00    	je     1809c5 <printer::vprintf(int, char const*, __va_list_tag*)+0x789>
        }

        width -= datalen + zeros + strlen(prefix);
  18052e:	48 8b 7d a8          	mov    -0x58(%rbp),%rdi
  180532:	e8 d9 fb ff ff       	callq  180110 <strlen>
  180537:	8b 55 a4             	mov    -0x5c(%rbp),%edx
  18053a:	03 55 a0             	add    -0x60(%rbp),%edx
  18053d:	8b 7d 98             	mov    -0x68(%rbp),%edi
  180540:	29 d7                	sub    %edx,%edi
  180542:	89 fa                	mov    %edi,%edx
  180544:	29 c2                	sub    %eax,%edx
  180546:	89 55 98             	mov    %edx,-0x68(%rbp)
  180549:	89 55 9c             	mov    %edx,-0x64(%rbp)
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
  18054c:	41 f6 c5 04          	test   $0x4,%r13b
  180550:	75 32                	jne    180584 <printer::vprintf(int, char const*, __va_list_tag*)+0x348>
        width -= datalen + zeros + strlen(prefix);
  180552:	41 89 d5             	mov    %edx,%r13d
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
  180555:	85 d2                	test   %edx,%edx
  180557:	7e 2b                	jle    180584 <printer::vprintf(int, char const*, __va_list_tag*)+0x348>
            putc(' ', color);
  180559:	49 8b 06             	mov    (%r14),%rax
  18055c:	44 89 fa             	mov    %r15d,%edx
  18055f:	be 20 00 00 00       	mov    $0x20,%esi
  180564:	4c 89 f7             	mov    %r14,%rdi
  180567:	ff 10                	callq  *(%rax)
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
  180569:	41 83 ed 01          	sub    $0x1,%r13d
  18056d:	45 85 ed             	test   %r13d,%r13d
  180570:	7f e7                	jg     180559 <printer::vprintf(int, char const*, __va_list_tag*)+0x31d>
  180572:	8b 7d 98             	mov    -0x68(%rbp),%edi
  180575:	85 ff                	test   %edi,%edi
  180577:	b8 01 00 00 00       	mov    $0x1,%eax
  18057c:	0f 4f c7             	cmovg  %edi,%eax
  18057f:	29 c7                	sub    %eax,%edi
  180581:	89 7d 9c             	mov    %edi,-0x64(%rbp)
        }
        for (; *prefix; ++prefix) {
  180584:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  180588:	0f b6 00             	movzbl (%rax),%eax
  18058b:	4c 8b 6d a8          	mov    -0x58(%rbp),%r13
  18058f:	84 c0                	test   %al,%al
  180591:	74 1b                	je     1805ae <printer::vprintf(int, char const*, __va_list_tag*)+0x372>
            putc(*prefix, color);
  180593:	0f b6 f0             	movzbl %al,%esi
  180596:	49 8b 06             	mov    (%r14),%rax
  180599:	44 89 fa             	mov    %r15d,%edx
  18059c:	4c 89 f7             	mov    %r14,%rdi
  18059f:	ff 10                	callq  *(%rax)
        for (; *prefix; ++prefix) {
  1805a1:	49 83 c5 01          	add    $0x1,%r13
  1805a5:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
  1805aa:	84 c0                	test   %al,%al
  1805ac:	75 e5                	jne    180593 <printer::vprintf(int, char const*, __va_list_tag*)+0x357>
        }
        for (; zeros > 0; --zeros) {
  1805ae:	44 8b 6d a4          	mov    -0x5c(%rbp),%r13d
  1805b2:	83 7d a4 00          	cmpl   $0x0,-0x5c(%rbp)
  1805b6:	7e 16                	jle    1805ce <printer::vprintf(int, char const*, __va_list_tag*)+0x392>
            putc('0', color);
  1805b8:	49 8b 06             	mov    (%r14),%rax
  1805bb:	44 89 fa             	mov    %r15d,%edx
  1805be:	be 30 00 00 00       	mov    $0x30,%esi
  1805c3:	4c 89 f7             	mov    %r14,%rdi
  1805c6:	ff 10                	callq  *(%rax)
        for (; zeros > 0; --zeros) {
  1805c8:	41 83 ed 01          	sub    $0x1,%r13d
  1805cc:	75 ea                	jne    1805b8 <printer::vprintf(int, char const*, __va_list_tag*)+0x37c>
        }
        for (; datalen > 0; ++data, --datalen) {
  1805ce:	83 7d a0 00          	cmpl   $0x0,-0x60(%rbp)
  1805d2:	7e 22                	jle    1805f6 <printer::vprintf(int, char const*, __va_list_tag*)+0x3ba>
  1805d4:	8b 45 a0             	mov    -0x60(%rbp),%eax
  1805d7:	8d 40 ff             	lea    -0x1(%rax),%eax
  1805da:	4c 8d 6c 03 01       	lea    0x1(%rbx,%rax,1),%r13
            putc(*data, color);
  1805df:	0f b6 33             	movzbl (%rbx),%esi
  1805e2:	49 8b 06             	mov    (%r14),%rax
  1805e5:	44 89 fa             	mov    %r15d,%edx
  1805e8:	4c 89 f7             	mov    %r14,%rdi
  1805eb:	ff 10                	callq  *(%rax)
        for (; datalen > 0; ++data, --datalen) {
  1805ed:	48 83 c3 01          	add    $0x1,%rbx
  1805f1:	4c 39 eb             	cmp    %r13,%rbx
  1805f4:	75 e9                	jne    1805df <printer::vprintf(int, char const*, __va_list_tag*)+0x3a3>
        }
        for (; width > 0; --width) {
  1805f6:	8b 5d 9c             	mov    -0x64(%rbp),%ebx
  1805f9:	83 7d 9c 00          	cmpl   $0x0,-0x64(%rbp)
  1805fd:	7e 15                	jle    180614 <printer::vprintf(int, char const*, __va_list_tag*)+0x3d8>
            putc(' ', color);
  1805ff:	49 8b 06             	mov    (%r14),%rax
  180602:	44 89 fa             	mov    %r15d,%edx
  180605:	be 20 00 00 00       	mov    $0x20,%esi
  18060a:	4c 89 f7             	mov    %r14,%rdi
  18060d:	ff 10                	callq  *(%rax)
        for (; width > 0; --width) {
  18060f:	83 eb 01             	sub    $0x1,%ebx
  180612:	75 eb                	jne    1805ff <printer::vprintf(int, char const*, __va_list_tag*)+0x3c3>
    for (; *format; ++format) {
  180614:	49 8d 5c 24 01       	lea    0x1(%r12),%rbx
  180619:	41 0f b6 44 24 01    	movzbl 0x1(%r12),%eax
  18061f:	84 c0                	test   %al,%al
  180621:	0f 84 ff 03 00 00    	je     180a26 <printer::vprintf(int, char const*, __va_list_tag*)+0x7ea>
        if (*format != '%') {
  180627:	3c 25                	cmp    $0x25,%al
  180629:	0f 84 3f fc ff ff    	je     18026e <printer::vprintf(int, char const*, __va_list_tag*)+0x32>
            putc(*format, color);
  18062f:	0f b6 f0             	movzbl %al,%esi
  180632:	49 8b 06             	mov    (%r14),%rax
  180635:	44 89 fa             	mov    %r15d,%edx
  180638:	4c 89 f7             	mov    %r14,%rdi
  18063b:	ff 10                	callq  *(%rax)
            continue;
  18063d:	49 89 dc             	mov    %rbx,%r12
  180640:	eb d2                	jmp    180614 <printer::vprintf(int, char const*, __va_list_tag*)+0x3d8>
            long x = length ? va_arg(val, long) : va_arg(val, int);
  180642:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  180646:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  18064a:	48 8d 42 08          	lea    0x8(%rdx),%rax
  18064e:	48 89 47 08          	mov    %rax,0x8(%rdi)
  180652:	e9 2d fe ff ff       	jmpq   180484 <printer::vprintf(int, char const*, __va_list_tag*)+0x248>
        switch (*format) {
  180657:	49 89 cc             	mov    %rcx,%r12
            long x = length ? va_arg(val, long) : va_arg(val, int);
  18065a:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  18065e:	8b 01                	mov    (%rcx),%eax
  180660:	83 f8 2f             	cmp    $0x2f,%eax
  180663:	77 13                	ja     180678 <printer::vprintf(int, char const*, __va_list_tag*)+0x43c>
  180665:	89 c2                	mov    %eax,%edx
  180667:	48 03 51 10          	add    0x10(%rcx),%rdx
  18066b:	83 c0 08             	add    $0x8,%eax
  18066e:	89 01                	mov    %eax,(%rcx)
  180670:	48 63 12             	movslq (%rdx),%rdx
  180673:	e9 12 fe ff ff       	jmpq   18048a <printer::vprintf(int, char const*, __va_list_tag*)+0x24e>
  180678:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  18067c:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  180680:	48 8d 42 08          	lea    0x8(%rdx),%rax
  180684:	48 89 41 08          	mov    %rax,0x8(%rcx)
  180688:	eb e6                	jmp    180670 <printer::vprintf(int, char const*, __va_list_tag*)+0x434>
        switch (*format) {
  18068a:	49 89 cc             	mov    %rcx,%r12
  18068d:	b8 01 00 00 00       	mov    $0x1,%eax
  180692:	be 0a 00 00 00       	mov    $0xa,%esi
  180697:	e9 a8 00 00 00       	jmpq   180744 <printer::vprintf(int, char const*, __va_list_tag*)+0x508>
  18069c:	49 89 cc             	mov    %rcx,%r12
  18069f:	b8 00 00 00 00       	mov    $0x0,%eax
  1806a4:	be 0a 00 00 00       	mov    $0xa,%esi
  1806a9:	e9 96 00 00 00       	jmpq   180744 <printer::vprintf(int, char const*, __va_list_tag*)+0x508>
        switch (*format) {
  1806ae:	b8 00 00 00 00       	mov    $0x0,%eax
  1806b3:	be 0a 00 00 00       	mov    $0xa,%esi
  1806b8:	e9 87 00 00 00       	jmpq   180744 <printer::vprintf(int, char const*, __va_list_tag*)+0x508>
  1806bd:	b8 00 00 00 00       	mov    $0x0,%eax
  1806c2:	be 0a 00 00 00       	mov    $0xa,%esi
  1806c7:	eb 7b                	jmp    180744 <printer::vprintf(int, char const*, __va_list_tag*)+0x508>
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
  1806c9:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1806cd:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  1806d1:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1806d5:	48 89 47 08          	mov    %rax,0x8(%rdi)
  1806d9:	e9 84 00 00 00       	jmpq   180762 <printer::vprintf(int, char const*, __va_list_tag*)+0x526>
  1806de:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1806e2:	8b 01                	mov    (%rcx),%eax
  1806e4:	83 f8 2f             	cmp    $0x2f,%eax
  1806e7:	77 10                	ja     1806f9 <printer::vprintf(int, char const*, __va_list_tag*)+0x4bd>
  1806e9:	89 c2                	mov    %eax,%edx
  1806eb:	48 03 51 10          	add    0x10(%rcx),%rdx
  1806ef:	83 c0 08             	add    $0x8,%eax
  1806f2:	89 01                	mov    %eax,(%rcx)
  1806f4:	44 8b 02             	mov    (%rdx),%r8d
  1806f7:	eb 6c                	jmp    180765 <printer::vprintf(int, char const*, __va_list_tag*)+0x529>
  1806f9:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1806fd:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  180701:	48 8d 42 08          	lea    0x8(%rdx),%rax
  180705:	48 89 41 08          	mov    %rax,0x8(%rcx)
  180709:	eb e9                	jmp    1806f4 <printer::vprintf(int, char const*, __va_list_tag*)+0x4b8>
  18070b:	41 89 f1             	mov    %esi,%r9d
        if (flags & FLAG_NUMERIC) {
  18070e:	c7 45 9c 20 00 00 00 	movl   $0x20,-0x64(%rbp)
    const char* digits = upper_digits;
  180715:	bf 00 14 18 00       	mov    $0x181400,%edi
  18071a:	e9 c0 01 00 00       	jmpq   1808df <printer::vprintf(int, char const*, __va_list_tag*)+0x6a3>
        switch (*format) {
  18071f:	49 89 cc             	mov    %rcx,%r12
  180722:	b8 01 00 00 00       	mov    $0x1,%eax
  180727:	eb 16                	jmp    18073f <printer::vprintf(int, char const*, __va_list_tag*)+0x503>
  180729:	49 89 cc             	mov    %rcx,%r12
  18072c:	b8 00 00 00 00       	mov    $0x0,%eax
  180731:	eb 0c                	jmp    18073f <printer::vprintf(int, char const*, __va_list_tag*)+0x503>
        switch (*format) {
  180733:	b8 00 00 00 00       	mov    $0x0,%eax
  180738:	eb 05                	jmp    18073f <printer::vprintf(int, char const*, __va_list_tag*)+0x503>
  18073a:	b8 00 00 00 00       	mov    $0x0,%eax
            base = -16;
  18073f:	be f0 ff ff ff       	mov    $0xfffffff0,%esi
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
  180744:	85 c0                	test   %eax,%eax
  180746:	74 96                	je     1806de <printer::vprintf(int, char const*, __va_list_tag*)+0x4a2>
  180748:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  18074c:	8b 01                	mov    (%rcx),%eax
  18074e:	83 f8 2f             	cmp    $0x2f,%eax
  180751:	0f 87 72 ff ff ff    	ja     1806c9 <printer::vprintf(int, char const*, __va_list_tag*)+0x48d>
  180757:	89 c2                	mov    %eax,%edx
  180759:	48 03 51 10          	add    0x10(%rcx),%rdx
  18075d:	83 c0 08             	add    $0x8,%eax
  180760:	89 01                	mov    %eax,(%rcx)
  180762:	4c 8b 02             	mov    (%rdx),%r8
            flags |= FLAG_NUMERIC;
  180765:	41 83 cd 20          	or     $0x20,%r13d
    if (base < 0) {
  180769:	85 f6                	test   %esi,%esi
  18076b:	79 9e                	jns    18070b <printer::vprintf(int, char const*, __va_list_tag*)+0x4cf>
        base = -base;
  18076d:	41 89 f1             	mov    %esi,%r9d
  180770:	f7 de                	neg    %esi
  180772:	c7 45 9c 20 00 00 00 	movl   $0x20,-0x64(%rbp)
        digits = lower_digits;
  180779:	bf e0 13 18 00       	mov    $0x1813e0,%edi
  18077e:	e9 5c 01 00 00       	jmpq   1808df <printer::vprintf(int, char const*, __va_list_tag*)+0x6a3>
        switch (*format) {
  180783:	49 89 cc             	mov    %rcx,%r12
  180786:	b8 01 00 00 00       	mov    $0x1,%eax
  18078b:	eb 16                	jmp    1807a3 <printer::vprintf(int, char const*, __va_list_tag*)+0x567>
  18078d:	49 89 cc             	mov    %rcx,%r12
  180790:	b8 00 00 00 00       	mov    $0x0,%eax
  180795:	eb 0c                	jmp    1807a3 <printer::vprintf(int, char const*, __va_list_tag*)+0x567>
        switch (*format) {
  180797:	b8 00 00 00 00       	mov    $0x0,%eax
  18079c:	eb 05                	jmp    1807a3 <printer::vprintf(int, char const*, __va_list_tag*)+0x567>
  18079e:	b8 00 00 00 00       	mov    $0x0,%eax
            base = 16;
  1807a3:	be 10 00 00 00       	mov    $0x10,%esi
            goto format_unsigned;
  1807a8:	eb 9a                	jmp    180744 <printer::vprintf(int, char const*, __va_list_tag*)+0x508>
        switch (*format) {
  1807aa:	49 89 cc             	mov    %rcx,%r12
            num = (uintptr_t) va_arg(val, void*);
  1807ad:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1807b1:	8b 01                	mov    (%rcx),%eax
  1807b3:	83 f8 2f             	cmp    $0x2f,%eax
  1807b6:	77 21                	ja     1807d9 <printer::vprintf(int, char const*, __va_list_tag*)+0x59d>
  1807b8:	89 c2                	mov    %eax,%edx
  1807ba:	48 03 51 10          	add    0x10(%rcx),%rdx
  1807be:	83 c0 08             	add    $0x8,%eax
  1807c1:	89 01                	mov    %eax,(%rcx)
  1807c3:	4c 8b 02             	mov    (%rdx),%r8
            flags |= FLAG_ALT | FLAG_ALT2 | FLAG_NUMERIC;
  1807c6:	41 81 cd 21 01 00 00 	or     $0x121,%r13d
            base = -16;
  1807cd:	be f0 ff ff ff       	mov    $0xfffffff0,%esi
  1807d2:	eb 99                	jmp    18076d <printer::vprintf(int, char const*, __va_list_tag*)+0x531>
        switch (*format) {
  1807d4:	49 89 cc             	mov    %rcx,%r12
  1807d7:	eb d4                	jmp    1807ad <printer::vprintf(int, char const*, __va_list_tag*)+0x571>
            num = (uintptr_t) va_arg(val, void*);
  1807d9:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1807dd:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  1807e1:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1807e5:	48 89 47 08          	mov    %rax,0x8(%rdi)
  1807e9:	eb d8                	jmp    1807c3 <printer::vprintf(int, char const*, __va_list_tag*)+0x587>
        switch (*format) {
  1807eb:	49 89 cc             	mov    %rcx,%r12
            data = va_arg(val, char*);
  1807ee:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1807f2:	8b 07                	mov    (%rdi),%eax
  1807f4:	83 f8 2f             	cmp    $0x2f,%eax
  1807f7:	77 1e                	ja     180817 <printer::vprintf(int, char const*, __va_list_tag*)+0x5db>
  1807f9:	89 c2                	mov    %eax,%edx
  1807fb:	48 03 57 10          	add    0x10(%rdi),%rdx
  1807ff:	83 c0 08             	add    $0x8,%eax
  180802:	89 07                	mov    %eax,(%rdi)
  180804:	48 8b 1a             	mov    (%rdx),%rbx
        unsigned long num = 0;
  180807:	41 b8 00 00 00 00    	mov    $0x0,%r8d
            break;
  18080d:	e9 9a fc ff ff       	jmpq   1804ac <printer::vprintf(int, char const*, __va_list_tag*)+0x270>
        switch (*format) {
  180812:	49 89 cc             	mov    %rcx,%r12
  180815:	eb d7                	jmp    1807ee <printer::vprintf(int, char const*, __va_list_tag*)+0x5b2>
            data = va_arg(val, char*);
  180817:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  18081b:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  18081f:	48 8d 42 08          	lea    0x8(%rdx),%rax
  180823:	48 89 41 08          	mov    %rax,0x8(%rcx)
  180827:	eb db                	jmp    180804 <printer::vprintf(int, char const*, __va_list_tag*)+0x5c8>
        switch (*format) {
  180829:	49 89 cc             	mov    %rcx,%r12
            color = va_arg(val, int);
  18082c:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  180830:	8b 01                	mov    (%rcx),%eax
  180832:	83 f8 2f             	cmp    $0x2f,%eax
  180835:	77 18                	ja     18084f <printer::vprintf(int, char const*, __va_list_tag*)+0x613>
  180837:	89 c2                	mov    %eax,%edx
  180839:	48 03 51 10          	add    0x10(%rcx),%rdx
  18083d:	83 c0 08             	add    $0x8,%eax
  180840:	89 01                	mov    %eax,(%rcx)
  180842:	44 8b 3a             	mov    (%rdx),%r15d
            continue;
  180845:	e9 ca fd ff ff       	jmpq   180614 <printer::vprintf(int, char const*, __va_list_tag*)+0x3d8>
        switch (*format) {
  18084a:	49 89 cc             	mov    %rcx,%r12
  18084d:	eb dd                	jmp    18082c <printer::vprintf(int, char const*, __va_list_tag*)+0x5f0>
            color = va_arg(val, int);
  18084f:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  180853:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  180857:	48 8d 42 08          	lea    0x8(%rdx),%rax
  18085b:	48 89 47 08          	mov    %rax,0x8(%rdi)
  18085f:	eb e1                	jmp    180842 <printer::vprintf(int, char const*, __va_list_tag*)+0x606>
        switch (*format) {
  180861:	49 89 cc             	mov    %rcx,%r12
            numbuf[0] = va_arg(val, int);
  180864:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  180868:	8b 07                	mov    (%rdi),%eax
  18086a:	83 f8 2f             	cmp    $0x2f,%eax
  18086d:	77 28                	ja     180897 <printer::vprintf(int, char const*, __va_list_tag*)+0x65b>
  18086f:	89 c2                	mov    %eax,%edx
  180871:	48 03 57 10          	add    0x10(%rdi),%rdx
  180875:	83 c0 08             	add    $0x8,%eax
  180878:	89 07                	mov    %eax,(%rdi)
  18087a:	8b 02                	mov    (%rdx),%eax
  18087c:	88 45 b8             	mov    %al,-0x48(%rbp)
            numbuf[1] = '\0';
  18087f:	c6 45 b9 00          	movb   $0x0,-0x47(%rbp)
            data = numbuf;
  180883:	48 8d 5d b8          	lea    -0x48(%rbp),%rbx
        unsigned long num = 0;
  180887:	41 b8 00 00 00 00    	mov    $0x0,%r8d
            break;
  18088d:	e9 1a fc ff ff       	jmpq   1804ac <printer::vprintf(int, char const*, __va_list_tag*)+0x270>
        switch (*format) {
  180892:	49 89 cc             	mov    %rcx,%r12
  180895:	eb cd                	jmp    180864 <printer::vprintf(int, char const*, __va_list_tag*)+0x628>
            numbuf[0] = va_arg(val, int);
  180897:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  18089b:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  18089f:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1808a3:	48 89 41 08          	mov    %rax,0x8(%rcx)
  1808a7:	eb d1                	jmp    18087a <printer::vprintf(int, char const*, __va_list_tag*)+0x63e>
        switch (*format) {
  1808a9:	4c 89 e1             	mov    %r12,%rcx
            numbuf[0] = (*format ? *format : '%');
  1808ac:	84 c0                	test   %al,%al
  1808ae:	0f 85 3b 01 00 00    	jne    1809ef <printer::vprintf(int, char const*, __va_list_tag*)+0x7b3>
  1808b4:	c6 45 b8 25          	movb   $0x25,-0x48(%rbp)
            numbuf[1] = '\0';
  1808b8:	c6 45 b9 00          	movb   $0x0,-0x47(%rbp)
                format--;
  1808bc:	4c 8d 61 ff          	lea    -0x1(%rcx),%r12
            data = numbuf;
  1808c0:	48 8d 5d b8          	lea    -0x48(%rbp),%rbx
        unsigned long num = 0;
  1808c4:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  1808ca:	e9 dd fb ff ff       	jmpq   1804ac <printer::vprintf(int, char const*, __va_list_tag*)+0x270>
        if (flags & FLAG_NUMERIC) {
  1808cf:	41 b9 0a 00 00 00    	mov    $0xa,%r9d
    const char* digits = upper_digits;
  1808d5:	bf 00 14 18 00       	mov    $0x181400,%edi
        if (flags & FLAG_NUMERIC) {
  1808da:	be 0a 00 00 00       	mov    $0xa,%esi
    *--numbuf_end = '\0';
  1808df:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
  1808e3:	4c 89 c1             	mov    %r8,%rcx
  1808e6:	48 8d 5d cf          	lea    -0x31(%rbp),%rbx
        *--numbuf_end = digits[val % base];
  1808ea:	48 63 f6             	movslq %esi,%rsi
  1808ed:	48 83 eb 01          	sub    $0x1,%rbx
  1808f1:	48 89 c8             	mov    %rcx,%rax
  1808f4:	ba 00 00 00 00       	mov    $0x0,%edx
  1808f9:	48 f7 f6             	div    %rsi
  1808fc:	0f b6 14 17          	movzbl (%rdi,%rdx,1),%edx
  180900:	88 13                	mov    %dl,(%rbx)
        val /= base;
  180902:	48 89 ca             	mov    %rcx,%rdx
  180905:	48 89 c1             	mov    %rax,%rcx
    } while (val != 0);
  180908:	48 39 d6             	cmp    %rdx,%rsi
  18090b:	76 e0                	jbe    1808ed <printer::vprintf(int, char const*, __va_list_tag*)+0x6b1>
  18090d:	e9 af fb ff ff       	jmpq   1804c1 <printer::vprintf(int, char const*, __va_list_tag*)+0x285>
                prefix = "-";
  180912:	48 c7 45 a8 07 0d 18 	movq   $0x180d07,-0x58(%rbp)
  180919:	00 
            if (flags & FLAG_NEGATIVE) {
  18091a:	41 f6 c5 80          	test   $0x80,%r13b
  18091e:	0f 85 c7 fb ff ff    	jne    1804eb <printer::vprintf(int, char const*, __va_list_tag*)+0x2af>
                prefix = "+";
  180924:	48 c7 45 a8 05 0d 18 	movq   $0x180d05,-0x58(%rbp)
  18092b:	00 
            } else if (flags & FLAG_PLUSPOSITIVE) {
  18092c:	41 f6 c5 10          	test   $0x10,%r13b
  180930:	0f 85 b5 fb ff ff    	jne    1804eb <printer::vprintf(int, char const*, __va_list_tag*)+0x2af>
                prefix = " ";
  180936:	41 f6 c5 08          	test   $0x8,%r13b
  18093a:	ba a5 14 18 00       	mov    $0x1814a5,%edx
  18093f:	b8 96 14 18 00       	mov    $0x181496,%eax
  180944:	48 0f 44 c2          	cmove  %rdx,%rax
  180948:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
  18094c:	e9 9a fb ff ff       	jmpq   1804eb <printer::vprintf(int, char const*, __va_list_tag*)+0x2af>
                   && (base == 16 || base == -16)
  180951:	41 8d 41 10          	lea    0x10(%r9),%eax
  180955:	a9 df ff ff ff       	test   $0xffffffdf,%eax
  18095a:	0f 85 8b fb ff ff    	jne    1804eb <printer::vprintf(int, char const*, __va_list_tag*)+0x2af>
                   && (num || (flags & FLAG_ALT2))) {
  180960:	4d 85 c0             	test   %r8,%r8
  180963:	75 0d                	jne    180972 <printer::vprintf(int, char const*, __va_list_tag*)+0x736>
  180965:	41 f7 c5 00 01 00 00 	test   $0x100,%r13d
  18096c:	0f 84 79 fb ff ff    	je     1804eb <printer::vprintf(int, char const*, __va_list_tag*)+0x2af>
            prefix = (base == -16 ? "0x" : "0X");
  180972:	41 83 f9 f0          	cmp    $0xfffffff0,%r9d
  180976:	ba 02 0d 18 00       	mov    $0x180d02,%edx
  18097b:	b8 09 0d 18 00       	mov    $0x180d09,%eax
  180980:	48 0f 44 c2          	cmove  %rdx,%rax
  180984:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
  180988:	e9 5e fb ff ff       	jmpq   1804eb <printer::vprintf(int, char const*, __va_list_tag*)+0x2af>
            datalen = strlen(data);
  18098d:	48 89 df             	mov    %rbx,%rdi
  180990:	e8 7b f7 ff ff       	callq  180110 <strlen>
  180995:	89 45 a0             	mov    %eax,-0x60(%rbp)
            && precision >= 0) {
  180998:	83 7d 9c 00          	cmpl   $0x0,-0x64(%rbp)
  18099c:	0f 84 76 fb ff ff    	je     180518 <printer::vprintf(int, char const*, __va_list_tag*)+0x2dc>
  1809a2:	80 7d 88 00          	cmpb   $0x0,-0x78(%rbp)
  1809a6:	0f 84 6c fb ff ff    	je     180518 <printer::vprintf(int, char const*, __va_list_tag*)+0x2dc>
            zeros = precision > datalen ? precision - datalen : 0;
  1809ac:	8b 4d a4             	mov    -0x5c(%rbp),%ecx
  1809af:	89 ca                	mov    %ecx,%edx
  1809b1:	29 c2                	sub    %eax,%edx
  1809b3:	39 c1                	cmp    %eax,%ecx
  1809b5:	b8 00 00 00 00       	mov    $0x0,%eax
  1809ba:	0f 4f c2             	cmovg  %edx,%eax
  1809bd:	89 45 a4             	mov    %eax,-0x5c(%rbp)
  1809c0:	e9 69 fb ff ff       	jmpq   18052e <printer::vprintf(int, char const*, __va_list_tag*)+0x2f2>
                   && datalen + (int) strlen(prefix) < width) {
  1809c5:	48 8b 7d a8          	mov    -0x58(%rbp),%rdi
  1809c9:	e8 42 f7 ff ff       	callq  180110 <strlen>
  1809ce:	8b 75 a0             	mov    -0x60(%rbp),%esi
  1809d1:	8d 14 06             	lea    (%rsi,%rax,1),%edx
            zeros = width - datalen - strlen(prefix);
  1809d4:	8b 7d 98             	mov    -0x68(%rbp),%edi
  1809d7:	89 f9                	mov    %edi,%ecx
  1809d9:	29 f1                	sub    %esi,%ecx
  1809db:	29 c1                	sub    %eax,%ecx
  1809dd:	39 fa                	cmp    %edi,%edx
  1809df:	b8 00 00 00 00       	mov    $0x0,%eax
  1809e4:	0f 4c c1             	cmovl  %ecx,%eax
  1809e7:	89 45 a4             	mov    %eax,-0x5c(%rbp)
  1809ea:	e9 3f fb ff ff       	jmpq   18052e <printer::vprintf(int, char const*, __va_list_tag*)+0x2f2>
  1809ef:	49 89 cc             	mov    %rcx,%r12
            numbuf[0] = (*format ? *format : '%');
  1809f2:	88 45 b8             	mov    %al,-0x48(%rbp)
            numbuf[1] = '\0';
  1809f5:	c6 45 b9 00          	movb   $0x0,-0x47(%rbp)
            data = numbuf;
  1809f9:	48 8d 5d b8          	lea    -0x48(%rbp),%rbx
        unsigned long num = 0;
  1809fd:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  180a03:	e9 a4 fa ff ff       	jmpq   1804ac <printer::vprintf(int, char const*, __va_list_tag*)+0x270>
        int flags = 0;
  180a08:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  180a0e:	e9 a4 f8 ff ff       	jmpq   1802b7 <printer::vprintf(int, char const*, __va_list_tag*)+0x7b>
        switch (*format) {
  180a13:	8d 50 bd             	lea    -0x43(%rax),%edx
  180a16:	80 fa 35             	cmp    $0x35,%dl
  180a19:	77 d7                	ja     1809f2 <printer::vprintf(int, char const*, __va_list_tag*)+0x7b6>
  180a1b:	0f b6 d2             	movzbl %dl,%edx
  180a1e:	3e ff 24 d5 20 12 18 	notrack jmpq *0x181220(,%rdx,8)
  180a25:	00 
        }
    }
}
  180a26:	48 83 c4 58          	add    $0x58,%rsp
  180a2a:	5b                   	pop    %rbx
  180a2b:	41 5c                	pop    %r12
  180a2d:	41 5d                	pop    %r13
  180a2f:	41 5e                	pop    %r14
  180a31:	41 5f                	pop    %r15
  180a33:	5d                   	pop    %rbp
  180a34:	c3                   	retq   
  180a35:	90                   	nop

0000000000180a36 <console_printer::console_printer(int, bool)>:
    void scroll();
    void move_cursor();
};

__noinline
console_printer::console_printer(int cpos, bool scroll)
  180a36:	f3 0f 1e fa          	endbr64 
    : cell_(console), scroll_(scroll) {
  180a3a:	48 c7 07 88 14 18 00 	movq   $0x181488,(%rdi)
  180a41:	48 c7 47 08 00 80 0b 	movq   $0xb8000,0x8(%rdi)
  180a48:	00 
  180a49:	88 57 10             	mov    %dl,0x10(%rdi)
    if (cpos < 0) {
  180a4c:	85 f6                	test   %esi,%esi
  180a4e:	78 18                	js     180a68 <console_printer::console_printer(int, bool)+0x32>
        cell_ += cursorpos;
    } else if (cpos <= CONSOLE_ROWS * CONSOLE_COLUMNS) {
  180a50:	81 fe d0 07 00 00    	cmp    $0x7d0,%esi
  180a56:	7f 0f                	jg     180a67 <console_printer::console_printer(int, bool)+0x31>
        cell_ += cpos;
  180a58:	48 63 f6             	movslq %esi,%rsi
  180a5b:	48 8d 84 36 00 80 0b 	lea    0xb8000(%rsi,%rsi,1),%rax
  180a62:	00 
  180a63:	48 89 47 08          	mov    %rax,0x8(%rdi)
    }
}
  180a67:	c3                   	retq   
        cell_ += cursorpos;
  180a68:	8b 05 8e 85 f3 ff    	mov    -0xc7a72(%rip),%eax        # b8ffc <cursorpos>
  180a6e:	48 98                	cltq   
  180a70:	48 8d 84 00 00 80 0b 	lea    0xb8000(%rax,%rax,1),%rax
  180a77:	00 
  180a78:	48 89 47 08          	mov    %rax,0x8(%rdi)
  180a7c:	c3                   	retq   
  180a7d:	90                   	nop

0000000000180a7e <console_printer::scroll()>:

__noinline
void console_printer::scroll() {
  180a7e:	f3 0f 1e fa          	endbr64 
  180a82:	55                   	push   %rbp
  180a83:	48 89 e5             	mov    %rsp,%rbp
  180a86:	53                   	push   %rbx
  180a87:	48 83 ec 08          	sub    $0x8,%rsp
    assert(cell_ >= console + CONSOLE_ROWS * CONSOLE_COLUMNS);
  180a8b:	48 81 7f 08 a0 8f 0b 	cmpq   $0xb8fa0,0x8(%rdi)
  180a92:	00 
  180a93:	72 18                	jb     180aad <console_printer::scroll()+0x2f>
  180a95:	48 89 fb             	mov    %rdi,%rbx
    if (scroll_) {
  180a98:	80 7f 10 00          	cmpb   $0x0,0x10(%rdi)
  180a9c:	75 28                	jne    180ac6 <console_printer::scroll()+0x48>
                (CONSOLE_ROWS - 1) * CONSOLE_COLUMNS * sizeof(*console));
        memset(console + (CONSOLE_ROWS - 1) * CONSOLE_COLUMNS,
               0, CONSOLE_COLUMNS * sizeof(*console));
        cell_ -= CONSOLE_COLUMNS;
    } else {
        cell_ = console;
  180a9e:	48 c7 47 08 00 80 0b 	movq   $0xb8000,0x8(%rdi)
  180aa5:	00 
    }
}
  180aa6:	48 83 c4 08          	add    $0x8,%rsp
  180aaa:	5b                   	pop    %rbx
  180aab:	5d                   	pop    %rbp
  180aac:	c3                   	retq   
    assert(cell_ >= console + CONSOLE_ROWS * CONSOLE_COLUMNS);
  180aad:	b9 00 00 00 00       	mov    $0x0,%ecx
  180ab2:	ba 18 14 18 00       	mov    $0x181418,%edx
  180ab7:	be 2c 02 00 00       	mov    $0x22c,%esi
  180abc:	bf fb 0c 18 00       	mov    $0x180cfb,%edi
  180ac1:	e8 c9 01 00 00       	callq  180c8f <assert_fail(char const*, int, char const*, char const*)>
        memmove(console, console + CONSOLE_COLUMNS,
  180ac6:	ba 00 0f 00 00       	mov    $0xf00,%edx
  180acb:	be a0 80 0b 00       	mov    $0xb80a0,%esi
  180ad0:	bf 00 80 0b 00       	mov    $0xb8000,%edi
  180ad5:	e8 c9 f5 ff ff       	callq  1800a3 <memmove>
        memset(console + (CONSOLE_ROWS - 1) * CONSOLE_COLUMNS,
  180ada:	ba a0 00 00 00       	mov    $0xa0,%edx
  180adf:	be 00 00 00 00       	mov    $0x0,%esi
  180ae4:	bf 00 8f 0b 00       	mov    $0xb8f00,%edi
  180ae9:	e8 02 f6 ff ff       	callq  1800f0 <memset>
        cell_ -= CONSOLE_COLUMNS;
  180aee:	48 81 6b 08 a0 00 00 	subq   $0xa0,0x8(%rbx)
  180af5:	00 
  180af6:	eb ae                	jmp    180aa6 <console_printer::scroll()+0x28>

0000000000180af8 <console_printer::putc(unsigned char, int)>:
    extern void console_show_cursor(int);
    console_show_cursor(cursorpos);
#endif
}

inline void console_printer::putc(unsigned char c, int color) {
  180af8:	f3 0f 1e fa          	endbr64 
  180afc:	55                   	push   %rbp
  180afd:	48 89 e5             	mov    %rsp,%rbp
  180b00:	41 55                	push   %r13
  180b02:	41 54                	push   %r12
  180b04:	53                   	push   %rbx
  180b05:	48 83 ec 08          	sub    $0x8,%rsp
  180b09:	48 89 fb             	mov    %rdi,%rbx
  180b0c:	41 89 f5             	mov    %esi,%r13d
  180b0f:	41 89 d4             	mov    %edx,%r12d
    while (cell_ >= console + CONSOLE_ROWS * CONSOLE_COLUMNS) {
  180b12:	48 8b 47 08          	mov    0x8(%rdi),%rax
  180b16:	48 3d a0 8f 0b 00    	cmp    $0xb8fa0,%rax
  180b1c:	72 14                	jb     180b32 <console_printer::putc(unsigned char, int)+0x3a>
        scroll();
  180b1e:	48 89 df             	mov    %rbx,%rdi
  180b21:	e8 58 ff ff ff       	callq  180a7e <console_printer::scroll()>
    while (cell_ >= console + CONSOLE_ROWS * CONSOLE_COLUMNS) {
  180b26:	48 8b 43 08          	mov    0x8(%rbx),%rax
  180b2a:	48 3d a0 8f 0b 00    	cmp    $0xb8fa0,%rax
  180b30:	73 ec                	jae    180b1e <console_printer::putc(unsigned char, int)+0x26>
    }
    if (c == '\n') {
  180b32:	41 80 fd 0a          	cmp    $0xa,%r13b
  180b36:	74 1e                	je     180b56 <console_printer::putc(unsigned char, int)+0x5e>
        while (pos != 80) {
            *cell_++ = ' ' | color;
            ++pos;
        }
    } else {
        *cell_++ = c | color;
  180b38:	48 8d 50 02          	lea    0x2(%rax),%rdx
  180b3c:	48 89 53 08          	mov    %rdx,0x8(%rbx)
  180b40:	45 0f b6 ed          	movzbl %r13b,%r13d
  180b44:	45 09 ec             	or     %r13d,%r12d
  180b47:	66 44 89 20          	mov    %r12w,(%rax)
    }
}
  180b4b:	48 83 c4 08          	add    $0x8,%rsp
  180b4f:	5b                   	pop    %rbx
  180b50:	41 5c                	pop    %r12
  180b52:	41 5d                	pop    %r13
  180b54:	5d                   	pop    %rbp
  180b55:	c3                   	retq   
        int pos = (cell_ - console) % 80;
  180b56:	48 2d 00 80 0b 00    	sub    $0xb8000,%rax
  180b5c:	48 89 c1             	mov    %rax,%rcx
  180b5f:	48 89 c6             	mov    %rax,%rsi
  180b62:	48 d1 fe             	sar    %rsi
  180b65:	48 ba 67 66 66 66 66 	movabs $0x6666666666666667,%rdx
  180b6c:	66 66 66 
  180b6f:	48 89 f0             	mov    %rsi,%rax
  180b72:	48 f7 ea             	imul   %rdx
  180b75:	48 c1 fa 05          	sar    $0x5,%rdx
  180b79:	48 89 c8             	mov    %rcx,%rax
  180b7c:	48 c1 f8 3f          	sar    $0x3f,%rax
  180b80:	48 29 c2             	sub    %rax,%rdx
  180b83:	48 8d 04 92          	lea    (%rdx,%rdx,4),%rax
  180b87:	48 c1 e0 04          	shl    $0x4,%rax
  180b8b:	89 f2                	mov    %esi,%edx
  180b8d:	29 c2                	sub    %eax,%edx
  180b8f:	89 d0                	mov    %edx,%eax
            *cell_++ = ' ' | color;
  180b91:	41 83 cc 20          	or     $0x20,%r12d
  180b95:	48 8b 4b 08          	mov    0x8(%rbx),%rcx
  180b99:	48 8d 71 02          	lea    0x2(%rcx),%rsi
  180b9d:	48 89 73 08          	mov    %rsi,0x8(%rbx)
  180ba1:	66 44 89 21          	mov    %r12w,(%rcx)
            ++pos;
  180ba5:	83 c0 01             	add    $0x1,%eax
        while (pos != 80) {
  180ba8:	83 f8 50             	cmp    $0x50,%eax
  180bab:	75 e8                	jne    180b95 <console_printer::putc(unsigned char, int)+0x9d>
  180bad:	eb 9c                	jmp    180b4b <console_printer::putc(unsigned char, int)+0x53>
  180baf:	90                   	nop

0000000000180bb0 <console_printer::move_cursor()>:
void console_printer::move_cursor() {
  180bb0:	f3 0f 1e fa          	endbr64 
    cursorpos = cell_ - console;
  180bb4:	48 8b 47 08          	mov    0x8(%rdi),%rax
  180bb8:	48 2d 00 80 0b 00    	sub    $0xb8000,%rax
  180bbe:	48 d1 f8             	sar    %rax
  180bc1:	89 05 35 84 f3 ff    	mov    %eax,-0xc7bcb(%rip)        # b8ffc <cursorpos>
}
  180bc7:	c3                   	retq   

0000000000180bc8 <console_vprintf(int, int, char const*, __va_list_tag*)>:

// console_vprintf, console_printf
//    Print a message onto the console, starting at the given cursor position.

__noinline
int console_vprintf(int cpos, int color, const char* format, va_list val) {
  180bc8:	f3 0f 1e fa          	endbr64 
  180bcc:	55                   	push   %rbp
  180bcd:	48 89 e5             	mov    %rsp,%rbp
  180bd0:	41 56                	push   %r14
  180bd2:	41 55                	push   %r13
  180bd4:	41 54                	push   %r12
  180bd6:	53                   	push   %rbx
  180bd7:	48 83 ec 20          	sub    $0x20,%rsp
  180bdb:	89 fb                	mov    %edi,%ebx
  180bdd:	41 89 f4             	mov    %esi,%r12d
  180be0:	49 89 d5             	mov    %rdx,%r13
  180be3:	49 89 ce             	mov    %rcx,%r14
    console_printer cp(cpos, cpos < 0);
  180be6:	89 fa                	mov    %edi,%edx
  180be8:	c1 ea 1f             	shr    $0x1f,%edx
  180beb:	89 fe                	mov    %edi,%esi
  180bed:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
  180bf1:	e8 40 fe ff ff       	callq  180a36 <console_printer::console_printer(int, bool)>
    cp.vprintf(color, format, val);
  180bf6:	4c 89 f1             	mov    %r14,%rcx
  180bf9:	4c 89 ea             	mov    %r13,%rdx
  180bfc:	44 89 e6             	mov    %r12d,%esi
  180bff:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
  180c03:	e8 34 f6 ff ff       	callq  18023c <printer::vprintf(int, char const*, __va_list_tag*)>
    if (cpos < 0) {
  180c08:	85 db                	test   %ebx,%ebx
  180c0a:	78 1a                	js     180c26 <console_vprintf(int, int, char const*, __va_list_tag*)+0x5e>
        cp.move_cursor();
    }
    return cp.cell_ - console;
  180c0c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  180c10:	48 2d 00 80 0b 00    	sub    $0xb8000,%rax
  180c16:	48 d1 f8             	sar    %rax
}
  180c19:	48 83 c4 20          	add    $0x20,%rsp
  180c1d:	5b                   	pop    %rbx
  180c1e:	41 5c                	pop    %r12
  180c20:	41 5d                	pop    %r13
  180c22:	41 5e                	pop    %r14
  180c24:	5d                   	pop    %rbp
  180c25:	c3                   	retq   
        cp.move_cursor();
  180c26:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
  180c2a:	e8 81 ff ff ff       	callq  180bb0 <console_printer::move_cursor()>
  180c2f:	eb db                	jmp    180c0c <console_vprintf(int, int, char const*, __va_list_tag*)+0x44>

0000000000180c31 <error_printf(char const*, ...)>:
    error_vprintf(-1, color, format, val);
    va_end(val);
}

__noinline
void error_printf(const char* format, ...) {
  180c31:	f3 0f 1e fa          	endbr64 
  180c35:	55                   	push   %rbp
  180c36:	48 89 e5             	mov    %rsp,%rbp
  180c39:	48 83 ec 50          	sub    $0x50,%rsp
  180c3d:	48 89 75 d8          	mov    %rsi,-0x28(%rbp)
  180c41:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  180c45:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  180c49:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
  180c4d:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
  180c51:	c7 45 b8 08 00 00 00 	movl   $0x8,-0x48(%rbp)
  180c58:	48 8d 45 10          	lea    0x10(%rbp),%rax
  180c5c:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  180c60:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  180c64:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    error_vprintf(-1, COLOR_ERROR, format, val);
  180c68:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
  180c6c:	48 89 fa             	mov    %rdi,%rdx
  180c6f:	be 00 c0 00 00       	mov    $0xc000,%esi
  180c74:	bf ff ff ff ff       	mov    $0xffffffff,%edi
  180c79:	e8 02 00 00 00       	callq  180c80 <error_vprintf(int, int, char const*, __va_list_tag*)>
    va_end(val);
}
  180c7e:	c9                   	leaveq 
  180c7f:	c3                   	retq   

0000000000180c80 <error_vprintf(int, int, char const*, __va_list_tag*)>:
    }
    (void) console_printf(CPOS(23, 0), 0xC000, "%s", buf);
    sys_panic(nullptr);
}

int error_vprintf(int cpos, int color, const char* format, va_list val) {
  180c80:	f3 0f 1e fa          	endbr64 
  180c84:	55                   	push   %rbp
  180c85:	48 89 e5             	mov    %rsp,%rbp
    return console_vprintf(cpos, color, format, val);
  180c88:	e8 3b ff ff ff       	callq  180bc8 <console_vprintf(int, int, char const*, __va_list_tag*)>
}
  180c8d:	5d                   	pop    %rbp
  180c8e:	c3                   	retq   

0000000000180c8f <assert_fail(char const*, int, char const*, char const*)>:

void assert_fail(const char* file, int line, const char* msg,
                 const char* description) {
  180c8f:	f3 0f 1e fa          	endbr64 
  180c93:	55                   	push   %rbp
  180c94:	48 89 e5             	mov    %rsp,%rbp
  180c97:	41 55                	push   %r13
  180c99:	41 54                	push   %r12
  180c9b:	53                   	push   %rbx
  180c9c:	48 83 ec 08          	sub    $0x8,%rsp
  180ca0:	48 89 fb             	mov    %rdi,%rbx
  180ca3:	41 89 f4             	mov    %esi,%r12d
  180ca6:	49 89 d5             	mov    %rdx,%r13
    cursorpos = CPOS(23, 0);
  180ca9:	c7 05 49 83 f3 ff 30 	movl   $0x730,-0xc7cb7(%rip)        # b8ffc <cursorpos>
  180cb0:	07 00 00 
    if (description) {
  180cb3:	48 85 c9             	test   %rcx,%rcx
  180cb6:	74 11                	je     180cc9 <assert_fail(char const*, int, char const*, char const*)+0x3a>
        error_printf("%s:%d: %s\n", file, line, description);
  180cb8:	89 f2                	mov    %esi,%edx
  180cba:	48 89 fe             	mov    %rdi,%rsi
  180cbd:	bf 9b 14 18 00       	mov    $0x18149b,%edi
  180cc2:	b0 00                	mov    $0x0,%al
  180cc4:	e8 68 ff ff ff       	callq  180c31 <error_printf(char const*, ...)>
    }
    error_printf("%s:%d: user assertion '%s' failed\n", file, line, msg);
  180cc9:	4c 89 e9             	mov    %r13,%rcx
  180ccc:	44 89 e2             	mov    %r12d,%edx
  180ccf:	48 89 de             	mov    %rbx,%rsi
  180cd2:	bf a8 14 18 00       	mov    $0x1814a8,%edi
  180cd7:	b0 00                	mov    $0x0,%al
  180cd9:	e8 53 ff ff ff       	callq  180c31 <error_printf(char const*, ...)>
    register uintptr_t rax asm("rax") = syscallno;
  180cde:	b8 03 00 00 00       	mov    $0x3,%eax
            : "cc", "memory", "rcx", "rdx", "rsi", "r8", "r9", "r10", "r11");
  180ce3:	bf 00 00 00 00       	mov    $0x0,%edi
  180ce8:	0f 05                	syscall 
//    Panic.
[[noreturn]] inline void sys_panic(const char* msg) {
    make_syscall(SYSCALL_PANIC, (uintptr_t) msg);

    // should never get here
    while (true) {
  180cea:	eb fe                	jmp    180cea <assert_fail(char const*, int, char const*, char const*)+0x5b>

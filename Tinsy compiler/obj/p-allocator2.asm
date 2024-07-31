
obj/p-allocator2.full:     file format elf64-x86-64


Disassembly of section .text:

0000000000140000 <process_main()>:

// These global variables go on the data page.
uint8_t* heap_top;
uint8_t* stack_bottom;

void process_main() {
  140000:	f3 0f 1e fa          	endbr64 
  140004:	55                   	push   %rbp
  140005:	48 89 e5             	mov    %rsp,%rbp
  140008:	41 54                	push   %r12
  14000a:	53                   	push   %rbx
// make_syscall
//    These functions define the WeensyOS system call calling convention.
//    We provide versions for system calls with 0-2 arguments.

__always_inline uintptr_t make_syscall(int syscallno) {
    register uintptr_t rax asm("rax") = syscallno;
  14000b:	b8 01 00 00 00       	mov    $0x1,%eax
    asm volatile ("syscall"
            : "+a" (rax)
            : /* all input registers are also output registers */
            : "cc", "memory", "rcx", "rdx", "rsi", "rdi", "r8", "r9",
              "r10", "r11");
  140010:	0f 05                	syscall 
    return rax;
  140012:	48 89 c3             	mov    %rax,%rbx


// sys_getpid
//    Return current process ID.
inline pid_t sys_getpid() {
    return make_syscall(SYSCALL_GETPID);
  140015:	41 89 c4             	mov    %eax,%r12d
    pid_t p = sys_getpid();
    srand(p);
  140018:	89 c7                	mov    %eax,%edi
  14001a:	e8 af 01 00 00       	callq  1401ce <srand(unsigned int)>
//    Return the smallest multiple of `m` greater than or equal to `x`.
//    Equivalently, round `x` up to the nearest multiple of `m`.
template <typename T>
inline constexpr T round_up(T x, unsigned m) {
    static_assert(std::is_unsigned<T>::value, "T must be unsigned");
    return round_down(x + m - 1, m);
  14001f:	b8 1b 30 14 00       	mov    $0x14301b,%eax

    // The heap starts on the page right after the 'end' symbol,
    // whose address is the first address not allocated to process code
    // or data.
    heap_top = (uint8_t*) round_up((uintptr_t) end, PAGESIZE);
  140024:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  14002a:	48 89 05 d7 1f 00 00 	mov    %rax,0x1fd7(%rip)        # 142008 <heap_top>
    return x;
}

__always_inline uintptr_t rdrsp() {
    uintptr_t x;
    asm volatile("movq %%rsp, %0" : "=r" (x));
  140031:	48 89 e0             	mov    %rsp,%rax

    // The bottom of the stack is the first address on the current
    // stack page (this process never needs more than one stack page).
    stack_bottom = (uint8_t*) round_down((uintptr_t) rdrsp() - 1, PAGESIZE);
  140034:	48 83 e8 01          	sub    $0x1,%rax
  140038:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  14003e:	48 89 05 bb 1f 00 00 	mov    %rax,0x1fbb(%rip)        # 142000 <stack_bottom>
  140045:	eb 07                	jmp    14004e <process_main()+0x4e>
    register uintptr_t rax asm("rax") = syscallno;
  140047:	b8 02 00 00 00       	mov    $0x2,%eax
              "r10", "r11");
  14004c:	0f 05                	syscall 

    // Allocate heap pages until (1) hit the stack (out of address space)
    // or (2) allocation fails (out of physical memory).
    while (true) {
#if !NO_SLOWDOWN
        if (rand(0, ALLOC_SLOWDOWN - 1) < p) {
  14004e:	be 63 00 00 00       	mov    $0x63,%esi
  140053:	bf 00 00 00 00       	mov    $0x0,%edi
  140058:	e8 90 01 00 00       	callq  1401ed <rand(int, int)>
  14005d:	44 39 e0             	cmp    %r12d,%eax
  140060:	7d e5                	jge    140047 <process_main()+0x47>
#else
        for (int i = 0; i < p; i++) {
#endif
            if (heap_top == stack_bottom
  140062:	48 8b 3d 9f 1f 00 00 	mov    0x1f9f(%rip),%rdi        # 142008 <heap_top>
                || sys_page_alloc(heap_top) < 0) {
  140069:	48 3b 3d 90 1f 00 00 	cmp    0x1f90(%rip),%rdi        # 142000 <stack_bottom>
  140070:	74 28                	je     14009a <process_main()+0x9a>
    register uintptr_t rax asm("rax") = syscallno;
  140072:	b8 04 00 00 00       	mov    $0x4,%eax
            : "cc", "memory", "rcx", "rdx", "rsi", "r8", "r9", "r10", "r11");
  140077:	0f 05                	syscall 
  140079:	85 c0                	test   %eax,%eax
  14007b:	78 1d                	js     14009a <process_main()+0x9a>
                break;
            }
            *heap_top = p;               // check we can write to new page
  14007d:	48 8b 05 84 1f 00 00 	mov    0x1f84(%rip),%rax        # 142008 <heap_top>
  140084:	88 18                	mov    %bl,(%rax)
            console[CPOS(24, 79)] = p;   // check we can write to console
  140086:	66 89 1d 11 8f f7 ff 	mov    %bx,-0x870ef(%rip)        # b8f9e <console+0xf9e>
            heap_top += PAGESIZE;
  14008d:	48 81 05 70 1f 00 00 	addq   $0x1000,0x1f70(%rip)        # 142008 <heap_top>
  140094:	00 10 00 00 
  140098:	eb ad                	jmp    140047 <process_main()+0x47>
    register uintptr_t rax asm("rax") = syscallno;
  14009a:	b8 02 00 00 00       	mov    $0x2,%eax
              "r10", "r11");
  14009f:	0f 05                	syscall 
    return rax;
  1400a1:	eb f7                	jmp    14009a <process_main()+0x9a>

00000000001400a3 <memmove>:
        *d = *s;
    }
    return dst;
}

void* memmove(void* dst, const void* src, size_t n) {
  1400a3:	f3 0f 1e fa          	endbr64 
  1400a7:	48 89 f8             	mov    %rdi,%rax
    const char* s = (const char*) src;
    char* d = (char*) dst;
    if (s < d && s + n > d) {
  1400aa:	48 39 fe             	cmp    %rdi,%rsi
  1400ad:	73 09                	jae    1400b8 <memmove+0x15>
  1400af:	48 8d 0c 16          	lea    (%rsi,%rdx,1),%rcx
  1400b3:	48 39 cf             	cmp    %rcx,%rdi
  1400b6:	72 1d                	jb     1400d5 <memmove+0x32>
        s += n, d += n;
        while (n-- > 0) {
            *--d = *--s;
        }
    } else {
        while (n-- > 0) {
  1400b8:	b9 00 00 00 00       	mov    $0x0,%ecx
  1400bd:	48 85 d2             	test   %rdx,%rdx
  1400c0:	74 12                	je     1400d4 <memmove+0x31>
            *d++ = *s++;
  1400c2:	0f b6 3c 0e          	movzbl (%rsi,%rcx,1),%edi
  1400c6:	40 88 3c 08          	mov    %dil,(%rax,%rcx,1)
        while (n-- > 0) {
  1400ca:	48 83 c1 01          	add    $0x1,%rcx
  1400ce:	48 39 d1             	cmp    %rdx,%rcx
  1400d1:	75 ef                	jne    1400c2 <memmove+0x1f>
        }
    }
    return dst;
}
  1400d3:	c3                   	retq   
  1400d4:	c3                   	retq   
        while (n-- > 0) {
  1400d5:	48 8d 4a ff          	lea    -0x1(%rdx),%rcx
  1400d9:	48 85 d2             	test   %rdx,%rdx
  1400dc:	74 f5                	je     1400d3 <memmove+0x30>
            *--d = *--s;
  1400de:	0f b6 14 0e          	movzbl (%rsi,%rcx,1),%edx
  1400e2:	88 14 08             	mov    %dl,(%rax,%rcx,1)
        while (n-- > 0) {
  1400e5:	48 83 e9 01          	sub    $0x1,%rcx
  1400e9:	48 83 f9 ff          	cmp    $0xffffffffffffffff,%rcx
  1400ed:	75 ef                	jne    1400de <memmove+0x3b>
  1400ef:	c3                   	retq   

00000000001400f0 <memset>:

void* memset(void* v, int c, size_t n) {
  1400f0:	f3 0f 1e fa          	endbr64 
  1400f4:	48 89 f8             	mov    %rdi,%rax
    for (char* p = (char*) v; n > 0; ++p, --n) {
  1400f7:	48 85 d2             	test   %rdx,%rdx
  1400fa:	74 13                	je     14010f <memset+0x1f>
  1400fc:	48 8d 0c 17          	lea    (%rdi,%rdx,1),%rcx
  140100:	48 89 fa             	mov    %rdi,%rdx
        *p = c;
  140103:	40 88 32             	mov    %sil,(%rdx)
    for (char* p = (char*) v; n > 0; ++p, --n) {
  140106:	48 83 c2 01          	add    $0x1,%rdx
  14010a:	48 39 d1             	cmp    %rdx,%rcx
  14010d:	75 f4                	jne    140103 <memset+0x13>
    }
    return v;
}
  14010f:	c3                   	retq   

0000000000140110 <strlen>:
        }
    }
    return nullptr;
}

size_t strlen(const char* s) {
  140110:	f3 0f 1e fa          	endbr64 
    size_t n;
    for (n = 0; *s != '\0'; ++s) {
  140114:	80 3f 00             	cmpb   $0x0,(%rdi)
  140117:	74 10                	je     140129 <strlen+0x19>
  140119:	b8 00 00 00 00       	mov    $0x0,%eax
        ++n;
  14011e:	48 83 c0 01          	add    $0x1,%rax
    for (n = 0; *s != '\0'; ++s) {
  140122:	80 3c 07 00          	cmpb   $0x0,(%rdi,%rax,1)
  140126:	75 f6                	jne    14011e <strlen+0xe>
  140128:	c3                   	retq   
  140129:	b8 00 00 00 00       	mov    $0x0,%eax
    }
    return n;
}
  14012e:	c3                   	retq   

000000000014012f <strnlen>:

size_t strnlen(const char* s, size_t maxlen) {
  14012f:	f3 0f 1e fa          	endbr64 
    size_t n;
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
  140133:	48 85 f6             	test   %rsi,%rsi
  140136:	74 15                	je     14014d <strnlen+0x1e>
  140138:	b8 00 00 00 00       	mov    $0x0,%eax
  14013d:	80 3c 07 00          	cmpb   $0x0,(%rdi,%rax,1)
  140141:	74 0d                	je     140150 <strnlen+0x21>
        ++n;
  140143:	48 83 c0 01          	add    $0x1,%rax
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
  140147:	48 39 c6             	cmp    %rax,%rsi
  14014a:	75 f1                	jne    14013d <strnlen+0xe>
  14014c:	c3                   	retq   
  14014d:	48 89 f0             	mov    %rsi,%rax
    }
    return n;
}
  140150:	c3                   	retq   

0000000000140151 <strchr>:
        }
        ++a, ++b, --n;
    }
}

char* strchr(const char* s, int c) {
  140151:	f3 0f 1e fa          	endbr64 
    while (*s && *s != (char) c) {
  140155:	0f b6 07             	movzbl (%rdi),%eax
  140158:	84 c0                	test   %al,%al
  14015a:	74 10                	je     14016c <strchr+0x1b>
  14015c:	40 38 f0             	cmp    %sil,%al
  14015f:	74 18                	je     140179 <strchr+0x28>
        ++s;
  140161:	48 83 c7 01          	add    $0x1,%rdi
    while (*s && *s != (char) c) {
  140165:	0f b6 07             	movzbl (%rdi),%eax
  140168:	84 c0                	test   %al,%al
  14016a:	75 f0                	jne    14015c <strchr+0xb>
    }
    if (*s == (char) c) {
        return (char*) s;
    } else {
        return nullptr;
  14016c:	40 84 f6             	test   %sil,%sil
  14016f:	b8 00 00 00 00       	mov    $0x0,%eax
  140174:	48 0f 44 c7          	cmove  %rdi,%rax
  140178:	c3                   	retq   
  140179:	48 89 f8             	mov    %rdi,%rax
    }
}
  14017c:	c3                   	retq   

000000000014017d <rand()>:
// rand, srand

static int rand_seed_set;
static unsigned long rand_seed;

int rand() {
  14017d:	f3 0f 1e fa          	endbr64 
    if (!rand_seed_set) {
  140181:	83 3d 90 1e 00 00 00 	cmpl   $0x0,0x1e90(%rip)        # 142018 <rand_seed_set>
  140188:	74 27                	je     1401b1 <rand()+0x34>
        srand(819234718U);
    }
    rand_seed = rand_seed * 6364136223846793005UL + 1;
  14018a:	48 b8 2d 7f 95 4c 2d 	movabs $0x5851f42d4c957f2d,%rax
  140191:	f4 51 58 
  140194:	48 0f af 05 74 1e 00 	imul   0x1e74(%rip),%rax        # 142010 <rand_seed>
  14019b:	00 
  14019c:	48 83 c0 01          	add    $0x1,%rax
  1401a0:	48 89 05 69 1e 00 00 	mov    %rax,0x1e69(%rip)        # 142010 <rand_seed>
    return (rand_seed >> 32) & RAND_MAX;
  1401a7:	48 c1 e8 20          	shr    $0x20,%rax
  1401ab:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
}
  1401b0:	c3                   	retq   

void srand(unsigned seed) {
    rand_seed = ((unsigned long) seed << 32) | seed;
  1401b1:	48 b8 9e 87 d4 30 9e 	movabs $0x30d4879e30d4879e,%rax
  1401b8:	87 d4 30 
  1401bb:	48 89 05 4e 1e 00 00 	mov    %rax,0x1e4e(%rip)        # 142010 <rand_seed>
    rand_seed_set = 1;
  1401c2:	c7 05 4c 1e 00 00 01 	movl   $0x1,0x1e4c(%rip)        # 142018 <rand_seed_set>
  1401c9:	00 00 00 
}
  1401cc:	eb bc                	jmp    14018a <rand()+0xd>

00000000001401ce <srand(unsigned int)>:
void srand(unsigned seed) {
  1401ce:	f3 0f 1e fa          	endbr64 
    rand_seed = ((unsigned long) seed << 32) | seed;
  1401d2:	89 f8                	mov    %edi,%eax
  1401d4:	48 c1 e7 20          	shl    $0x20,%rdi
  1401d8:	48 09 c7             	or     %rax,%rdi
  1401db:	48 89 3d 2e 1e 00 00 	mov    %rdi,0x1e2e(%rip)        # 142010 <rand_seed>
    rand_seed_set = 1;
  1401e2:	c7 05 2c 1e 00 00 01 	movl   $0x1,0x1e2c(%rip)        # 142018 <rand_seed_set>
  1401e9:	00 00 00 
}
  1401ec:	c3                   	retq   

00000000001401ed <rand(int, int)>:

// rand(min, max)
//    Return a pseudorandom number roughly evenly distributed between
//    `min` and `max`, inclusive. Requires `min <= max` and
//    `max - min <= RAND_MAX`.
int rand(int min, int max) {
  1401ed:	f3 0f 1e fa          	endbr64 
  1401f1:	55                   	push   %rbp
  1401f2:	48 89 e5             	mov    %rsp,%rbp
  1401f5:	41 54                	push   %r12
  1401f7:	53                   	push   %rbx
    assert(min <= max);
  1401f8:	39 f7                	cmp    %esi,%edi
  1401fa:	7f 27                	jg     140223 <rand(int, int)+0x36>
  1401fc:	41 89 fc             	mov    %edi,%r12d
  1401ff:	89 f3                	mov    %esi,%ebx
    assert(max - min <= RAND_MAX);

    unsigned long r = rand();
  140201:	e8 77 ff ff ff       	callq  14017d <rand()>
  140206:	89 c2                	mov    %eax,%edx
    return min + (r * (max - min + 1)) / ((unsigned long) RAND_MAX + 1);
  140208:	44 29 e3             	sub    %r12d,%ebx
  14020b:	8d 43 01             	lea    0x1(%rbx),%eax
  14020e:	48 98                	cltq   
    unsigned long r = rand();
  140210:	48 63 da             	movslq %edx,%rbx
    return min + (r * (max - min + 1)) / ((unsigned long) RAND_MAX + 1);
  140213:	48 0f af c3          	imul   %rbx,%rax
  140217:	48 c1 e8 1f          	shr    $0x1f,%rax
  14021b:	44 01 e0             	add    %r12d,%eax
}
  14021e:	5b                   	pop    %rbx
  14021f:	41 5c                	pop    %r12
  140221:	5d                   	pop    %rbp
  140222:	c3                   	retq   
    assert(min <= max);
  140223:	b9 00 00 00 00       	mov    $0x0,%ecx
  140228:	ba f0 0c 14 00       	mov    $0x140cf0,%edx
  14022d:	be ff 00 00 00       	mov    $0xff,%esi
  140232:	bf fb 0c 14 00       	mov    $0x140cfb,%edi
  140237:	e8 53 0a 00 00       	callq  140c8f <assert_fail(char const*, int, char const*, char const*)>

000000000014023c <printer::vprintf(int, char const*, __va_list_tag*)>:
#define FLAG_NUMERIC            (1<<5)
#define FLAG_SIGNED             (1<<6)
#define FLAG_NEGATIVE           (1<<7)
#define FLAG_ALT2               (1<<8)

void printer::vprintf(int color, const char* format, va_list val) {
  14023c:	f3 0f 1e fa          	endbr64 
  140240:	55                   	push   %rbp
  140241:	48 89 e5             	mov    %rsp,%rbp
  140244:	41 57                	push   %r15
  140246:	41 56                	push   %r14
  140248:	41 55                	push   %r13
  14024a:	41 54                	push   %r12
  14024c:	53                   	push   %rbx
  14024d:	48 83 ec 58          	sub    $0x58,%rsp
  140251:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
#define NUMBUFSIZ 24
    char numbuf[NUMBUFSIZ];

    for (; *format; ++format) {
  140255:	0f b6 02             	movzbl (%rdx),%eax
  140258:	84 c0                	test   %al,%al
  14025a:	0f 84 c6 07 00 00    	je     140a26 <printer::vprintf(int, char const*, __va_list_tag*)+0x7ea>
  140260:	49 89 fe             	mov    %rdi,%r14
  140263:	41 89 f7             	mov    %esi,%r15d
  140266:	48 89 d3             	mov    %rdx,%rbx
  140269:	e9 b9 03 00 00       	jmpq   140627 <printer::vprintf(int, char const*, __va_list_tag*)+0x3eb>
            continue;
        }

        // process flags
        int flags = 0;
        for (++format; *format; ++format) {
  14026e:	4c 8d 63 01          	lea    0x1(%rbx),%r12
  140272:	0f b6 5b 01          	movzbl 0x1(%rbx),%ebx
  140276:	84 db                	test   %bl,%bl
  140278:	0f 84 8a 07 00 00    	je     140a08 <printer::vprintf(int, char const*, __va_list_tag*)+0x7cc>
        int flags = 0;
  14027e:	41 bd 00 00 00 00    	mov    $0x0,%r13d
            const char* flagc = strchr(flag_chars, *format);
  140284:	0f be f3             	movsbl %bl,%esi
  140287:	bf d0 13 14 00       	mov    $0x1413d0,%edi
  14028c:	e8 c0 fe ff ff       	callq  140151 <strchr>
  140291:	48 89 c1             	mov    %rax,%rcx
            if (flagc) {
  140294:	48 85 c0             	test   %rax,%rax
  140297:	74 74                	je     14030d <printer::vprintf(int, char const*, __va_list_tag*)+0xd1>
                flags |= 1 << (flagc - flag_chars);
  140299:	48 81 e9 d0 13 14 00 	sub    $0x1413d0,%rcx
  1402a0:	b8 01 00 00 00       	mov    $0x1,%eax
  1402a5:	d3 e0                	shl    %cl,%eax
  1402a7:	41 09 c5             	or     %eax,%r13d
        for (++format; *format; ++format) {
  1402aa:	49 83 c4 01          	add    $0x1,%r12
  1402ae:	41 0f b6 1c 24       	movzbl (%r12),%ebx
  1402b3:	84 db                	test   %bl,%bl
  1402b5:	75 cd                	jne    140284 <printer::vprintf(int, char const*, __va_list_tag*)+0x48>
                break;
            }
        }

        // process width
        int width = -1;
  1402b7:	c7 45 98 ff ff ff ff 	movl   $0xffffffff,-0x68(%rbp)
            width = va_arg(val, int);
            ++format;
        }

        // process precision
        int precision = -1;
  1402be:	c7 45 a4 ff ff ff ff 	movl   $0xffffffff,-0x5c(%rbp)
        if (*format == '.') {
  1402c5:	41 80 3c 24 2e       	cmpb   $0x2e,(%r12)
  1402ca:	0f 84 cc 00 00 00    	je     14039c <printer::vprintf(int, char const*, __va_list_tag*)+0x160>
            }
        }

        // process length
        int length = 0;
        switch (*format) {
  1402d0:	41 0f b6 04 24       	movzbl (%r12),%eax
  1402d5:	3c 6c                	cmp    $0x6c,%al
  1402d7:	0f 84 54 01 00 00    	je     140431 <printer::vprintf(int, char const*, __va_list_tag*)+0x1f5>
  1402dd:	0f 8f 42 01 00 00    	jg     140425 <printer::vprintf(int, char const*, __va_list_tag*)+0x1e9>
  1402e3:	3c 68                	cmp    $0x68,%al
  1402e5:	0f 85 68 01 00 00    	jne    140453 <printer::vprintf(int, char const*, __va_list_tag*)+0x217>
        case 'z': // size_t, ssize_t
            length = 1;
            ++format;
            break;
        case 'h':
            ++format;
  1402eb:	49 8d 4c 24 01       	lea    0x1(%r12),%rcx
        // process main conversion character
        int base = 10;
        unsigned long num = 0;
        const char* data = "";

        switch (*format) {
  1402f0:	41 0f b6 44 24 01    	movzbl 0x1(%r12),%eax
  1402f6:	8d 50 bd             	lea    -0x43(%rax),%edx
  1402f9:	80 fa 35             	cmp    $0x35,%dl
  1402fc:	0f 87 aa 05 00 00    	ja     1408ac <printer::vprintf(int, char const*, __va_list_tag*)+0x670>
  140302:	0f b6 d2             	movzbl %dl,%edx
  140305:	3e ff 24 d5 10 0d 14 	notrack jmpq *0x140d10(,%rdx,8)
  14030c:	00 
        if (*format >= '1' && *format <= '9') {
  14030d:	8d 43 cf             	lea    -0x31(%rbx),%eax
  140310:	3c 08                	cmp    $0x8,%al
  140312:	77 35                	ja     140349 <printer::vprintf(int, char const*, __va_list_tag*)+0x10d>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  140314:	41 0f b6 04 24       	movzbl (%r12),%eax
  140319:	8d 50 d0             	lea    -0x30(%rax),%edx
  14031c:	80 fa 09             	cmp    $0x9,%dl
  14031f:	77 63                	ja     140384 <printer::vprintf(int, char const*, __va_list_tag*)+0x148>
  140321:	ba 00 00 00 00       	mov    $0x0,%edx
                width = 10 * width + *format++ - '0';
  140326:	49 83 c4 01          	add    $0x1,%r12
  14032a:	8d 14 92             	lea    (%rdx,%rdx,4),%edx
  14032d:	0f be c0             	movsbl %al,%eax
  140330:	8d 54 50 d0          	lea    -0x30(%rax,%rdx,2),%edx
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  140334:	41 0f b6 04 24       	movzbl (%r12),%eax
  140339:	8d 48 d0             	lea    -0x30(%rax),%ecx
  14033c:	80 f9 09             	cmp    $0x9,%cl
  14033f:	76 e5                	jbe    140326 <printer::vprintf(int, char const*, __va_list_tag*)+0xea>
  140341:	89 55 98             	mov    %edx,-0x68(%rbp)
  140344:	e9 75 ff ff ff       	jmpq   1402be <printer::vprintf(int, char const*, __va_list_tag*)+0x82>
        } else if (*format == '*') {
  140349:	80 fb 2a             	cmp    $0x2a,%bl
  14034c:	75 42                	jne    140390 <printer::vprintf(int, char const*, __va_list_tag*)+0x154>
            width = va_arg(val, int);
  14034e:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  140352:	8b 07                	mov    (%rdi),%eax
  140354:	83 f8 2f             	cmp    $0x2f,%eax
  140357:	77 19                	ja     140372 <printer::vprintf(int, char const*, __va_list_tag*)+0x136>
  140359:	89 c2                	mov    %eax,%edx
  14035b:	48 03 57 10          	add    0x10(%rdi),%rdx
  14035f:	83 c0 08             	add    $0x8,%eax
  140362:	89 07                	mov    %eax,(%rdi)
  140364:	8b 02                	mov    (%rdx),%eax
  140366:	89 45 98             	mov    %eax,-0x68(%rbp)
            ++format;
  140369:	49 83 c4 01          	add    $0x1,%r12
  14036d:	e9 4c ff ff ff       	jmpq   1402be <printer::vprintf(int, char const*, __va_list_tag*)+0x82>
            width = va_arg(val, int);
  140372:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  140376:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  14037a:	48 8d 42 08          	lea    0x8(%rdx),%rax
  14037e:	48 89 47 08          	mov    %rax,0x8(%rdi)
  140382:	eb e0                	jmp    140364 <printer::vprintf(int, char const*, __va_list_tag*)+0x128>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  140384:	c7 45 98 00 00 00 00 	movl   $0x0,-0x68(%rbp)
  14038b:	e9 2e ff ff ff       	jmpq   1402be <printer::vprintf(int, char const*, __va_list_tag*)+0x82>
        int width = -1;
  140390:	c7 45 98 ff ff ff ff 	movl   $0xffffffff,-0x68(%rbp)
  140397:	e9 22 ff ff ff       	jmpq   1402be <printer::vprintf(int, char const*, __va_list_tag*)+0x82>
            ++format;
  14039c:	49 8d 54 24 01       	lea    0x1(%r12),%rdx
            if (*format >= '0' && *format <= '9') {
  1403a1:	41 0f b6 44 24 01    	movzbl 0x1(%r12),%eax
  1403a7:	8d 48 d0             	lea    -0x30(%rax),%ecx
  1403aa:	80 f9 09             	cmp    $0x9,%cl
  1403ad:	76 13                	jbe    1403c2 <printer::vprintf(int, char const*, __va_list_tag*)+0x186>
            } else if (*format == '*') {
  1403af:	3c 2a                	cmp    $0x2a,%al
  1403b1:	74 32                	je     1403e5 <printer::vprintf(int, char const*, __va_list_tag*)+0x1a9>
            ++format;
  1403b3:	49 89 d4             	mov    %rdx,%r12
                precision = 0;
  1403b6:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%rbp)
  1403bd:	e9 0e ff ff ff       	jmpq   1402d0 <printer::vprintf(int, char const*, __va_list_tag*)+0x94>
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
  1403c2:	be 00 00 00 00       	mov    $0x0,%esi
                    precision = 10 * precision + *format++ - '0';
  1403c7:	48 83 c2 01          	add    $0x1,%rdx
  1403cb:	8d 0c b6             	lea    (%rsi,%rsi,4),%ecx
  1403ce:	0f be c0             	movsbl %al,%eax
  1403d1:	8d 74 48 d0          	lea    -0x30(%rax,%rcx,2),%esi
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
  1403d5:	0f b6 02             	movzbl (%rdx),%eax
  1403d8:	8d 48 d0             	lea    -0x30(%rax),%ecx
  1403db:	80 f9 09             	cmp    $0x9,%cl
  1403de:	76 e7                	jbe    1403c7 <printer::vprintf(int, char const*, __va_list_tag*)+0x18b>
                    precision = 10 * precision + *format++ - '0';
  1403e0:	49 89 d4             	mov    %rdx,%r12
  1403e3:	eb 1c                	jmp    140401 <printer::vprintf(int, char const*, __va_list_tag*)+0x1c5>
                precision = va_arg(val, int);
  1403e5:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1403e9:	8b 01                	mov    (%rcx),%eax
  1403eb:	83 f8 2f             	cmp    $0x2f,%eax
  1403ee:	77 23                	ja     140413 <printer::vprintf(int, char const*, __va_list_tag*)+0x1d7>
  1403f0:	89 c2                	mov    %eax,%edx
  1403f2:	48 03 51 10          	add    0x10(%rcx),%rdx
  1403f6:	83 c0 08             	add    $0x8,%eax
  1403f9:	89 01                	mov    %eax,(%rcx)
  1403fb:	8b 32                	mov    (%rdx),%esi
                ++format;
  1403fd:	49 83 c4 02          	add    $0x2,%r12
            if (precision < 0) {
  140401:	85 f6                	test   %esi,%esi
  140403:	b8 00 00 00 00       	mov    $0x0,%eax
  140408:	0f 49 c6             	cmovns %esi,%eax
  14040b:	89 45 a4             	mov    %eax,-0x5c(%rbp)
  14040e:	e9 bd fe ff ff       	jmpq   1402d0 <printer::vprintf(int, char const*, __va_list_tag*)+0x94>
                precision = va_arg(val, int);
  140413:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  140417:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  14041b:	48 8d 42 08          	lea    0x8(%rdx),%rax
  14041f:	48 89 47 08          	mov    %rax,0x8(%rdi)
  140423:	eb d6                	jmp    1403fb <printer::vprintf(int, char const*, __va_list_tag*)+0x1bf>
        switch (*format) {
  140425:	3c 74                	cmp    $0x74,%al
  140427:	74 08                	je     140431 <printer::vprintf(int, char const*, __va_list_tag*)+0x1f5>
  140429:	3c 7a                	cmp    $0x7a,%al
  14042b:	0f 85 e2 05 00 00    	jne    140a13 <printer::vprintf(int, char const*, __va_list_tag*)+0x7d7>
            ++format;
  140431:	49 8d 4c 24 01       	lea    0x1(%r12),%rcx
        switch (*format) {
  140436:	41 0f b6 44 24 01    	movzbl 0x1(%r12),%eax
  14043c:	8d 50 bd             	lea    -0x43(%rax),%edx
  14043f:	80 fa 35             	cmp    $0x35,%dl
  140442:	0f 87 64 04 00 00    	ja     1408ac <printer::vprintf(int, char const*, __va_list_tag*)+0x670>
  140448:	0f b6 d2             	movzbl %dl,%edx
  14044b:	3e ff 24 d5 c0 0e 14 	notrack jmpq *0x140ec0(,%rdx,8)
  140452:	00 
  140453:	8d 50 bd             	lea    -0x43(%rax),%edx
  140456:	80 fa 35             	cmp    $0x35,%dl
  140459:	0f 87 4a 04 00 00    	ja     1408a9 <printer::vprintf(int, char const*, __va_list_tag*)+0x66d>
  14045f:	0f b6 d2             	movzbl %dl,%edx
  140462:	3e ff 24 d5 70 10 14 	notrack jmpq *0x141070(,%rdx,8)
  140469:	00 
        case 'd':
        case 'i': {
            long x = length ? va_arg(val, long) : va_arg(val, int);
  14046a:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  14046e:	8b 07                	mov    (%rdi),%eax
  140470:	83 f8 2f             	cmp    $0x2f,%eax
  140473:	0f 87 c9 01 00 00    	ja     140642 <printer::vprintf(int, char const*, __va_list_tag*)+0x406>
  140479:	89 c2                	mov    %eax,%edx
  14047b:	48 03 57 10          	add    0x10(%rdi),%rdx
  14047f:	83 c0 08             	add    $0x8,%eax
  140482:	89 07                	mov    %eax,(%rdi)
  140484:	48 8b 12             	mov    (%rdx),%rdx
  140487:	49 89 cc             	mov    %rcx,%r12
            int negative = x < 0 ? FLAG_NEGATIVE : 0;
  14048a:	48 89 d0             	mov    %rdx,%rax
  14048d:	48 c1 f8 38          	sar    $0x38,%rax
            num = negative ? -x : x;
  140491:	49 89 d0             	mov    %rdx,%r8
  140494:	49 f7 d8             	neg    %r8
  140497:	25 80 00 00 00       	and    $0x80,%eax
  14049c:	4c 0f 44 c2          	cmove  %rdx,%r8
            flags |= FLAG_NUMERIC | FLAG_SIGNED | negative;
  1404a0:	41 09 c5             	or     %eax,%r13d
  1404a3:	41 83 cd 60          	or     $0x60,%r13d
        const char* data = "";
  1404a7:	bb a5 14 14 00       	mov    $0x1414a5,%ebx
                format--;
            }
            break;
        }

        if (flags & FLAG_NUMERIC) {
  1404ac:	44 89 e8             	mov    %r13d,%eax
  1404af:	83 e0 20             	and    $0x20,%eax
  1404b2:	89 45 9c             	mov    %eax,-0x64(%rbp)
  1404b5:	41 b9 0a 00 00 00    	mov    $0xa,%r9d
  1404bb:	0f 85 0e 04 00 00    	jne    1408cf <printer::vprintf(int, char const*, __va_list_tag*)+0x693>
            data = fill_numbuf(numbuf + NUMBUFSIZ, num, base);
        }

        const char* prefix = "";
        if ((flags & FLAG_NUMERIC) && (flags & FLAG_SIGNED)) {
  1404c1:	44 89 6d 8c          	mov    %r13d,-0x74(%rbp)
  1404c5:	44 89 e8             	mov    %r13d,%eax
  1404c8:	83 e0 60             	and    $0x60,%eax
  1404cb:	83 f8 60             	cmp    $0x60,%eax
  1404ce:	0f 84 3e 04 00 00    	je     140912 <printer::vprintf(int, char const*, __va_list_tag*)+0x6d6>
            } else if (flags & FLAG_PLUSPOSITIVE) {
                prefix = "+";
            } else if (flags & FLAG_SPACEPOSITIVE) {
                prefix = " ";
            }
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
  1404d4:	44 89 e8             	mov    %r13d,%eax
  1404d7:	83 e0 21             	and    $0x21,%eax
        const char* prefix = "";
  1404da:	48 c7 45 a8 a5 14 14 	movq   $0x1414a5,-0x58(%rbp)
  1404e1:	00 
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
  1404e2:	83 f8 21             	cmp    $0x21,%eax
  1404e5:	0f 84 66 04 00 00    	je     140951 <printer::vprintf(int, char const*, __va_list_tag*)+0x715>
                   && (num || (flags & FLAG_ALT2))) {
            prefix = (base == -16 ? "0x" : "0X");
        }

        int datalen;
        if (precision >= 0 && !(flags & FLAG_NUMERIC)) {
  1404eb:	8b 4d a4             	mov    -0x5c(%rbp),%ecx
  1404ee:	89 c8                	mov    %ecx,%eax
  1404f0:	f7 d0                	not    %eax
  1404f2:	c1 e8 1f             	shr    $0x1f,%eax
  1404f5:	89 45 88             	mov    %eax,-0x78(%rbp)
  1404f8:	83 7d 9c 00          	cmpl   $0x0,-0x64(%rbp)
  1404fc:	0f 85 8b 04 00 00    	jne    14098d <printer::vprintf(int, char const*, __va_list_tag*)+0x751>
  140502:	84 c0                	test   %al,%al
  140504:	0f 84 83 04 00 00    	je     14098d <printer::vprintf(int, char const*, __va_list_tag*)+0x751>
            datalen = strnlen(data, precision);
  14050a:	48 63 f1             	movslq %ecx,%rsi
  14050d:	48 89 df             	mov    %rbx,%rdi
  140510:	e8 1a fc ff ff       	callq  14012f <strnlen>
  140515:	89 45 a0             	mov    %eax,-0x60(%rbp)
        if ((flags & FLAG_NUMERIC)
            && precision >= 0) {
            zeros = precision > datalen ? precision - datalen : 0;
        } else if ((flags & FLAG_NUMERIC)
                   && (flags & FLAG_ZERO)
                   && !(flags & FLAG_LEFTJUSTIFY)
  140518:	8b 45 8c             	mov    -0x74(%rbp),%eax
  14051b:	83 e0 26             	and    $0x26,%eax
                   && datalen + (int) strlen(prefix) < width) {
            zeros = width - datalen - strlen(prefix);
        } else {
            zeros = 0;
  14051e:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%rbp)
                   && datalen + (int) strlen(prefix) < width) {
  140525:	83 f8 22             	cmp    $0x22,%eax
  140528:	0f 84 97 04 00 00    	je     1409c5 <printer::vprintf(int, char const*, __va_list_tag*)+0x789>
        }

        width -= datalen + zeros + strlen(prefix);
  14052e:	48 8b 7d a8          	mov    -0x58(%rbp),%rdi
  140532:	e8 d9 fb ff ff       	callq  140110 <strlen>
  140537:	8b 55 a4             	mov    -0x5c(%rbp),%edx
  14053a:	03 55 a0             	add    -0x60(%rbp),%edx
  14053d:	8b 7d 98             	mov    -0x68(%rbp),%edi
  140540:	29 d7                	sub    %edx,%edi
  140542:	89 fa                	mov    %edi,%edx
  140544:	29 c2                	sub    %eax,%edx
  140546:	89 55 98             	mov    %edx,-0x68(%rbp)
  140549:	89 55 9c             	mov    %edx,-0x64(%rbp)
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
  14054c:	41 f6 c5 04          	test   $0x4,%r13b
  140550:	75 32                	jne    140584 <printer::vprintf(int, char const*, __va_list_tag*)+0x348>
        width -= datalen + zeros + strlen(prefix);
  140552:	41 89 d5             	mov    %edx,%r13d
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
  140555:	85 d2                	test   %edx,%edx
  140557:	7e 2b                	jle    140584 <printer::vprintf(int, char const*, __va_list_tag*)+0x348>
            putc(' ', color);
  140559:	49 8b 06             	mov    (%r14),%rax
  14055c:	44 89 fa             	mov    %r15d,%edx
  14055f:	be 20 00 00 00       	mov    $0x20,%esi
  140564:	4c 89 f7             	mov    %r14,%rdi
  140567:	ff 10                	callq  *(%rax)
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
  140569:	41 83 ed 01          	sub    $0x1,%r13d
  14056d:	45 85 ed             	test   %r13d,%r13d
  140570:	7f e7                	jg     140559 <printer::vprintf(int, char const*, __va_list_tag*)+0x31d>
  140572:	8b 7d 98             	mov    -0x68(%rbp),%edi
  140575:	85 ff                	test   %edi,%edi
  140577:	b8 01 00 00 00       	mov    $0x1,%eax
  14057c:	0f 4f c7             	cmovg  %edi,%eax
  14057f:	29 c7                	sub    %eax,%edi
  140581:	89 7d 9c             	mov    %edi,-0x64(%rbp)
        }
        for (; *prefix; ++prefix) {
  140584:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  140588:	0f b6 00             	movzbl (%rax),%eax
  14058b:	4c 8b 6d a8          	mov    -0x58(%rbp),%r13
  14058f:	84 c0                	test   %al,%al
  140591:	74 1b                	je     1405ae <printer::vprintf(int, char const*, __va_list_tag*)+0x372>
            putc(*prefix, color);
  140593:	0f b6 f0             	movzbl %al,%esi
  140596:	49 8b 06             	mov    (%r14),%rax
  140599:	44 89 fa             	mov    %r15d,%edx
  14059c:	4c 89 f7             	mov    %r14,%rdi
  14059f:	ff 10                	callq  *(%rax)
        for (; *prefix; ++prefix) {
  1405a1:	49 83 c5 01          	add    $0x1,%r13
  1405a5:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
  1405aa:	84 c0                	test   %al,%al
  1405ac:	75 e5                	jne    140593 <printer::vprintf(int, char const*, __va_list_tag*)+0x357>
        }
        for (; zeros > 0; --zeros) {
  1405ae:	44 8b 6d a4          	mov    -0x5c(%rbp),%r13d
  1405b2:	83 7d a4 00          	cmpl   $0x0,-0x5c(%rbp)
  1405b6:	7e 16                	jle    1405ce <printer::vprintf(int, char const*, __va_list_tag*)+0x392>
            putc('0', color);
  1405b8:	49 8b 06             	mov    (%r14),%rax
  1405bb:	44 89 fa             	mov    %r15d,%edx
  1405be:	be 30 00 00 00       	mov    $0x30,%esi
  1405c3:	4c 89 f7             	mov    %r14,%rdi
  1405c6:	ff 10                	callq  *(%rax)
        for (; zeros > 0; --zeros) {
  1405c8:	41 83 ed 01          	sub    $0x1,%r13d
  1405cc:	75 ea                	jne    1405b8 <printer::vprintf(int, char const*, __va_list_tag*)+0x37c>
        }
        for (; datalen > 0; ++data, --datalen) {
  1405ce:	83 7d a0 00          	cmpl   $0x0,-0x60(%rbp)
  1405d2:	7e 22                	jle    1405f6 <printer::vprintf(int, char const*, __va_list_tag*)+0x3ba>
  1405d4:	8b 45 a0             	mov    -0x60(%rbp),%eax
  1405d7:	8d 40 ff             	lea    -0x1(%rax),%eax
  1405da:	4c 8d 6c 03 01       	lea    0x1(%rbx,%rax,1),%r13
            putc(*data, color);
  1405df:	0f b6 33             	movzbl (%rbx),%esi
  1405e2:	49 8b 06             	mov    (%r14),%rax
  1405e5:	44 89 fa             	mov    %r15d,%edx
  1405e8:	4c 89 f7             	mov    %r14,%rdi
  1405eb:	ff 10                	callq  *(%rax)
        for (; datalen > 0; ++data, --datalen) {
  1405ed:	48 83 c3 01          	add    $0x1,%rbx
  1405f1:	4c 39 eb             	cmp    %r13,%rbx
  1405f4:	75 e9                	jne    1405df <printer::vprintf(int, char const*, __va_list_tag*)+0x3a3>
        }
        for (; width > 0; --width) {
  1405f6:	8b 5d 9c             	mov    -0x64(%rbp),%ebx
  1405f9:	83 7d 9c 00          	cmpl   $0x0,-0x64(%rbp)
  1405fd:	7e 15                	jle    140614 <printer::vprintf(int, char const*, __va_list_tag*)+0x3d8>
            putc(' ', color);
  1405ff:	49 8b 06             	mov    (%r14),%rax
  140602:	44 89 fa             	mov    %r15d,%edx
  140605:	be 20 00 00 00       	mov    $0x20,%esi
  14060a:	4c 89 f7             	mov    %r14,%rdi
  14060d:	ff 10                	callq  *(%rax)
        for (; width > 0; --width) {
  14060f:	83 eb 01             	sub    $0x1,%ebx
  140612:	75 eb                	jne    1405ff <printer::vprintf(int, char const*, __va_list_tag*)+0x3c3>
    for (; *format; ++format) {
  140614:	49 8d 5c 24 01       	lea    0x1(%r12),%rbx
  140619:	41 0f b6 44 24 01    	movzbl 0x1(%r12),%eax
  14061f:	84 c0                	test   %al,%al
  140621:	0f 84 ff 03 00 00    	je     140a26 <printer::vprintf(int, char const*, __va_list_tag*)+0x7ea>
        if (*format != '%') {
  140627:	3c 25                	cmp    $0x25,%al
  140629:	0f 84 3f fc ff ff    	je     14026e <printer::vprintf(int, char const*, __va_list_tag*)+0x32>
            putc(*format, color);
  14062f:	0f b6 f0             	movzbl %al,%esi
  140632:	49 8b 06             	mov    (%r14),%rax
  140635:	44 89 fa             	mov    %r15d,%edx
  140638:	4c 89 f7             	mov    %r14,%rdi
  14063b:	ff 10                	callq  *(%rax)
            continue;
  14063d:	49 89 dc             	mov    %rbx,%r12
  140640:	eb d2                	jmp    140614 <printer::vprintf(int, char const*, __va_list_tag*)+0x3d8>
            long x = length ? va_arg(val, long) : va_arg(val, int);
  140642:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  140646:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  14064a:	48 8d 42 08          	lea    0x8(%rdx),%rax
  14064e:	48 89 47 08          	mov    %rax,0x8(%rdi)
  140652:	e9 2d fe ff ff       	jmpq   140484 <printer::vprintf(int, char const*, __va_list_tag*)+0x248>
        switch (*format) {
  140657:	49 89 cc             	mov    %rcx,%r12
            long x = length ? va_arg(val, long) : va_arg(val, int);
  14065a:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  14065e:	8b 01                	mov    (%rcx),%eax
  140660:	83 f8 2f             	cmp    $0x2f,%eax
  140663:	77 13                	ja     140678 <printer::vprintf(int, char const*, __va_list_tag*)+0x43c>
  140665:	89 c2                	mov    %eax,%edx
  140667:	48 03 51 10          	add    0x10(%rcx),%rdx
  14066b:	83 c0 08             	add    $0x8,%eax
  14066e:	89 01                	mov    %eax,(%rcx)
  140670:	48 63 12             	movslq (%rdx),%rdx
  140673:	e9 12 fe ff ff       	jmpq   14048a <printer::vprintf(int, char const*, __va_list_tag*)+0x24e>
  140678:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  14067c:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  140680:	48 8d 42 08          	lea    0x8(%rdx),%rax
  140684:	48 89 41 08          	mov    %rax,0x8(%rcx)
  140688:	eb e6                	jmp    140670 <printer::vprintf(int, char const*, __va_list_tag*)+0x434>
        switch (*format) {
  14068a:	49 89 cc             	mov    %rcx,%r12
  14068d:	b8 01 00 00 00       	mov    $0x1,%eax
  140692:	be 0a 00 00 00       	mov    $0xa,%esi
  140697:	e9 a8 00 00 00       	jmpq   140744 <printer::vprintf(int, char const*, __va_list_tag*)+0x508>
  14069c:	49 89 cc             	mov    %rcx,%r12
  14069f:	b8 00 00 00 00       	mov    $0x0,%eax
  1406a4:	be 0a 00 00 00       	mov    $0xa,%esi
  1406a9:	e9 96 00 00 00       	jmpq   140744 <printer::vprintf(int, char const*, __va_list_tag*)+0x508>
        switch (*format) {
  1406ae:	b8 00 00 00 00       	mov    $0x0,%eax
  1406b3:	be 0a 00 00 00       	mov    $0xa,%esi
  1406b8:	e9 87 00 00 00       	jmpq   140744 <printer::vprintf(int, char const*, __va_list_tag*)+0x508>
  1406bd:	b8 00 00 00 00       	mov    $0x0,%eax
  1406c2:	be 0a 00 00 00       	mov    $0xa,%esi
  1406c7:	eb 7b                	jmp    140744 <printer::vprintf(int, char const*, __va_list_tag*)+0x508>
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
  1406c9:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1406cd:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  1406d1:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1406d5:	48 89 47 08          	mov    %rax,0x8(%rdi)
  1406d9:	e9 84 00 00 00       	jmpq   140762 <printer::vprintf(int, char const*, __va_list_tag*)+0x526>
  1406de:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1406e2:	8b 01                	mov    (%rcx),%eax
  1406e4:	83 f8 2f             	cmp    $0x2f,%eax
  1406e7:	77 10                	ja     1406f9 <printer::vprintf(int, char const*, __va_list_tag*)+0x4bd>
  1406e9:	89 c2                	mov    %eax,%edx
  1406eb:	48 03 51 10          	add    0x10(%rcx),%rdx
  1406ef:	83 c0 08             	add    $0x8,%eax
  1406f2:	89 01                	mov    %eax,(%rcx)
  1406f4:	44 8b 02             	mov    (%rdx),%r8d
  1406f7:	eb 6c                	jmp    140765 <printer::vprintf(int, char const*, __va_list_tag*)+0x529>
  1406f9:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1406fd:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  140701:	48 8d 42 08          	lea    0x8(%rdx),%rax
  140705:	48 89 41 08          	mov    %rax,0x8(%rcx)
  140709:	eb e9                	jmp    1406f4 <printer::vprintf(int, char const*, __va_list_tag*)+0x4b8>
  14070b:	41 89 f1             	mov    %esi,%r9d
        if (flags & FLAG_NUMERIC) {
  14070e:	c7 45 9c 20 00 00 00 	movl   $0x20,-0x64(%rbp)
    const char* digits = upper_digits;
  140715:	bf 00 14 14 00       	mov    $0x141400,%edi
  14071a:	e9 c0 01 00 00       	jmpq   1408df <printer::vprintf(int, char const*, __va_list_tag*)+0x6a3>
        switch (*format) {
  14071f:	49 89 cc             	mov    %rcx,%r12
  140722:	b8 01 00 00 00       	mov    $0x1,%eax
  140727:	eb 16                	jmp    14073f <printer::vprintf(int, char const*, __va_list_tag*)+0x503>
  140729:	49 89 cc             	mov    %rcx,%r12
  14072c:	b8 00 00 00 00       	mov    $0x0,%eax
  140731:	eb 0c                	jmp    14073f <printer::vprintf(int, char const*, __va_list_tag*)+0x503>
        switch (*format) {
  140733:	b8 00 00 00 00       	mov    $0x0,%eax
  140738:	eb 05                	jmp    14073f <printer::vprintf(int, char const*, __va_list_tag*)+0x503>
  14073a:	b8 00 00 00 00       	mov    $0x0,%eax
            base = -16;
  14073f:	be f0 ff ff ff       	mov    $0xfffffff0,%esi
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
  140744:	85 c0                	test   %eax,%eax
  140746:	74 96                	je     1406de <printer::vprintf(int, char const*, __va_list_tag*)+0x4a2>
  140748:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  14074c:	8b 01                	mov    (%rcx),%eax
  14074e:	83 f8 2f             	cmp    $0x2f,%eax
  140751:	0f 87 72 ff ff ff    	ja     1406c9 <printer::vprintf(int, char const*, __va_list_tag*)+0x48d>
  140757:	89 c2                	mov    %eax,%edx
  140759:	48 03 51 10          	add    0x10(%rcx),%rdx
  14075d:	83 c0 08             	add    $0x8,%eax
  140760:	89 01                	mov    %eax,(%rcx)
  140762:	4c 8b 02             	mov    (%rdx),%r8
            flags |= FLAG_NUMERIC;
  140765:	41 83 cd 20          	or     $0x20,%r13d
    if (base < 0) {
  140769:	85 f6                	test   %esi,%esi
  14076b:	79 9e                	jns    14070b <printer::vprintf(int, char const*, __va_list_tag*)+0x4cf>
        base = -base;
  14076d:	41 89 f1             	mov    %esi,%r9d
  140770:	f7 de                	neg    %esi
  140772:	c7 45 9c 20 00 00 00 	movl   $0x20,-0x64(%rbp)
        digits = lower_digits;
  140779:	bf e0 13 14 00       	mov    $0x1413e0,%edi
  14077e:	e9 5c 01 00 00       	jmpq   1408df <printer::vprintf(int, char const*, __va_list_tag*)+0x6a3>
        switch (*format) {
  140783:	49 89 cc             	mov    %rcx,%r12
  140786:	b8 01 00 00 00       	mov    $0x1,%eax
  14078b:	eb 16                	jmp    1407a3 <printer::vprintf(int, char const*, __va_list_tag*)+0x567>
  14078d:	49 89 cc             	mov    %rcx,%r12
  140790:	b8 00 00 00 00       	mov    $0x0,%eax
  140795:	eb 0c                	jmp    1407a3 <printer::vprintf(int, char const*, __va_list_tag*)+0x567>
        switch (*format) {
  140797:	b8 00 00 00 00       	mov    $0x0,%eax
  14079c:	eb 05                	jmp    1407a3 <printer::vprintf(int, char const*, __va_list_tag*)+0x567>
  14079e:	b8 00 00 00 00       	mov    $0x0,%eax
            base = 16;
  1407a3:	be 10 00 00 00       	mov    $0x10,%esi
            goto format_unsigned;
  1407a8:	eb 9a                	jmp    140744 <printer::vprintf(int, char const*, __va_list_tag*)+0x508>
        switch (*format) {
  1407aa:	49 89 cc             	mov    %rcx,%r12
            num = (uintptr_t) va_arg(val, void*);
  1407ad:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1407b1:	8b 01                	mov    (%rcx),%eax
  1407b3:	83 f8 2f             	cmp    $0x2f,%eax
  1407b6:	77 21                	ja     1407d9 <printer::vprintf(int, char const*, __va_list_tag*)+0x59d>
  1407b8:	89 c2                	mov    %eax,%edx
  1407ba:	48 03 51 10          	add    0x10(%rcx),%rdx
  1407be:	83 c0 08             	add    $0x8,%eax
  1407c1:	89 01                	mov    %eax,(%rcx)
  1407c3:	4c 8b 02             	mov    (%rdx),%r8
            flags |= FLAG_ALT | FLAG_ALT2 | FLAG_NUMERIC;
  1407c6:	41 81 cd 21 01 00 00 	or     $0x121,%r13d
            base = -16;
  1407cd:	be f0 ff ff ff       	mov    $0xfffffff0,%esi
  1407d2:	eb 99                	jmp    14076d <printer::vprintf(int, char const*, __va_list_tag*)+0x531>
        switch (*format) {
  1407d4:	49 89 cc             	mov    %rcx,%r12
  1407d7:	eb d4                	jmp    1407ad <printer::vprintf(int, char const*, __va_list_tag*)+0x571>
            num = (uintptr_t) va_arg(val, void*);
  1407d9:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1407dd:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  1407e1:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1407e5:	48 89 47 08          	mov    %rax,0x8(%rdi)
  1407e9:	eb d8                	jmp    1407c3 <printer::vprintf(int, char const*, __va_list_tag*)+0x587>
        switch (*format) {
  1407eb:	49 89 cc             	mov    %rcx,%r12
            data = va_arg(val, char*);
  1407ee:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1407f2:	8b 07                	mov    (%rdi),%eax
  1407f4:	83 f8 2f             	cmp    $0x2f,%eax
  1407f7:	77 1e                	ja     140817 <printer::vprintf(int, char const*, __va_list_tag*)+0x5db>
  1407f9:	89 c2                	mov    %eax,%edx
  1407fb:	48 03 57 10          	add    0x10(%rdi),%rdx
  1407ff:	83 c0 08             	add    $0x8,%eax
  140802:	89 07                	mov    %eax,(%rdi)
  140804:	48 8b 1a             	mov    (%rdx),%rbx
        unsigned long num = 0;
  140807:	41 b8 00 00 00 00    	mov    $0x0,%r8d
            break;
  14080d:	e9 9a fc ff ff       	jmpq   1404ac <printer::vprintf(int, char const*, __va_list_tag*)+0x270>
        switch (*format) {
  140812:	49 89 cc             	mov    %rcx,%r12
  140815:	eb d7                	jmp    1407ee <printer::vprintf(int, char const*, __va_list_tag*)+0x5b2>
            data = va_arg(val, char*);
  140817:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  14081b:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  14081f:	48 8d 42 08          	lea    0x8(%rdx),%rax
  140823:	48 89 41 08          	mov    %rax,0x8(%rcx)
  140827:	eb db                	jmp    140804 <printer::vprintf(int, char const*, __va_list_tag*)+0x5c8>
        switch (*format) {
  140829:	49 89 cc             	mov    %rcx,%r12
            color = va_arg(val, int);
  14082c:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  140830:	8b 01                	mov    (%rcx),%eax
  140832:	83 f8 2f             	cmp    $0x2f,%eax
  140835:	77 18                	ja     14084f <printer::vprintf(int, char const*, __va_list_tag*)+0x613>
  140837:	89 c2                	mov    %eax,%edx
  140839:	48 03 51 10          	add    0x10(%rcx),%rdx
  14083d:	83 c0 08             	add    $0x8,%eax
  140840:	89 01                	mov    %eax,(%rcx)
  140842:	44 8b 3a             	mov    (%rdx),%r15d
            continue;
  140845:	e9 ca fd ff ff       	jmpq   140614 <printer::vprintf(int, char const*, __va_list_tag*)+0x3d8>
        switch (*format) {
  14084a:	49 89 cc             	mov    %rcx,%r12
  14084d:	eb dd                	jmp    14082c <printer::vprintf(int, char const*, __va_list_tag*)+0x5f0>
            color = va_arg(val, int);
  14084f:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  140853:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  140857:	48 8d 42 08          	lea    0x8(%rdx),%rax
  14085b:	48 89 47 08          	mov    %rax,0x8(%rdi)
  14085f:	eb e1                	jmp    140842 <printer::vprintf(int, char const*, __va_list_tag*)+0x606>
        switch (*format) {
  140861:	49 89 cc             	mov    %rcx,%r12
            numbuf[0] = va_arg(val, int);
  140864:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  140868:	8b 07                	mov    (%rdi),%eax
  14086a:	83 f8 2f             	cmp    $0x2f,%eax
  14086d:	77 28                	ja     140897 <printer::vprintf(int, char const*, __va_list_tag*)+0x65b>
  14086f:	89 c2                	mov    %eax,%edx
  140871:	48 03 57 10          	add    0x10(%rdi),%rdx
  140875:	83 c0 08             	add    $0x8,%eax
  140878:	89 07                	mov    %eax,(%rdi)
  14087a:	8b 02                	mov    (%rdx),%eax
  14087c:	88 45 b8             	mov    %al,-0x48(%rbp)
            numbuf[1] = '\0';
  14087f:	c6 45 b9 00          	movb   $0x0,-0x47(%rbp)
            data = numbuf;
  140883:	48 8d 5d b8          	lea    -0x48(%rbp),%rbx
        unsigned long num = 0;
  140887:	41 b8 00 00 00 00    	mov    $0x0,%r8d
            break;
  14088d:	e9 1a fc ff ff       	jmpq   1404ac <printer::vprintf(int, char const*, __va_list_tag*)+0x270>
        switch (*format) {
  140892:	49 89 cc             	mov    %rcx,%r12
  140895:	eb cd                	jmp    140864 <printer::vprintf(int, char const*, __va_list_tag*)+0x628>
            numbuf[0] = va_arg(val, int);
  140897:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  14089b:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  14089f:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1408a3:	48 89 41 08          	mov    %rax,0x8(%rcx)
  1408a7:	eb d1                	jmp    14087a <printer::vprintf(int, char const*, __va_list_tag*)+0x63e>
        switch (*format) {
  1408a9:	4c 89 e1             	mov    %r12,%rcx
            numbuf[0] = (*format ? *format : '%');
  1408ac:	84 c0                	test   %al,%al
  1408ae:	0f 85 3b 01 00 00    	jne    1409ef <printer::vprintf(int, char const*, __va_list_tag*)+0x7b3>
  1408b4:	c6 45 b8 25          	movb   $0x25,-0x48(%rbp)
            numbuf[1] = '\0';
  1408b8:	c6 45 b9 00          	movb   $0x0,-0x47(%rbp)
                format--;
  1408bc:	4c 8d 61 ff          	lea    -0x1(%rcx),%r12
            data = numbuf;
  1408c0:	48 8d 5d b8          	lea    -0x48(%rbp),%rbx
        unsigned long num = 0;
  1408c4:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  1408ca:	e9 dd fb ff ff       	jmpq   1404ac <printer::vprintf(int, char const*, __va_list_tag*)+0x270>
        if (flags & FLAG_NUMERIC) {
  1408cf:	41 b9 0a 00 00 00    	mov    $0xa,%r9d
    const char* digits = upper_digits;
  1408d5:	bf 00 14 14 00       	mov    $0x141400,%edi
        if (flags & FLAG_NUMERIC) {
  1408da:	be 0a 00 00 00       	mov    $0xa,%esi
    *--numbuf_end = '\0';
  1408df:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
  1408e3:	4c 89 c1             	mov    %r8,%rcx
  1408e6:	48 8d 5d cf          	lea    -0x31(%rbp),%rbx
        *--numbuf_end = digits[val % base];
  1408ea:	48 63 f6             	movslq %esi,%rsi
  1408ed:	48 83 eb 01          	sub    $0x1,%rbx
  1408f1:	48 89 c8             	mov    %rcx,%rax
  1408f4:	ba 00 00 00 00       	mov    $0x0,%edx
  1408f9:	48 f7 f6             	div    %rsi
  1408fc:	0f b6 14 17          	movzbl (%rdi,%rdx,1),%edx
  140900:	88 13                	mov    %dl,(%rbx)
        val /= base;
  140902:	48 89 ca             	mov    %rcx,%rdx
  140905:	48 89 c1             	mov    %rax,%rcx
    } while (val != 0);
  140908:	48 39 d6             	cmp    %rdx,%rsi
  14090b:	76 e0                	jbe    1408ed <printer::vprintf(int, char const*, __va_list_tag*)+0x6b1>
  14090d:	e9 af fb ff ff       	jmpq   1404c1 <printer::vprintf(int, char const*, __va_list_tag*)+0x285>
                prefix = "-";
  140912:	48 c7 45 a8 07 0d 14 	movq   $0x140d07,-0x58(%rbp)
  140919:	00 
            if (flags & FLAG_NEGATIVE) {
  14091a:	41 f6 c5 80          	test   $0x80,%r13b
  14091e:	0f 85 c7 fb ff ff    	jne    1404eb <printer::vprintf(int, char const*, __va_list_tag*)+0x2af>
                prefix = "+";
  140924:	48 c7 45 a8 05 0d 14 	movq   $0x140d05,-0x58(%rbp)
  14092b:	00 
            } else if (flags & FLAG_PLUSPOSITIVE) {
  14092c:	41 f6 c5 10          	test   $0x10,%r13b
  140930:	0f 85 b5 fb ff ff    	jne    1404eb <printer::vprintf(int, char const*, __va_list_tag*)+0x2af>
                prefix = " ";
  140936:	41 f6 c5 08          	test   $0x8,%r13b
  14093a:	ba a5 14 14 00       	mov    $0x1414a5,%edx
  14093f:	b8 96 14 14 00       	mov    $0x141496,%eax
  140944:	48 0f 44 c2          	cmove  %rdx,%rax
  140948:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
  14094c:	e9 9a fb ff ff       	jmpq   1404eb <printer::vprintf(int, char const*, __va_list_tag*)+0x2af>
                   && (base == 16 || base == -16)
  140951:	41 8d 41 10          	lea    0x10(%r9),%eax
  140955:	a9 df ff ff ff       	test   $0xffffffdf,%eax
  14095a:	0f 85 8b fb ff ff    	jne    1404eb <printer::vprintf(int, char const*, __va_list_tag*)+0x2af>
                   && (num || (flags & FLAG_ALT2))) {
  140960:	4d 85 c0             	test   %r8,%r8
  140963:	75 0d                	jne    140972 <printer::vprintf(int, char const*, __va_list_tag*)+0x736>
  140965:	41 f7 c5 00 01 00 00 	test   $0x100,%r13d
  14096c:	0f 84 79 fb ff ff    	je     1404eb <printer::vprintf(int, char const*, __va_list_tag*)+0x2af>
            prefix = (base == -16 ? "0x" : "0X");
  140972:	41 83 f9 f0          	cmp    $0xfffffff0,%r9d
  140976:	ba 02 0d 14 00       	mov    $0x140d02,%edx
  14097b:	b8 09 0d 14 00       	mov    $0x140d09,%eax
  140980:	48 0f 44 c2          	cmove  %rdx,%rax
  140984:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
  140988:	e9 5e fb ff ff       	jmpq   1404eb <printer::vprintf(int, char const*, __va_list_tag*)+0x2af>
            datalen = strlen(data);
  14098d:	48 89 df             	mov    %rbx,%rdi
  140990:	e8 7b f7 ff ff       	callq  140110 <strlen>
  140995:	89 45 a0             	mov    %eax,-0x60(%rbp)
            && precision >= 0) {
  140998:	83 7d 9c 00          	cmpl   $0x0,-0x64(%rbp)
  14099c:	0f 84 76 fb ff ff    	je     140518 <printer::vprintf(int, char const*, __va_list_tag*)+0x2dc>
  1409a2:	80 7d 88 00          	cmpb   $0x0,-0x78(%rbp)
  1409a6:	0f 84 6c fb ff ff    	je     140518 <printer::vprintf(int, char const*, __va_list_tag*)+0x2dc>
            zeros = precision > datalen ? precision - datalen : 0;
  1409ac:	8b 4d a4             	mov    -0x5c(%rbp),%ecx
  1409af:	89 ca                	mov    %ecx,%edx
  1409b1:	29 c2                	sub    %eax,%edx
  1409b3:	39 c1                	cmp    %eax,%ecx
  1409b5:	b8 00 00 00 00       	mov    $0x0,%eax
  1409ba:	0f 4f c2             	cmovg  %edx,%eax
  1409bd:	89 45 a4             	mov    %eax,-0x5c(%rbp)
  1409c0:	e9 69 fb ff ff       	jmpq   14052e <printer::vprintf(int, char const*, __va_list_tag*)+0x2f2>
                   && datalen + (int) strlen(prefix) < width) {
  1409c5:	48 8b 7d a8          	mov    -0x58(%rbp),%rdi
  1409c9:	e8 42 f7 ff ff       	callq  140110 <strlen>
  1409ce:	8b 75 a0             	mov    -0x60(%rbp),%esi
  1409d1:	8d 14 06             	lea    (%rsi,%rax,1),%edx
            zeros = width - datalen - strlen(prefix);
  1409d4:	8b 7d 98             	mov    -0x68(%rbp),%edi
  1409d7:	89 f9                	mov    %edi,%ecx
  1409d9:	29 f1                	sub    %esi,%ecx
  1409db:	29 c1                	sub    %eax,%ecx
  1409dd:	39 fa                	cmp    %edi,%edx
  1409df:	b8 00 00 00 00       	mov    $0x0,%eax
  1409e4:	0f 4c c1             	cmovl  %ecx,%eax
  1409e7:	89 45 a4             	mov    %eax,-0x5c(%rbp)
  1409ea:	e9 3f fb ff ff       	jmpq   14052e <printer::vprintf(int, char const*, __va_list_tag*)+0x2f2>
  1409ef:	49 89 cc             	mov    %rcx,%r12
            numbuf[0] = (*format ? *format : '%');
  1409f2:	88 45 b8             	mov    %al,-0x48(%rbp)
            numbuf[1] = '\0';
  1409f5:	c6 45 b9 00          	movb   $0x0,-0x47(%rbp)
            data = numbuf;
  1409f9:	48 8d 5d b8          	lea    -0x48(%rbp),%rbx
        unsigned long num = 0;
  1409fd:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  140a03:	e9 a4 fa ff ff       	jmpq   1404ac <printer::vprintf(int, char const*, __va_list_tag*)+0x270>
        int flags = 0;
  140a08:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  140a0e:	e9 a4 f8 ff ff       	jmpq   1402b7 <printer::vprintf(int, char const*, __va_list_tag*)+0x7b>
        switch (*format) {
  140a13:	8d 50 bd             	lea    -0x43(%rax),%edx
  140a16:	80 fa 35             	cmp    $0x35,%dl
  140a19:	77 d7                	ja     1409f2 <printer::vprintf(int, char const*, __va_list_tag*)+0x7b6>
  140a1b:	0f b6 d2             	movzbl %dl,%edx
  140a1e:	3e ff 24 d5 20 12 14 	notrack jmpq *0x141220(,%rdx,8)
  140a25:	00 
        }
    }
}
  140a26:	48 83 c4 58          	add    $0x58,%rsp
  140a2a:	5b                   	pop    %rbx
  140a2b:	41 5c                	pop    %r12
  140a2d:	41 5d                	pop    %r13
  140a2f:	41 5e                	pop    %r14
  140a31:	41 5f                	pop    %r15
  140a33:	5d                   	pop    %rbp
  140a34:	c3                   	retq   
  140a35:	90                   	nop

0000000000140a36 <console_printer::console_printer(int, bool)>:
    void scroll();
    void move_cursor();
};

__noinline
console_printer::console_printer(int cpos, bool scroll)
  140a36:	f3 0f 1e fa          	endbr64 
    : cell_(console), scroll_(scroll) {
  140a3a:	48 c7 07 88 14 14 00 	movq   $0x141488,(%rdi)
  140a41:	48 c7 47 08 00 80 0b 	movq   $0xb8000,0x8(%rdi)
  140a48:	00 
  140a49:	88 57 10             	mov    %dl,0x10(%rdi)
    if (cpos < 0) {
  140a4c:	85 f6                	test   %esi,%esi
  140a4e:	78 18                	js     140a68 <console_printer::console_printer(int, bool)+0x32>
        cell_ += cursorpos;
    } else if (cpos <= CONSOLE_ROWS * CONSOLE_COLUMNS) {
  140a50:	81 fe d0 07 00 00    	cmp    $0x7d0,%esi
  140a56:	7f 0f                	jg     140a67 <console_printer::console_printer(int, bool)+0x31>
        cell_ += cpos;
  140a58:	48 63 f6             	movslq %esi,%rsi
  140a5b:	48 8d 84 36 00 80 0b 	lea    0xb8000(%rsi,%rsi,1),%rax
  140a62:	00 
  140a63:	48 89 47 08          	mov    %rax,0x8(%rdi)
    }
}
  140a67:	c3                   	retq   
        cell_ += cursorpos;
  140a68:	8b 05 8e 85 f7 ff    	mov    -0x87a72(%rip),%eax        # b8ffc <cursorpos>
  140a6e:	48 98                	cltq   
  140a70:	48 8d 84 00 00 80 0b 	lea    0xb8000(%rax,%rax,1),%rax
  140a77:	00 
  140a78:	48 89 47 08          	mov    %rax,0x8(%rdi)
  140a7c:	c3                   	retq   
  140a7d:	90                   	nop

0000000000140a7e <console_printer::scroll()>:

__noinline
void console_printer::scroll() {
  140a7e:	f3 0f 1e fa          	endbr64 
  140a82:	55                   	push   %rbp
  140a83:	48 89 e5             	mov    %rsp,%rbp
  140a86:	53                   	push   %rbx
  140a87:	48 83 ec 08          	sub    $0x8,%rsp
    assert(cell_ >= console + CONSOLE_ROWS * CONSOLE_COLUMNS);
  140a8b:	48 81 7f 08 a0 8f 0b 	cmpq   $0xb8fa0,0x8(%rdi)
  140a92:	00 
  140a93:	72 18                	jb     140aad <console_printer::scroll()+0x2f>
  140a95:	48 89 fb             	mov    %rdi,%rbx
    if (scroll_) {
  140a98:	80 7f 10 00          	cmpb   $0x0,0x10(%rdi)
  140a9c:	75 28                	jne    140ac6 <console_printer::scroll()+0x48>
                (CONSOLE_ROWS - 1) * CONSOLE_COLUMNS * sizeof(*console));
        memset(console + (CONSOLE_ROWS - 1) * CONSOLE_COLUMNS,
               0, CONSOLE_COLUMNS * sizeof(*console));
        cell_ -= CONSOLE_COLUMNS;
    } else {
        cell_ = console;
  140a9e:	48 c7 47 08 00 80 0b 	movq   $0xb8000,0x8(%rdi)
  140aa5:	00 
    }
}
  140aa6:	48 83 c4 08          	add    $0x8,%rsp
  140aaa:	5b                   	pop    %rbx
  140aab:	5d                   	pop    %rbp
  140aac:	c3                   	retq   
    assert(cell_ >= console + CONSOLE_ROWS * CONSOLE_COLUMNS);
  140aad:	b9 00 00 00 00       	mov    $0x0,%ecx
  140ab2:	ba 18 14 14 00       	mov    $0x141418,%edx
  140ab7:	be 2c 02 00 00       	mov    $0x22c,%esi
  140abc:	bf fb 0c 14 00       	mov    $0x140cfb,%edi
  140ac1:	e8 c9 01 00 00       	callq  140c8f <assert_fail(char const*, int, char const*, char const*)>
        memmove(console, console + CONSOLE_COLUMNS,
  140ac6:	ba 00 0f 00 00       	mov    $0xf00,%edx
  140acb:	be a0 80 0b 00       	mov    $0xb80a0,%esi
  140ad0:	bf 00 80 0b 00       	mov    $0xb8000,%edi
  140ad5:	e8 c9 f5 ff ff       	callq  1400a3 <memmove>
        memset(console + (CONSOLE_ROWS - 1) * CONSOLE_COLUMNS,
  140ada:	ba a0 00 00 00       	mov    $0xa0,%edx
  140adf:	be 00 00 00 00       	mov    $0x0,%esi
  140ae4:	bf 00 8f 0b 00       	mov    $0xb8f00,%edi
  140ae9:	e8 02 f6 ff ff       	callq  1400f0 <memset>
        cell_ -= CONSOLE_COLUMNS;
  140aee:	48 81 6b 08 a0 00 00 	subq   $0xa0,0x8(%rbx)
  140af5:	00 
  140af6:	eb ae                	jmp    140aa6 <console_printer::scroll()+0x28>

0000000000140af8 <console_printer::putc(unsigned char, int)>:
    extern void console_show_cursor(int);
    console_show_cursor(cursorpos);
#endif
}

inline void console_printer::putc(unsigned char c, int color) {
  140af8:	f3 0f 1e fa          	endbr64 
  140afc:	55                   	push   %rbp
  140afd:	48 89 e5             	mov    %rsp,%rbp
  140b00:	41 55                	push   %r13
  140b02:	41 54                	push   %r12
  140b04:	53                   	push   %rbx
  140b05:	48 83 ec 08          	sub    $0x8,%rsp
  140b09:	48 89 fb             	mov    %rdi,%rbx
  140b0c:	41 89 f5             	mov    %esi,%r13d
  140b0f:	41 89 d4             	mov    %edx,%r12d
    while (cell_ >= console + CONSOLE_ROWS * CONSOLE_COLUMNS) {
  140b12:	48 8b 47 08          	mov    0x8(%rdi),%rax
  140b16:	48 3d a0 8f 0b 00    	cmp    $0xb8fa0,%rax
  140b1c:	72 14                	jb     140b32 <console_printer::putc(unsigned char, int)+0x3a>
        scroll();
  140b1e:	48 89 df             	mov    %rbx,%rdi
  140b21:	e8 58 ff ff ff       	callq  140a7e <console_printer::scroll()>
    while (cell_ >= console + CONSOLE_ROWS * CONSOLE_COLUMNS) {
  140b26:	48 8b 43 08          	mov    0x8(%rbx),%rax
  140b2a:	48 3d a0 8f 0b 00    	cmp    $0xb8fa0,%rax
  140b30:	73 ec                	jae    140b1e <console_printer::putc(unsigned char, int)+0x26>
    }
    if (c == '\n') {
  140b32:	41 80 fd 0a          	cmp    $0xa,%r13b
  140b36:	74 1e                	je     140b56 <console_printer::putc(unsigned char, int)+0x5e>
        while (pos != 80) {
            *cell_++ = ' ' | color;
            ++pos;
        }
    } else {
        *cell_++ = c | color;
  140b38:	48 8d 50 02          	lea    0x2(%rax),%rdx
  140b3c:	48 89 53 08          	mov    %rdx,0x8(%rbx)
  140b40:	45 0f b6 ed          	movzbl %r13b,%r13d
  140b44:	45 09 ec             	or     %r13d,%r12d
  140b47:	66 44 89 20          	mov    %r12w,(%rax)
    }
}
  140b4b:	48 83 c4 08          	add    $0x8,%rsp
  140b4f:	5b                   	pop    %rbx
  140b50:	41 5c                	pop    %r12
  140b52:	41 5d                	pop    %r13
  140b54:	5d                   	pop    %rbp
  140b55:	c3                   	retq   
        int pos = (cell_ - console) % 80;
  140b56:	48 2d 00 80 0b 00    	sub    $0xb8000,%rax
  140b5c:	48 89 c1             	mov    %rax,%rcx
  140b5f:	48 89 c6             	mov    %rax,%rsi
  140b62:	48 d1 fe             	sar    %rsi
  140b65:	48 ba 67 66 66 66 66 	movabs $0x6666666666666667,%rdx
  140b6c:	66 66 66 
  140b6f:	48 89 f0             	mov    %rsi,%rax
  140b72:	48 f7 ea             	imul   %rdx
  140b75:	48 c1 fa 05          	sar    $0x5,%rdx
  140b79:	48 89 c8             	mov    %rcx,%rax
  140b7c:	48 c1 f8 3f          	sar    $0x3f,%rax
  140b80:	48 29 c2             	sub    %rax,%rdx
  140b83:	48 8d 04 92          	lea    (%rdx,%rdx,4),%rax
  140b87:	48 c1 e0 04          	shl    $0x4,%rax
  140b8b:	89 f2                	mov    %esi,%edx
  140b8d:	29 c2                	sub    %eax,%edx
  140b8f:	89 d0                	mov    %edx,%eax
            *cell_++ = ' ' | color;
  140b91:	41 83 cc 20          	or     $0x20,%r12d
  140b95:	48 8b 4b 08          	mov    0x8(%rbx),%rcx
  140b99:	48 8d 71 02          	lea    0x2(%rcx),%rsi
  140b9d:	48 89 73 08          	mov    %rsi,0x8(%rbx)
  140ba1:	66 44 89 21          	mov    %r12w,(%rcx)
            ++pos;
  140ba5:	83 c0 01             	add    $0x1,%eax
        while (pos != 80) {
  140ba8:	83 f8 50             	cmp    $0x50,%eax
  140bab:	75 e8                	jne    140b95 <console_printer::putc(unsigned char, int)+0x9d>
  140bad:	eb 9c                	jmp    140b4b <console_printer::putc(unsigned char, int)+0x53>
  140baf:	90                   	nop

0000000000140bb0 <console_printer::move_cursor()>:
void console_printer::move_cursor() {
  140bb0:	f3 0f 1e fa          	endbr64 
    cursorpos = cell_ - console;
  140bb4:	48 8b 47 08          	mov    0x8(%rdi),%rax
  140bb8:	48 2d 00 80 0b 00    	sub    $0xb8000,%rax
  140bbe:	48 d1 f8             	sar    %rax
  140bc1:	89 05 35 84 f7 ff    	mov    %eax,-0x87bcb(%rip)        # b8ffc <cursorpos>
}
  140bc7:	c3                   	retq   

0000000000140bc8 <console_vprintf(int, int, char const*, __va_list_tag*)>:

// console_vprintf, console_printf
//    Print a message onto the console, starting at the given cursor position.

__noinline
int console_vprintf(int cpos, int color, const char* format, va_list val) {
  140bc8:	f3 0f 1e fa          	endbr64 
  140bcc:	55                   	push   %rbp
  140bcd:	48 89 e5             	mov    %rsp,%rbp
  140bd0:	41 56                	push   %r14
  140bd2:	41 55                	push   %r13
  140bd4:	41 54                	push   %r12
  140bd6:	53                   	push   %rbx
  140bd7:	48 83 ec 20          	sub    $0x20,%rsp
  140bdb:	89 fb                	mov    %edi,%ebx
  140bdd:	41 89 f4             	mov    %esi,%r12d
  140be0:	49 89 d5             	mov    %rdx,%r13
  140be3:	49 89 ce             	mov    %rcx,%r14
    console_printer cp(cpos, cpos < 0);
  140be6:	89 fa                	mov    %edi,%edx
  140be8:	c1 ea 1f             	shr    $0x1f,%edx
  140beb:	89 fe                	mov    %edi,%esi
  140bed:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
  140bf1:	e8 40 fe ff ff       	callq  140a36 <console_printer::console_printer(int, bool)>
    cp.vprintf(color, format, val);
  140bf6:	4c 89 f1             	mov    %r14,%rcx
  140bf9:	4c 89 ea             	mov    %r13,%rdx
  140bfc:	44 89 e6             	mov    %r12d,%esi
  140bff:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
  140c03:	e8 34 f6 ff ff       	callq  14023c <printer::vprintf(int, char const*, __va_list_tag*)>
    if (cpos < 0) {
  140c08:	85 db                	test   %ebx,%ebx
  140c0a:	78 1a                	js     140c26 <console_vprintf(int, int, char const*, __va_list_tag*)+0x5e>
        cp.move_cursor();
    }
    return cp.cell_ - console;
  140c0c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  140c10:	48 2d 00 80 0b 00    	sub    $0xb8000,%rax
  140c16:	48 d1 f8             	sar    %rax
}
  140c19:	48 83 c4 20          	add    $0x20,%rsp
  140c1d:	5b                   	pop    %rbx
  140c1e:	41 5c                	pop    %r12
  140c20:	41 5d                	pop    %r13
  140c22:	41 5e                	pop    %r14
  140c24:	5d                   	pop    %rbp
  140c25:	c3                   	retq   
        cp.move_cursor();
  140c26:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
  140c2a:	e8 81 ff ff ff       	callq  140bb0 <console_printer::move_cursor()>
  140c2f:	eb db                	jmp    140c0c <console_vprintf(int, int, char const*, __va_list_tag*)+0x44>

0000000000140c31 <error_printf(char const*, ...)>:
    error_vprintf(-1, color, format, val);
    va_end(val);
}

__noinline
void error_printf(const char* format, ...) {
  140c31:	f3 0f 1e fa          	endbr64 
  140c35:	55                   	push   %rbp
  140c36:	48 89 e5             	mov    %rsp,%rbp
  140c39:	48 83 ec 50          	sub    $0x50,%rsp
  140c3d:	48 89 75 d8          	mov    %rsi,-0x28(%rbp)
  140c41:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  140c45:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  140c49:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
  140c4d:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
  140c51:	c7 45 b8 08 00 00 00 	movl   $0x8,-0x48(%rbp)
  140c58:	48 8d 45 10          	lea    0x10(%rbp),%rax
  140c5c:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  140c60:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  140c64:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    error_vprintf(-1, COLOR_ERROR, format, val);
  140c68:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
  140c6c:	48 89 fa             	mov    %rdi,%rdx
  140c6f:	be 00 c0 00 00       	mov    $0xc000,%esi
  140c74:	bf ff ff ff ff       	mov    $0xffffffff,%edi
  140c79:	e8 02 00 00 00       	callq  140c80 <error_vprintf(int, int, char const*, __va_list_tag*)>
    va_end(val);
}
  140c7e:	c9                   	leaveq 
  140c7f:	c3                   	retq   

0000000000140c80 <error_vprintf(int, int, char const*, __va_list_tag*)>:
    }
    (void) console_printf(CPOS(23, 0), 0xC000, "%s", buf);
    sys_panic(nullptr);
}

int error_vprintf(int cpos, int color, const char* format, va_list val) {
  140c80:	f3 0f 1e fa          	endbr64 
  140c84:	55                   	push   %rbp
  140c85:	48 89 e5             	mov    %rsp,%rbp
    return console_vprintf(cpos, color, format, val);
  140c88:	e8 3b ff ff ff       	callq  140bc8 <console_vprintf(int, int, char const*, __va_list_tag*)>
}
  140c8d:	5d                   	pop    %rbp
  140c8e:	c3                   	retq   

0000000000140c8f <assert_fail(char const*, int, char const*, char const*)>:

void assert_fail(const char* file, int line, const char* msg,
                 const char* description) {
  140c8f:	f3 0f 1e fa          	endbr64 
  140c93:	55                   	push   %rbp
  140c94:	48 89 e5             	mov    %rsp,%rbp
  140c97:	41 55                	push   %r13
  140c99:	41 54                	push   %r12
  140c9b:	53                   	push   %rbx
  140c9c:	48 83 ec 08          	sub    $0x8,%rsp
  140ca0:	48 89 fb             	mov    %rdi,%rbx
  140ca3:	41 89 f4             	mov    %esi,%r12d
  140ca6:	49 89 d5             	mov    %rdx,%r13
    cursorpos = CPOS(23, 0);
  140ca9:	c7 05 49 83 f7 ff 30 	movl   $0x730,-0x87cb7(%rip)        # b8ffc <cursorpos>
  140cb0:	07 00 00 
    if (description) {
  140cb3:	48 85 c9             	test   %rcx,%rcx
  140cb6:	74 11                	je     140cc9 <assert_fail(char const*, int, char const*, char const*)+0x3a>
        error_printf("%s:%d: %s\n", file, line, description);
  140cb8:	89 f2                	mov    %esi,%edx
  140cba:	48 89 fe             	mov    %rdi,%rsi
  140cbd:	bf 9b 14 14 00       	mov    $0x14149b,%edi
  140cc2:	b0 00                	mov    $0x0,%al
  140cc4:	e8 68 ff ff ff       	callq  140c31 <error_printf(char const*, ...)>
    }
    error_printf("%s:%d: user assertion '%s' failed\n", file, line, msg);
  140cc9:	4c 89 e9             	mov    %r13,%rcx
  140ccc:	44 89 e2             	mov    %r12d,%edx
  140ccf:	48 89 de             	mov    %rbx,%rsi
  140cd2:	bf a8 14 14 00       	mov    $0x1414a8,%edi
  140cd7:	b0 00                	mov    $0x0,%al
  140cd9:	e8 53 ff ff ff       	callq  140c31 <error_printf(char const*, ...)>
    register uintptr_t rax asm("rax") = syscallno;
  140cde:	b8 03 00 00 00       	mov    $0x3,%eax
            : "cc", "memory", "rcx", "rdx", "rsi", "r8", "r9", "r10", "r11");
  140ce3:	bf 00 00 00 00       	mov    $0x0,%edi
  140ce8:	0f 05                	syscall 
//    Panic.
[[noreturn]] inline void sys_panic(const char* msg) {
    make_syscall(SYSCALL_PANIC, (uintptr_t) msg);

    // should never get here
    while (true) {
  140cea:	eb fe                	jmp    140cea <assert_fail(char const*, int, char const*, char const*)+0x5b>

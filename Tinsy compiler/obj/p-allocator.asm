
obj/p-allocator.full:     file format elf64-x86-64


Disassembly of section .text:

0000000000100000 <process_main()>:

// These global variables go on the data page.
uint8_t* heap_top;
uint8_t* stack_bottom;

void process_main() {
  100000:	f3 0f 1e fa          	endbr64 
  100004:	55                   	push   %rbp
  100005:	48 89 e5             	mov    %rsp,%rbp
  100008:	41 54                	push   %r12
  10000a:	53                   	push   %rbx
// make_syscall
//    These functions define the WeensyOS system call calling convention.
//    We provide versions for system calls with 0-2 arguments.

__always_inline uintptr_t make_syscall(int syscallno) {
    register uintptr_t rax asm("rax") = syscallno;
  10000b:	b8 01 00 00 00       	mov    $0x1,%eax
    asm volatile ("syscall"
            : "+a" (rax)
            : /* all input registers are also output registers */
            : "cc", "memory", "rcx", "rdx", "rsi", "rdi", "r8", "r9",
              "r10", "r11");
  100010:	0f 05                	syscall 
    return rax;
  100012:	48 89 c3             	mov    %rax,%rbx


// sys_getpid
//    Return current process ID.
inline pid_t sys_getpid() {
    return make_syscall(SYSCALL_GETPID);
  100015:	41 89 c4             	mov    %eax,%r12d
    pid_t p = sys_getpid();
    srand(p);
  100018:	89 c7                	mov    %eax,%edi
  10001a:	e8 af 01 00 00       	callq  1001ce <srand(unsigned int)>
//    Return the smallest multiple of `m` greater than or equal to `x`.
//    Equivalently, round `x` up to the nearest multiple of `m`.
template <typename T>
inline constexpr T round_up(T x, unsigned m) {
    static_assert(std::is_unsigned<T>::value, "T must be unsigned");
    return round_down(x + m - 1, m);
  10001f:	b8 1b 30 10 00       	mov    $0x10301b,%eax

    // The heap starts on the page right after the 'end' symbol,
    // whose address is the first address not allocated to process code
    // or data.
    heap_top = (uint8_t*) round_up((uintptr_t) end, PAGESIZE);
  100024:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  10002a:	48 89 05 d7 1f 00 00 	mov    %rax,0x1fd7(%rip)        # 102008 <heap_top>
    return x;
}

__always_inline uintptr_t rdrsp() {
    uintptr_t x;
    asm volatile("movq %%rsp, %0" : "=r" (x));
  100031:	48 89 e0             	mov    %rsp,%rax

    // The bottom of the stack is the first address on the current
    // stack page (this process never needs more than one stack page).
    stack_bottom = (uint8_t*) round_down((uintptr_t) rdrsp() - 1, PAGESIZE);
  100034:	48 83 e8 01          	sub    $0x1,%rax
  100038:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  10003e:	48 89 05 bb 1f 00 00 	mov    %rax,0x1fbb(%rip)        # 102000 <stack_bottom>
  100045:	eb 07                	jmp    10004e <process_main()+0x4e>
    register uintptr_t rax asm("rax") = syscallno;
  100047:	b8 02 00 00 00       	mov    $0x2,%eax
              "r10", "r11");
  10004c:	0f 05                	syscall 

    // Allocate heap pages until (1) hit the stack (out of address space)
    // or (2) allocation fails (out of physical memory).
    while (true) {
#if !NO_SLOWDOWN
        if (rand(0, ALLOC_SLOWDOWN - 1) < p) {
  10004e:	be 63 00 00 00       	mov    $0x63,%esi
  100053:	bf 00 00 00 00       	mov    $0x0,%edi
  100058:	e8 90 01 00 00       	callq  1001ed <rand(int, int)>
  10005d:	44 39 e0             	cmp    %r12d,%eax
  100060:	7d e5                	jge    100047 <process_main()+0x47>
#else
        for (int i = 0; i < p; i++) {
#endif
            if (heap_top == stack_bottom
  100062:	48 8b 3d 9f 1f 00 00 	mov    0x1f9f(%rip),%rdi        # 102008 <heap_top>
                || sys_page_alloc(heap_top) < 0) {
  100069:	48 3b 3d 90 1f 00 00 	cmp    0x1f90(%rip),%rdi        # 102000 <stack_bottom>
  100070:	74 28                	je     10009a <process_main()+0x9a>
    register uintptr_t rax asm("rax") = syscallno;
  100072:	b8 04 00 00 00       	mov    $0x4,%eax
            : "cc", "memory", "rcx", "rdx", "rsi", "r8", "r9", "r10", "r11");
  100077:	0f 05                	syscall 
  100079:	85 c0                	test   %eax,%eax
  10007b:	78 1d                	js     10009a <process_main()+0x9a>
                break;
            }
            *heap_top = p;               // check we can write to new page
  10007d:	48 8b 05 84 1f 00 00 	mov    0x1f84(%rip),%rax        # 102008 <heap_top>
  100084:	88 18                	mov    %bl,(%rax)
            console[CPOS(24, 79)] = p;   // check we can write to console
  100086:	66 89 1d 11 8f fb ff 	mov    %bx,-0x470ef(%rip)        # b8f9e <console+0xf9e>
            heap_top += PAGESIZE;
  10008d:	48 81 05 70 1f 00 00 	addq   $0x1000,0x1f70(%rip)        # 102008 <heap_top>
  100094:	00 10 00 00 
  100098:	eb ad                	jmp    100047 <process_main()+0x47>
    register uintptr_t rax asm("rax") = syscallno;
  10009a:	b8 02 00 00 00       	mov    $0x2,%eax
              "r10", "r11");
  10009f:	0f 05                	syscall 
    return rax;
  1000a1:	eb f7                	jmp    10009a <process_main()+0x9a>

00000000001000a3 <memmove>:
        *d = *s;
    }
    return dst;
}

void* memmove(void* dst, const void* src, size_t n) {
  1000a3:	f3 0f 1e fa          	endbr64 
  1000a7:	48 89 f8             	mov    %rdi,%rax
    const char* s = (const char*) src;
    char* d = (char*) dst;
    if (s < d && s + n > d) {
  1000aa:	48 39 fe             	cmp    %rdi,%rsi
  1000ad:	73 09                	jae    1000b8 <memmove+0x15>
  1000af:	48 8d 0c 16          	lea    (%rsi,%rdx,1),%rcx
  1000b3:	48 39 cf             	cmp    %rcx,%rdi
  1000b6:	72 1d                	jb     1000d5 <memmove+0x32>
        s += n, d += n;
        while (n-- > 0) {
            *--d = *--s;
        }
    } else {
        while (n-- > 0) {
  1000b8:	b9 00 00 00 00       	mov    $0x0,%ecx
  1000bd:	48 85 d2             	test   %rdx,%rdx
  1000c0:	74 12                	je     1000d4 <memmove+0x31>
            *d++ = *s++;
  1000c2:	0f b6 3c 0e          	movzbl (%rsi,%rcx,1),%edi
  1000c6:	40 88 3c 08          	mov    %dil,(%rax,%rcx,1)
        while (n-- > 0) {
  1000ca:	48 83 c1 01          	add    $0x1,%rcx
  1000ce:	48 39 d1             	cmp    %rdx,%rcx
  1000d1:	75 ef                	jne    1000c2 <memmove+0x1f>
        }
    }
    return dst;
}
  1000d3:	c3                   	retq   
  1000d4:	c3                   	retq   
        while (n-- > 0) {
  1000d5:	48 8d 4a ff          	lea    -0x1(%rdx),%rcx
  1000d9:	48 85 d2             	test   %rdx,%rdx
  1000dc:	74 f5                	je     1000d3 <memmove+0x30>
            *--d = *--s;
  1000de:	0f b6 14 0e          	movzbl (%rsi,%rcx,1),%edx
  1000e2:	88 14 08             	mov    %dl,(%rax,%rcx,1)
        while (n-- > 0) {
  1000e5:	48 83 e9 01          	sub    $0x1,%rcx
  1000e9:	48 83 f9 ff          	cmp    $0xffffffffffffffff,%rcx
  1000ed:	75 ef                	jne    1000de <memmove+0x3b>
  1000ef:	c3                   	retq   

00000000001000f0 <memset>:

void* memset(void* v, int c, size_t n) {
  1000f0:	f3 0f 1e fa          	endbr64 
  1000f4:	48 89 f8             	mov    %rdi,%rax
    for (char* p = (char*) v; n > 0; ++p, --n) {
  1000f7:	48 85 d2             	test   %rdx,%rdx
  1000fa:	74 13                	je     10010f <memset+0x1f>
  1000fc:	48 8d 0c 17          	lea    (%rdi,%rdx,1),%rcx
  100100:	48 89 fa             	mov    %rdi,%rdx
        *p = c;
  100103:	40 88 32             	mov    %sil,(%rdx)
    for (char* p = (char*) v; n > 0; ++p, --n) {
  100106:	48 83 c2 01          	add    $0x1,%rdx
  10010a:	48 39 d1             	cmp    %rdx,%rcx
  10010d:	75 f4                	jne    100103 <memset+0x13>
    }
    return v;
}
  10010f:	c3                   	retq   

0000000000100110 <strlen>:
        }
    }
    return nullptr;
}

size_t strlen(const char* s) {
  100110:	f3 0f 1e fa          	endbr64 
    size_t n;
    for (n = 0; *s != '\0'; ++s) {
  100114:	80 3f 00             	cmpb   $0x0,(%rdi)
  100117:	74 10                	je     100129 <strlen+0x19>
  100119:	b8 00 00 00 00       	mov    $0x0,%eax
        ++n;
  10011e:	48 83 c0 01          	add    $0x1,%rax
    for (n = 0; *s != '\0'; ++s) {
  100122:	80 3c 07 00          	cmpb   $0x0,(%rdi,%rax,1)
  100126:	75 f6                	jne    10011e <strlen+0xe>
  100128:	c3                   	retq   
  100129:	b8 00 00 00 00       	mov    $0x0,%eax
    }
    return n;
}
  10012e:	c3                   	retq   

000000000010012f <strnlen>:

size_t strnlen(const char* s, size_t maxlen) {
  10012f:	f3 0f 1e fa          	endbr64 
    size_t n;
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
  100133:	48 85 f6             	test   %rsi,%rsi
  100136:	74 15                	je     10014d <strnlen+0x1e>
  100138:	b8 00 00 00 00       	mov    $0x0,%eax
  10013d:	80 3c 07 00          	cmpb   $0x0,(%rdi,%rax,1)
  100141:	74 0d                	je     100150 <strnlen+0x21>
        ++n;
  100143:	48 83 c0 01          	add    $0x1,%rax
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
  100147:	48 39 c6             	cmp    %rax,%rsi
  10014a:	75 f1                	jne    10013d <strnlen+0xe>
  10014c:	c3                   	retq   
  10014d:	48 89 f0             	mov    %rsi,%rax
    }
    return n;
}
  100150:	c3                   	retq   

0000000000100151 <strchr>:
        }
        ++a, ++b, --n;
    }
}

char* strchr(const char* s, int c) {
  100151:	f3 0f 1e fa          	endbr64 
    while (*s && *s != (char) c) {
  100155:	0f b6 07             	movzbl (%rdi),%eax
  100158:	84 c0                	test   %al,%al
  10015a:	74 10                	je     10016c <strchr+0x1b>
  10015c:	40 38 f0             	cmp    %sil,%al
  10015f:	74 18                	je     100179 <strchr+0x28>
        ++s;
  100161:	48 83 c7 01          	add    $0x1,%rdi
    while (*s && *s != (char) c) {
  100165:	0f b6 07             	movzbl (%rdi),%eax
  100168:	84 c0                	test   %al,%al
  10016a:	75 f0                	jne    10015c <strchr+0xb>
    }
    if (*s == (char) c) {
        return (char*) s;
    } else {
        return nullptr;
  10016c:	40 84 f6             	test   %sil,%sil
  10016f:	b8 00 00 00 00       	mov    $0x0,%eax
  100174:	48 0f 44 c7          	cmove  %rdi,%rax
  100178:	c3                   	retq   
  100179:	48 89 f8             	mov    %rdi,%rax
    }
}
  10017c:	c3                   	retq   

000000000010017d <rand()>:
// rand, srand

static int rand_seed_set;
static unsigned long rand_seed;

int rand() {
  10017d:	f3 0f 1e fa          	endbr64 
    if (!rand_seed_set) {
  100181:	83 3d 90 1e 00 00 00 	cmpl   $0x0,0x1e90(%rip)        # 102018 <rand_seed_set>
  100188:	74 27                	je     1001b1 <rand()+0x34>
        srand(819234718U);
    }
    rand_seed = rand_seed * 6364136223846793005UL + 1;
  10018a:	48 b8 2d 7f 95 4c 2d 	movabs $0x5851f42d4c957f2d,%rax
  100191:	f4 51 58 
  100194:	48 0f af 05 74 1e 00 	imul   0x1e74(%rip),%rax        # 102010 <rand_seed>
  10019b:	00 
  10019c:	48 83 c0 01          	add    $0x1,%rax
  1001a0:	48 89 05 69 1e 00 00 	mov    %rax,0x1e69(%rip)        # 102010 <rand_seed>
    return (rand_seed >> 32) & RAND_MAX;
  1001a7:	48 c1 e8 20          	shr    $0x20,%rax
  1001ab:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
}
  1001b0:	c3                   	retq   

void srand(unsigned seed) {
    rand_seed = ((unsigned long) seed << 32) | seed;
  1001b1:	48 b8 9e 87 d4 30 9e 	movabs $0x30d4879e30d4879e,%rax
  1001b8:	87 d4 30 
  1001bb:	48 89 05 4e 1e 00 00 	mov    %rax,0x1e4e(%rip)        # 102010 <rand_seed>
    rand_seed_set = 1;
  1001c2:	c7 05 4c 1e 00 00 01 	movl   $0x1,0x1e4c(%rip)        # 102018 <rand_seed_set>
  1001c9:	00 00 00 
}
  1001cc:	eb bc                	jmp    10018a <rand()+0xd>

00000000001001ce <srand(unsigned int)>:
void srand(unsigned seed) {
  1001ce:	f3 0f 1e fa          	endbr64 
    rand_seed = ((unsigned long) seed << 32) | seed;
  1001d2:	89 f8                	mov    %edi,%eax
  1001d4:	48 c1 e7 20          	shl    $0x20,%rdi
  1001d8:	48 09 c7             	or     %rax,%rdi
  1001db:	48 89 3d 2e 1e 00 00 	mov    %rdi,0x1e2e(%rip)        # 102010 <rand_seed>
    rand_seed_set = 1;
  1001e2:	c7 05 2c 1e 00 00 01 	movl   $0x1,0x1e2c(%rip)        # 102018 <rand_seed_set>
  1001e9:	00 00 00 
}
  1001ec:	c3                   	retq   

00000000001001ed <rand(int, int)>:

// rand(min, max)
//    Return a pseudorandom number roughly evenly distributed between
//    `min` and `max`, inclusive. Requires `min <= max` and
//    `max - min <= RAND_MAX`.
int rand(int min, int max) {
  1001ed:	f3 0f 1e fa          	endbr64 
  1001f1:	55                   	push   %rbp
  1001f2:	48 89 e5             	mov    %rsp,%rbp
  1001f5:	41 54                	push   %r12
  1001f7:	53                   	push   %rbx
    assert(min <= max);
  1001f8:	39 f7                	cmp    %esi,%edi
  1001fa:	7f 27                	jg     100223 <rand(int, int)+0x36>
  1001fc:	41 89 fc             	mov    %edi,%r12d
  1001ff:	89 f3                	mov    %esi,%ebx
    assert(max - min <= RAND_MAX);

    unsigned long r = rand();
  100201:	e8 77 ff ff ff       	callq  10017d <rand()>
  100206:	89 c2                	mov    %eax,%edx
    return min + (r * (max - min + 1)) / ((unsigned long) RAND_MAX + 1);
  100208:	44 29 e3             	sub    %r12d,%ebx
  10020b:	8d 43 01             	lea    0x1(%rbx),%eax
  10020e:	48 98                	cltq   
    unsigned long r = rand();
  100210:	48 63 da             	movslq %edx,%rbx
    return min + (r * (max - min + 1)) / ((unsigned long) RAND_MAX + 1);
  100213:	48 0f af c3          	imul   %rbx,%rax
  100217:	48 c1 e8 1f          	shr    $0x1f,%rax
  10021b:	44 01 e0             	add    %r12d,%eax
}
  10021e:	5b                   	pop    %rbx
  10021f:	41 5c                	pop    %r12
  100221:	5d                   	pop    %rbp
  100222:	c3                   	retq   
    assert(min <= max);
  100223:	b9 00 00 00 00       	mov    $0x0,%ecx
  100228:	ba f0 0c 10 00       	mov    $0x100cf0,%edx
  10022d:	be ff 00 00 00       	mov    $0xff,%esi
  100232:	bf fb 0c 10 00       	mov    $0x100cfb,%edi
  100237:	e8 53 0a 00 00       	callq  100c8f <assert_fail(char const*, int, char const*, char const*)>

000000000010023c <printer::vprintf(int, char const*, __va_list_tag*)>:
#define FLAG_NUMERIC            (1<<5)
#define FLAG_SIGNED             (1<<6)
#define FLAG_NEGATIVE           (1<<7)
#define FLAG_ALT2               (1<<8)

void printer::vprintf(int color, const char* format, va_list val) {
  10023c:	f3 0f 1e fa          	endbr64 
  100240:	55                   	push   %rbp
  100241:	48 89 e5             	mov    %rsp,%rbp
  100244:	41 57                	push   %r15
  100246:	41 56                	push   %r14
  100248:	41 55                	push   %r13
  10024a:	41 54                	push   %r12
  10024c:	53                   	push   %rbx
  10024d:	48 83 ec 58          	sub    $0x58,%rsp
  100251:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
#define NUMBUFSIZ 24
    char numbuf[NUMBUFSIZ];

    for (; *format; ++format) {
  100255:	0f b6 02             	movzbl (%rdx),%eax
  100258:	84 c0                	test   %al,%al
  10025a:	0f 84 c6 07 00 00    	je     100a26 <printer::vprintf(int, char const*, __va_list_tag*)+0x7ea>
  100260:	49 89 fe             	mov    %rdi,%r14
  100263:	41 89 f7             	mov    %esi,%r15d
  100266:	48 89 d3             	mov    %rdx,%rbx
  100269:	e9 b9 03 00 00       	jmpq   100627 <printer::vprintf(int, char const*, __va_list_tag*)+0x3eb>
            continue;
        }

        // process flags
        int flags = 0;
        for (++format; *format; ++format) {
  10026e:	4c 8d 63 01          	lea    0x1(%rbx),%r12
  100272:	0f b6 5b 01          	movzbl 0x1(%rbx),%ebx
  100276:	84 db                	test   %bl,%bl
  100278:	0f 84 8a 07 00 00    	je     100a08 <printer::vprintf(int, char const*, __va_list_tag*)+0x7cc>
        int flags = 0;
  10027e:	41 bd 00 00 00 00    	mov    $0x0,%r13d
            const char* flagc = strchr(flag_chars, *format);
  100284:	0f be f3             	movsbl %bl,%esi
  100287:	bf d0 13 10 00       	mov    $0x1013d0,%edi
  10028c:	e8 c0 fe ff ff       	callq  100151 <strchr>
  100291:	48 89 c1             	mov    %rax,%rcx
            if (flagc) {
  100294:	48 85 c0             	test   %rax,%rax
  100297:	74 74                	je     10030d <printer::vprintf(int, char const*, __va_list_tag*)+0xd1>
                flags |= 1 << (flagc - flag_chars);
  100299:	48 81 e9 d0 13 10 00 	sub    $0x1013d0,%rcx
  1002a0:	b8 01 00 00 00       	mov    $0x1,%eax
  1002a5:	d3 e0                	shl    %cl,%eax
  1002a7:	41 09 c5             	or     %eax,%r13d
        for (++format; *format; ++format) {
  1002aa:	49 83 c4 01          	add    $0x1,%r12
  1002ae:	41 0f b6 1c 24       	movzbl (%r12),%ebx
  1002b3:	84 db                	test   %bl,%bl
  1002b5:	75 cd                	jne    100284 <printer::vprintf(int, char const*, __va_list_tag*)+0x48>
                break;
            }
        }

        // process width
        int width = -1;
  1002b7:	c7 45 98 ff ff ff ff 	movl   $0xffffffff,-0x68(%rbp)
            width = va_arg(val, int);
            ++format;
        }

        // process precision
        int precision = -1;
  1002be:	c7 45 a4 ff ff ff ff 	movl   $0xffffffff,-0x5c(%rbp)
        if (*format == '.') {
  1002c5:	41 80 3c 24 2e       	cmpb   $0x2e,(%r12)
  1002ca:	0f 84 cc 00 00 00    	je     10039c <printer::vprintf(int, char const*, __va_list_tag*)+0x160>
            }
        }

        // process length
        int length = 0;
        switch (*format) {
  1002d0:	41 0f b6 04 24       	movzbl (%r12),%eax
  1002d5:	3c 6c                	cmp    $0x6c,%al
  1002d7:	0f 84 54 01 00 00    	je     100431 <printer::vprintf(int, char const*, __va_list_tag*)+0x1f5>
  1002dd:	0f 8f 42 01 00 00    	jg     100425 <printer::vprintf(int, char const*, __va_list_tag*)+0x1e9>
  1002e3:	3c 68                	cmp    $0x68,%al
  1002e5:	0f 85 68 01 00 00    	jne    100453 <printer::vprintf(int, char const*, __va_list_tag*)+0x217>
        case 'z': // size_t, ssize_t
            length = 1;
            ++format;
            break;
        case 'h':
            ++format;
  1002eb:	49 8d 4c 24 01       	lea    0x1(%r12),%rcx
        // process main conversion character
        int base = 10;
        unsigned long num = 0;
        const char* data = "";

        switch (*format) {
  1002f0:	41 0f b6 44 24 01    	movzbl 0x1(%r12),%eax
  1002f6:	8d 50 bd             	lea    -0x43(%rax),%edx
  1002f9:	80 fa 35             	cmp    $0x35,%dl
  1002fc:	0f 87 aa 05 00 00    	ja     1008ac <printer::vprintf(int, char const*, __va_list_tag*)+0x670>
  100302:	0f b6 d2             	movzbl %dl,%edx
  100305:	3e ff 24 d5 10 0d 10 	notrack jmpq *0x100d10(,%rdx,8)
  10030c:	00 
        if (*format >= '1' && *format <= '9') {
  10030d:	8d 43 cf             	lea    -0x31(%rbx),%eax
  100310:	3c 08                	cmp    $0x8,%al
  100312:	77 35                	ja     100349 <printer::vprintf(int, char const*, __va_list_tag*)+0x10d>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  100314:	41 0f b6 04 24       	movzbl (%r12),%eax
  100319:	8d 50 d0             	lea    -0x30(%rax),%edx
  10031c:	80 fa 09             	cmp    $0x9,%dl
  10031f:	77 63                	ja     100384 <printer::vprintf(int, char const*, __va_list_tag*)+0x148>
  100321:	ba 00 00 00 00       	mov    $0x0,%edx
                width = 10 * width + *format++ - '0';
  100326:	49 83 c4 01          	add    $0x1,%r12
  10032a:	8d 14 92             	lea    (%rdx,%rdx,4),%edx
  10032d:	0f be c0             	movsbl %al,%eax
  100330:	8d 54 50 d0          	lea    -0x30(%rax,%rdx,2),%edx
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  100334:	41 0f b6 04 24       	movzbl (%r12),%eax
  100339:	8d 48 d0             	lea    -0x30(%rax),%ecx
  10033c:	80 f9 09             	cmp    $0x9,%cl
  10033f:	76 e5                	jbe    100326 <printer::vprintf(int, char const*, __va_list_tag*)+0xea>
  100341:	89 55 98             	mov    %edx,-0x68(%rbp)
  100344:	e9 75 ff ff ff       	jmpq   1002be <printer::vprintf(int, char const*, __va_list_tag*)+0x82>
        } else if (*format == '*') {
  100349:	80 fb 2a             	cmp    $0x2a,%bl
  10034c:	75 42                	jne    100390 <printer::vprintf(int, char const*, __va_list_tag*)+0x154>
            width = va_arg(val, int);
  10034e:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  100352:	8b 07                	mov    (%rdi),%eax
  100354:	83 f8 2f             	cmp    $0x2f,%eax
  100357:	77 19                	ja     100372 <printer::vprintf(int, char const*, __va_list_tag*)+0x136>
  100359:	89 c2                	mov    %eax,%edx
  10035b:	48 03 57 10          	add    0x10(%rdi),%rdx
  10035f:	83 c0 08             	add    $0x8,%eax
  100362:	89 07                	mov    %eax,(%rdi)
  100364:	8b 02                	mov    (%rdx),%eax
  100366:	89 45 98             	mov    %eax,-0x68(%rbp)
            ++format;
  100369:	49 83 c4 01          	add    $0x1,%r12
  10036d:	e9 4c ff ff ff       	jmpq   1002be <printer::vprintf(int, char const*, __va_list_tag*)+0x82>
            width = va_arg(val, int);
  100372:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  100376:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  10037a:	48 8d 42 08          	lea    0x8(%rdx),%rax
  10037e:	48 89 47 08          	mov    %rax,0x8(%rdi)
  100382:	eb e0                	jmp    100364 <printer::vprintf(int, char const*, __va_list_tag*)+0x128>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  100384:	c7 45 98 00 00 00 00 	movl   $0x0,-0x68(%rbp)
  10038b:	e9 2e ff ff ff       	jmpq   1002be <printer::vprintf(int, char const*, __va_list_tag*)+0x82>
        int width = -1;
  100390:	c7 45 98 ff ff ff ff 	movl   $0xffffffff,-0x68(%rbp)
  100397:	e9 22 ff ff ff       	jmpq   1002be <printer::vprintf(int, char const*, __va_list_tag*)+0x82>
            ++format;
  10039c:	49 8d 54 24 01       	lea    0x1(%r12),%rdx
            if (*format >= '0' && *format <= '9') {
  1003a1:	41 0f b6 44 24 01    	movzbl 0x1(%r12),%eax
  1003a7:	8d 48 d0             	lea    -0x30(%rax),%ecx
  1003aa:	80 f9 09             	cmp    $0x9,%cl
  1003ad:	76 13                	jbe    1003c2 <printer::vprintf(int, char const*, __va_list_tag*)+0x186>
            } else if (*format == '*') {
  1003af:	3c 2a                	cmp    $0x2a,%al
  1003b1:	74 32                	je     1003e5 <printer::vprintf(int, char const*, __va_list_tag*)+0x1a9>
            ++format;
  1003b3:	49 89 d4             	mov    %rdx,%r12
                precision = 0;
  1003b6:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%rbp)
  1003bd:	e9 0e ff ff ff       	jmpq   1002d0 <printer::vprintf(int, char const*, __va_list_tag*)+0x94>
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
  1003c2:	be 00 00 00 00       	mov    $0x0,%esi
                    precision = 10 * precision + *format++ - '0';
  1003c7:	48 83 c2 01          	add    $0x1,%rdx
  1003cb:	8d 0c b6             	lea    (%rsi,%rsi,4),%ecx
  1003ce:	0f be c0             	movsbl %al,%eax
  1003d1:	8d 74 48 d0          	lea    -0x30(%rax,%rcx,2),%esi
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
  1003d5:	0f b6 02             	movzbl (%rdx),%eax
  1003d8:	8d 48 d0             	lea    -0x30(%rax),%ecx
  1003db:	80 f9 09             	cmp    $0x9,%cl
  1003de:	76 e7                	jbe    1003c7 <printer::vprintf(int, char const*, __va_list_tag*)+0x18b>
                    precision = 10 * precision + *format++ - '0';
  1003e0:	49 89 d4             	mov    %rdx,%r12
  1003e3:	eb 1c                	jmp    100401 <printer::vprintf(int, char const*, __va_list_tag*)+0x1c5>
                precision = va_arg(val, int);
  1003e5:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1003e9:	8b 01                	mov    (%rcx),%eax
  1003eb:	83 f8 2f             	cmp    $0x2f,%eax
  1003ee:	77 23                	ja     100413 <printer::vprintf(int, char const*, __va_list_tag*)+0x1d7>
  1003f0:	89 c2                	mov    %eax,%edx
  1003f2:	48 03 51 10          	add    0x10(%rcx),%rdx
  1003f6:	83 c0 08             	add    $0x8,%eax
  1003f9:	89 01                	mov    %eax,(%rcx)
  1003fb:	8b 32                	mov    (%rdx),%esi
                ++format;
  1003fd:	49 83 c4 02          	add    $0x2,%r12
            if (precision < 0) {
  100401:	85 f6                	test   %esi,%esi
  100403:	b8 00 00 00 00       	mov    $0x0,%eax
  100408:	0f 49 c6             	cmovns %esi,%eax
  10040b:	89 45 a4             	mov    %eax,-0x5c(%rbp)
  10040e:	e9 bd fe ff ff       	jmpq   1002d0 <printer::vprintf(int, char const*, __va_list_tag*)+0x94>
                precision = va_arg(val, int);
  100413:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  100417:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  10041b:	48 8d 42 08          	lea    0x8(%rdx),%rax
  10041f:	48 89 47 08          	mov    %rax,0x8(%rdi)
  100423:	eb d6                	jmp    1003fb <printer::vprintf(int, char const*, __va_list_tag*)+0x1bf>
        switch (*format) {
  100425:	3c 74                	cmp    $0x74,%al
  100427:	74 08                	je     100431 <printer::vprintf(int, char const*, __va_list_tag*)+0x1f5>
  100429:	3c 7a                	cmp    $0x7a,%al
  10042b:	0f 85 e2 05 00 00    	jne    100a13 <printer::vprintf(int, char const*, __va_list_tag*)+0x7d7>
            ++format;
  100431:	49 8d 4c 24 01       	lea    0x1(%r12),%rcx
        switch (*format) {
  100436:	41 0f b6 44 24 01    	movzbl 0x1(%r12),%eax
  10043c:	8d 50 bd             	lea    -0x43(%rax),%edx
  10043f:	80 fa 35             	cmp    $0x35,%dl
  100442:	0f 87 64 04 00 00    	ja     1008ac <printer::vprintf(int, char const*, __va_list_tag*)+0x670>
  100448:	0f b6 d2             	movzbl %dl,%edx
  10044b:	3e ff 24 d5 c0 0e 10 	notrack jmpq *0x100ec0(,%rdx,8)
  100452:	00 
  100453:	8d 50 bd             	lea    -0x43(%rax),%edx
  100456:	80 fa 35             	cmp    $0x35,%dl
  100459:	0f 87 4a 04 00 00    	ja     1008a9 <printer::vprintf(int, char const*, __va_list_tag*)+0x66d>
  10045f:	0f b6 d2             	movzbl %dl,%edx
  100462:	3e ff 24 d5 70 10 10 	notrack jmpq *0x101070(,%rdx,8)
  100469:	00 
        case 'd':
        case 'i': {
            long x = length ? va_arg(val, long) : va_arg(val, int);
  10046a:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  10046e:	8b 07                	mov    (%rdi),%eax
  100470:	83 f8 2f             	cmp    $0x2f,%eax
  100473:	0f 87 c9 01 00 00    	ja     100642 <printer::vprintf(int, char const*, __va_list_tag*)+0x406>
  100479:	89 c2                	mov    %eax,%edx
  10047b:	48 03 57 10          	add    0x10(%rdi),%rdx
  10047f:	83 c0 08             	add    $0x8,%eax
  100482:	89 07                	mov    %eax,(%rdi)
  100484:	48 8b 12             	mov    (%rdx),%rdx
  100487:	49 89 cc             	mov    %rcx,%r12
            int negative = x < 0 ? FLAG_NEGATIVE : 0;
  10048a:	48 89 d0             	mov    %rdx,%rax
  10048d:	48 c1 f8 38          	sar    $0x38,%rax
            num = negative ? -x : x;
  100491:	49 89 d0             	mov    %rdx,%r8
  100494:	49 f7 d8             	neg    %r8
  100497:	25 80 00 00 00       	and    $0x80,%eax
  10049c:	4c 0f 44 c2          	cmove  %rdx,%r8
            flags |= FLAG_NUMERIC | FLAG_SIGNED | negative;
  1004a0:	41 09 c5             	or     %eax,%r13d
  1004a3:	41 83 cd 60          	or     $0x60,%r13d
        const char* data = "";
  1004a7:	bb a5 14 10 00       	mov    $0x1014a5,%ebx
                format--;
            }
            break;
        }

        if (flags & FLAG_NUMERIC) {
  1004ac:	44 89 e8             	mov    %r13d,%eax
  1004af:	83 e0 20             	and    $0x20,%eax
  1004b2:	89 45 9c             	mov    %eax,-0x64(%rbp)
  1004b5:	41 b9 0a 00 00 00    	mov    $0xa,%r9d
  1004bb:	0f 85 0e 04 00 00    	jne    1008cf <printer::vprintf(int, char const*, __va_list_tag*)+0x693>
            data = fill_numbuf(numbuf + NUMBUFSIZ, num, base);
        }

        const char* prefix = "";
        if ((flags & FLAG_NUMERIC) && (flags & FLAG_SIGNED)) {
  1004c1:	44 89 6d 8c          	mov    %r13d,-0x74(%rbp)
  1004c5:	44 89 e8             	mov    %r13d,%eax
  1004c8:	83 e0 60             	and    $0x60,%eax
  1004cb:	83 f8 60             	cmp    $0x60,%eax
  1004ce:	0f 84 3e 04 00 00    	je     100912 <printer::vprintf(int, char const*, __va_list_tag*)+0x6d6>
            } else if (flags & FLAG_PLUSPOSITIVE) {
                prefix = "+";
            } else if (flags & FLAG_SPACEPOSITIVE) {
                prefix = " ";
            }
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
  1004d4:	44 89 e8             	mov    %r13d,%eax
  1004d7:	83 e0 21             	and    $0x21,%eax
        const char* prefix = "";
  1004da:	48 c7 45 a8 a5 14 10 	movq   $0x1014a5,-0x58(%rbp)
  1004e1:	00 
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
  1004e2:	83 f8 21             	cmp    $0x21,%eax
  1004e5:	0f 84 66 04 00 00    	je     100951 <printer::vprintf(int, char const*, __va_list_tag*)+0x715>
                   && (num || (flags & FLAG_ALT2))) {
            prefix = (base == -16 ? "0x" : "0X");
        }

        int datalen;
        if (precision >= 0 && !(flags & FLAG_NUMERIC)) {
  1004eb:	8b 4d a4             	mov    -0x5c(%rbp),%ecx
  1004ee:	89 c8                	mov    %ecx,%eax
  1004f0:	f7 d0                	not    %eax
  1004f2:	c1 e8 1f             	shr    $0x1f,%eax
  1004f5:	89 45 88             	mov    %eax,-0x78(%rbp)
  1004f8:	83 7d 9c 00          	cmpl   $0x0,-0x64(%rbp)
  1004fc:	0f 85 8b 04 00 00    	jne    10098d <printer::vprintf(int, char const*, __va_list_tag*)+0x751>
  100502:	84 c0                	test   %al,%al
  100504:	0f 84 83 04 00 00    	je     10098d <printer::vprintf(int, char const*, __va_list_tag*)+0x751>
            datalen = strnlen(data, precision);
  10050a:	48 63 f1             	movslq %ecx,%rsi
  10050d:	48 89 df             	mov    %rbx,%rdi
  100510:	e8 1a fc ff ff       	callq  10012f <strnlen>
  100515:	89 45 a0             	mov    %eax,-0x60(%rbp)
        if ((flags & FLAG_NUMERIC)
            && precision >= 0) {
            zeros = precision > datalen ? precision - datalen : 0;
        } else if ((flags & FLAG_NUMERIC)
                   && (flags & FLAG_ZERO)
                   && !(flags & FLAG_LEFTJUSTIFY)
  100518:	8b 45 8c             	mov    -0x74(%rbp),%eax
  10051b:	83 e0 26             	and    $0x26,%eax
                   && datalen + (int) strlen(prefix) < width) {
            zeros = width - datalen - strlen(prefix);
        } else {
            zeros = 0;
  10051e:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%rbp)
                   && datalen + (int) strlen(prefix) < width) {
  100525:	83 f8 22             	cmp    $0x22,%eax
  100528:	0f 84 97 04 00 00    	je     1009c5 <printer::vprintf(int, char const*, __va_list_tag*)+0x789>
        }

        width -= datalen + zeros + strlen(prefix);
  10052e:	48 8b 7d a8          	mov    -0x58(%rbp),%rdi
  100532:	e8 d9 fb ff ff       	callq  100110 <strlen>
  100537:	8b 55 a4             	mov    -0x5c(%rbp),%edx
  10053a:	03 55 a0             	add    -0x60(%rbp),%edx
  10053d:	8b 7d 98             	mov    -0x68(%rbp),%edi
  100540:	29 d7                	sub    %edx,%edi
  100542:	89 fa                	mov    %edi,%edx
  100544:	29 c2                	sub    %eax,%edx
  100546:	89 55 98             	mov    %edx,-0x68(%rbp)
  100549:	89 55 9c             	mov    %edx,-0x64(%rbp)
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
  10054c:	41 f6 c5 04          	test   $0x4,%r13b
  100550:	75 32                	jne    100584 <printer::vprintf(int, char const*, __va_list_tag*)+0x348>
        width -= datalen + zeros + strlen(prefix);
  100552:	41 89 d5             	mov    %edx,%r13d
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
  100555:	85 d2                	test   %edx,%edx
  100557:	7e 2b                	jle    100584 <printer::vprintf(int, char const*, __va_list_tag*)+0x348>
            putc(' ', color);
  100559:	49 8b 06             	mov    (%r14),%rax
  10055c:	44 89 fa             	mov    %r15d,%edx
  10055f:	be 20 00 00 00       	mov    $0x20,%esi
  100564:	4c 89 f7             	mov    %r14,%rdi
  100567:	ff 10                	callq  *(%rax)
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
  100569:	41 83 ed 01          	sub    $0x1,%r13d
  10056d:	45 85 ed             	test   %r13d,%r13d
  100570:	7f e7                	jg     100559 <printer::vprintf(int, char const*, __va_list_tag*)+0x31d>
  100572:	8b 7d 98             	mov    -0x68(%rbp),%edi
  100575:	85 ff                	test   %edi,%edi
  100577:	b8 01 00 00 00       	mov    $0x1,%eax
  10057c:	0f 4f c7             	cmovg  %edi,%eax
  10057f:	29 c7                	sub    %eax,%edi
  100581:	89 7d 9c             	mov    %edi,-0x64(%rbp)
        }
        for (; *prefix; ++prefix) {
  100584:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  100588:	0f b6 00             	movzbl (%rax),%eax
  10058b:	4c 8b 6d a8          	mov    -0x58(%rbp),%r13
  10058f:	84 c0                	test   %al,%al
  100591:	74 1b                	je     1005ae <printer::vprintf(int, char const*, __va_list_tag*)+0x372>
            putc(*prefix, color);
  100593:	0f b6 f0             	movzbl %al,%esi
  100596:	49 8b 06             	mov    (%r14),%rax
  100599:	44 89 fa             	mov    %r15d,%edx
  10059c:	4c 89 f7             	mov    %r14,%rdi
  10059f:	ff 10                	callq  *(%rax)
        for (; *prefix; ++prefix) {
  1005a1:	49 83 c5 01          	add    $0x1,%r13
  1005a5:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
  1005aa:	84 c0                	test   %al,%al
  1005ac:	75 e5                	jne    100593 <printer::vprintf(int, char const*, __va_list_tag*)+0x357>
        }
        for (; zeros > 0; --zeros) {
  1005ae:	44 8b 6d a4          	mov    -0x5c(%rbp),%r13d
  1005b2:	83 7d a4 00          	cmpl   $0x0,-0x5c(%rbp)
  1005b6:	7e 16                	jle    1005ce <printer::vprintf(int, char const*, __va_list_tag*)+0x392>
            putc('0', color);
  1005b8:	49 8b 06             	mov    (%r14),%rax
  1005bb:	44 89 fa             	mov    %r15d,%edx
  1005be:	be 30 00 00 00       	mov    $0x30,%esi
  1005c3:	4c 89 f7             	mov    %r14,%rdi
  1005c6:	ff 10                	callq  *(%rax)
        for (; zeros > 0; --zeros) {
  1005c8:	41 83 ed 01          	sub    $0x1,%r13d
  1005cc:	75 ea                	jne    1005b8 <printer::vprintf(int, char const*, __va_list_tag*)+0x37c>
        }
        for (; datalen > 0; ++data, --datalen) {
  1005ce:	83 7d a0 00          	cmpl   $0x0,-0x60(%rbp)
  1005d2:	7e 22                	jle    1005f6 <printer::vprintf(int, char const*, __va_list_tag*)+0x3ba>
  1005d4:	8b 45 a0             	mov    -0x60(%rbp),%eax
  1005d7:	8d 40 ff             	lea    -0x1(%rax),%eax
  1005da:	4c 8d 6c 03 01       	lea    0x1(%rbx,%rax,1),%r13
            putc(*data, color);
  1005df:	0f b6 33             	movzbl (%rbx),%esi
  1005e2:	49 8b 06             	mov    (%r14),%rax
  1005e5:	44 89 fa             	mov    %r15d,%edx
  1005e8:	4c 89 f7             	mov    %r14,%rdi
  1005eb:	ff 10                	callq  *(%rax)
        for (; datalen > 0; ++data, --datalen) {
  1005ed:	48 83 c3 01          	add    $0x1,%rbx
  1005f1:	4c 39 eb             	cmp    %r13,%rbx
  1005f4:	75 e9                	jne    1005df <printer::vprintf(int, char const*, __va_list_tag*)+0x3a3>
        }
        for (; width > 0; --width) {
  1005f6:	8b 5d 9c             	mov    -0x64(%rbp),%ebx
  1005f9:	83 7d 9c 00          	cmpl   $0x0,-0x64(%rbp)
  1005fd:	7e 15                	jle    100614 <printer::vprintf(int, char const*, __va_list_tag*)+0x3d8>
            putc(' ', color);
  1005ff:	49 8b 06             	mov    (%r14),%rax
  100602:	44 89 fa             	mov    %r15d,%edx
  100605:	be 20 00 00 00       	mov    $0x20,%esi
  10060a:	4c 89 f7             	mov    %r14,%rdi
  10060d:	ff 10                	callq  *(%rax)
        for (; width > 0; --width) {
  10060f:	83 eb 01             	sub    $0x1,%ebx
  100612:	75 eb                	jne    1005ff <printer::vprintf(int, char const*, __va_list_tag*)+0x3c3>
    for (; *format; ++format) {
  100614:	49 8d 5c 24 01       	lea    0x1(%r12),%rbx
  100619:	41 0f b6 44 24 01    	movzbl 0x1(%r12),%eax
  10061f:	84 c0                	test   %al,%al
  100621:	0f 84 ff 03 00 00    	je     100a26 <printer::vprintf(int, char const*, __va_list_tag*)+0x7ea>
        if (*format != '%') {
  100627:	3c 25                	cmp    $0x25,%al
  100629:	0f 84 3f fc ff ff    	je     10026e <printer::vprintf(int, char const*, __va_list_tag*)+0x32>
            putc(*format, color);
  10062f:	0f b6 f0             	movzbl %al,%esi
  100632:	49 8b 06             	mov    (%r14),%rax
  100635:	44 89 fa             	mov    %r15d,%edx
  100638:	4c 89 f7             	mov    %r14,%rdi
  10063b:	ff 10                	callq  *(%rax)
            continue;
  10063d:	49 89 dc             	mov    %rbx,%r12
  100640:	eb d2                	jmp    100614 <printer::vprintf(int, char const*, __va_list_tag*)+0x3d8>
            long x = length ? va_arg(val, long) : va_arg(val, int);
  100642:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  100646:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  10064a:	48 8d 42 08          	lea    0x8(%rdx),%rax
  10064e:	48 89 47 08          	mov    %rax,0x8(%rdi)
  100652:	e9 2d fe ff ff       	jmpq   100484 <printer::vprintf(int, char const*, __va_list_tag*)+0x248>
        switch (*format) {
  100657:	49 89 cc             	mov    %rcx,%r12
            long x = length ? va_arg(val, long) : va_arg(val, int);
  10065a:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  10065e:	8b 01                	mov    (%rcx),%eax
  100660:	83 f8 2f             	cmp    $0x2f,%eax
  100663:	77 13                	ja     100678 <printer::vprintf(int, char const*, __va_list_tag*)+0x43c>
  100665:	89 c2                	mov    %eax,%edx
  100667:	48 03 51 10          	add    0x10(%rcx),%rdx
  10066b:	83 c0 08             	add    $0x8,%eax
  10066e:	89 01                	mov    %eax,(%rcx)
  100670:	48 63 12             	movslq (%rdx),%rdx
  100673:	e9 12 fe ff ff       	jmpq   10048a <printer::vprintf(int, char const*, __va_list_tag*)+0x24e>
  100678:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  10067c:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  100680:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100684:	48 89 41 08          	mov    %rax,0x8(%rcx)
  100688:	eb e6                	jmp    100670 <printer::vprintf(int, char const*, __va_list_tag*)+0x434>
        switch (*format) {
  10068a:	49 89 cc             	mov    %rcx,%r12
  10068d:	b8 01 00 00 00       	mov    $0x1,%eax
  100692:	be 0a 00 00 00       	mov    $0xa,%esi
  100697:	e9 a8 00 00 00       	jmpq   100744 <printer::vprintf(int, char const*, __va_list_tag*)+0x508>
  10069c:	49 89 cc             	mov    %rcx,%r12
  10069f:	b8 00 00 00 00       	mov    $0x0,%eax
  1006a4:	be 0a 00 00 00       	mov    $0xa,%esi
  1006a9:	e9 96 00 00 00       	jmpq   100744 <printer::vprintf(int, char const*, __va_list_tag*)+0x508>
        switch (*format) {
  1006ae:	b8 00 00 00 00       	mov    $0x0,%eax
  1006b3:	be 0a 00 00 00       	mov    $0xa,%esi
  1006b8:	e9 87 00 00 00       	jmpq   100744 <printer::vprintf(int, char const*, __va_list_tag*)+0x508>
  1006bd:	b8 00 00 00 00       	mov    $0x0,%eax
  1006c2:	be 0a 00 00 00       	mov    $0xa,%esi
  1006c7:	eb 7b                	jmp    100744 <printer::vprintf(int, char const*, __va_list_tag*)+0x508>
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
  1006c9:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1006cd:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  1006d1:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1006d5:	48 89 47 08          	mov    %rax,0x8(%rdi)
  1006d9:	e9 84 00 00 00       	jmpq   100762 <printer::vprintf(int, char const*, __va_list_tag*)+0x526>
  1006de:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1006e2:	8b 01                	mov    (%rcx),%eax
  1006e4:	83 f8 2f             	cmp    $0x2f,%eax
  1006e7:	77 10                	ja     1006f9 <printer::vprintf(int, char const*, __va_list_tag*)+0x4bd>
  1006e9:	89 c2                	mov    %eax,%edx
  1006eb:	48 03 51 10          	add    0x10(%rcx),%rdx
  1006ef:	83 c0 08             	add    $0x8,%eax
  1006f2:	89 01                	mov    %eax,(%rcx)
  1006f4:	44 8b 02             	mov    (%rdx),%r8d
  1006f7:	eb 6c                	jmp    100765 <printer::vprintf(int, char const*, __va_list_tag*)+0x529>
  1006f9:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1006fd:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  100701:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100705:	48 89 41 08          	mov    %rax,0x8(%rcx)
  100709:	eb e9                	jmp    1006f4 <printer::vprintf(int, char const*, __va_list_tag*)+0x4b8>
  10070b:	41 89 f1             	mov    %esi,%r9d
        if (flags & FLAG_NUMERIC) {
  10070e:	c7 45 9c 20 00 00 00 	movl   $0x20,-0x64(%rbp)
    const char* digits = upper_digits;
  100715:	bf 00 14 10 00       	mov    $0x101400,%edi
  10071a:	e9 c0 01 00 00       	jmpq   1008df <printer::vprintf(int, char const*, __va_list_tag*)+0x6a3>
        switch (*format) {
  10071f:	49 89 cc             	mov    %rcx,%r12
  100722:	b8 01 00 00 00       	mov    $0x1,%eax
  100727:	eb 16                	jmp    10073f <printer::vprintf(int, char const*, __va_list_tag*)+0x503>
  100729:	49 89 cc             	mov    %rcx,%r12
  10072c:	b8 00 00 00 00       	mov    $0x0,%eax
  100731:	eb 0c                	jmp    10073f <printer::vprintf(int, char const*, __va_list_tag*)+0x503>
        switch (*format) {
  100733:	b8 00 00 00 00       	mov    $0x0,%eax
  100738:	eb 05                	jmp    10073f <printer::vprintf(int, char const*, __va_list_tag*)+0x503>
  10073a:	b8 00 00 00 00       	mov    $0x0,%eax
            base = -16;
  10073f:	be f0 ff ff ff       	mov    $0xfffffff0,%esi
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
  100744:	85 c0                	test   %eax,%eax
  100746:	74 96                	je     1006de <printer::vprintf(int, char const*, __va_list_tag*)+0x4a2>
  100748:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  10074c:	8b 01                	mov    (%rcx),%eax
  10074e:	83 f8 2f             	cmp    $0x2f,%eax
  100751:	0f 87 72 ff ff ff    	ja     1006c9 <printer::vprintf(int, char const*, __va_list_tag*)+0x48d>
  100757:	89 c2                	mov    %eax,%edx
  100759:	48 03 51 10          	add    0x10(%rcx),%rdx
  10075d:	83 c0 08             	add    $0x8,%eax
  100760:	89 01                	mov    %eax,(%rcx)
  100762:	4c 8b 02             	mov    (%rdx),%r8
            flags |= FLAG_NUMERIC;
  100765:	41 83 cd 20          	or     $0x20,%r13d
    if (base < 0) {
  100769:	85 f6                	test   %esi,%esi
  10076b:	79 9e                	jns    10070b <printer::vprintf(int, char const*, __va_list_tag*)+0x4cf>
        base = -base;
  10076d:	41 89 f1             	mov    %esi,%r9d
  100770:	f7 de                	neg    %esi
  100772:	c7 45 9c 20 00 00 00 	movl   $0x20,-0x64(%rbp)
        digits = lower_digits;
  100779:	bf e0 13 10 00       	mov    $0x1013e0,%edi
  10077e:	e9 5c 01 00 00       	jmpq   1008df <printer::vprintf(int, char const*, __va_list_tag*)+0x6a3>
        switch (*format) {
  100783:	49 89 cc             	mov    %rcx,%r12
  100786:	b8 01 00 00 00       	mov    $0x1,%eax
  10078b:	eb 16                	jmp    1007a3 <printer::vprintf(int, char const*, __va_list_tag*)+0x567>
  10078d:	49 89 cc             	mov    %rcx,%r12
  100790:	b8 00 00 00 00       	mov    $0x0,%eax
  100795:	eb 0c                	jmp    1007a3 <printer::vprintf(int, char const*, __va_list_tag*)+0x567>
        switch (*format) {
  100797:	b8 00 00 00 00       	mov    $0x0,%eax
  10079c:	eb 05                	jmp    1007a3 <printer::vprintf(int, char const*, __va_list_tag*)+0x567>
  10079e:	b8 00 00 00 00       	mov    $0x0,%eax
            base = 16;
  1007a3:	be 10 00 00 00       	mov    $0x10,%esi
            goto format_unsigned;
  1007a8:	eb 9a                	jmp    100744 <printer::vprintf(int, char const*, __va_list_tag*)+0x508>
        switch (*format) {
  1007aa:	49 89 cc             	mov    %rcx,%r12
            num = (uintptr_t) va_arg(val, void*);
  1007ad:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1007b1:	8b 01                	mov    (%rcx),%eax
  1007b3:	83 f8 2f             	cmp    $0x2f,%eax
  1007b6:	77 21                	ja     1007d9 <printer::vprintf(int, char const*, __va_list_tag*)+0x59d>
  1007b8:	89 c2                	mov    %eax,%edx
  1007ba:	48 03 51 10          	add    0x10(%rcx),%rdx
  1007be:	83 c0 08             	add    $0x8,%eax
  1007c1:	89 01                	mov    %eax,(%rcx)
  1007c3:	4c 8b 02             	mov    (%rdx),%r8
            flags |= FLAG_ALT | FLAG_ALT2 | FLAG_NUMERIC;
  1007c6:	41 81 cd 21 01 00 00 	or     $0x121,%r13d
            base = -16;
  1007cd:	be f0 ff ff ff       	mov    $0xfffffff0,%esi
  1007d2:	eb 99                	jmp    10076d <printer::vprintf(int, char const*, __va_list_tag*)+0x531>
        switch (*format) {
  1007d4:	49 89 cc             	mov    %rcx,%r12
  1007d7:	eb d4                	jmp    1007ad <printer::vprintf(int, char const*, __va_list_tag*)+0x571>
            num = (uintptr_t) va_arg(val, void*);
  1007d9:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1007dd:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  1007e1:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1007e5:	48 89 47 08          	mov    %rax,0x8(%rdi)
  1007e9:	eb d8                	jmp    1007c3 <printer::vprintf(int, char const*, __va_list_tag*)+0x587>
        switch (*format) {
  1007eb:	49 89 cc             	mov    %rcx,%r12
            data = va_arg(val, char*);
  1007ee:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1007f2:	8b 07                	mov    (%rdi),%eax
  1007f4:	83 f8 2f             	cmp    $0x2f,%eax
  1007f7:	77 1e                	ja     100817 <printer::vprintf(int, char const*, __va_list_tag*)+0x5db>
  1007f9:	89 c2                	mov    %eax,%edx
  1007fb:	48 03 57 10          	add    0x10(%rdi),%rdx
  1007ff:	83 c0 08             	add    $0x8,%eax
  100802:	89 07                	mov    %eax,(%rdi)
  100804:	48 8b 1a             	mov    (%rdx),%rbx
        unsigned long num = 0;
  100807:	41 b8 00 00 00 00    	mov    $0x0,%r8d
            break;
  10080d:	e9 9a fc ff ff       	jmpq   1004ac <printer::vprintf(int, char const*, __va_list_tag*)+0x270>
        switch (*format) {
  100812:	49 89 cc             	mov    %rcx,%r12
  100815:	eb d7                	jmp    1007ee <printer::vprintf(int, char const*, __va_list_tag*)+0x5b2>
            data = va_arg(val, char*);
  100817:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  10081b:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  10081f:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100823:	48 89 41 08          	mov    %rax,0x8(%rcx)
  100827:	eb db                	jmp    100804 <printer::vprintf(int, char const*, __va_list_tag*)+0x5c8>
        switch (*format) {
  100829:	49 89 cc             	mov    %rcx,%r12
            color = va_arg(val, int);
  10082c:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  100830:	8b 01                	mov    (%rcx),%eax
  100832:	83 f8 2f             	cmp    $0x2f,%eax
  100835:	77 18                	ja     10084f <printer::vprintf(int, char const*, __va_list_tag*)+0x613>
  100837:	89 c2                	mov    %eax,%edx
  100839:	48 03 51 10          	add    0x10(%rcx),%rdx
  10083d:	83 c0 08             	add    $0x8,%eax
  100840:	89 01                	mov    %eax,(%rcx)
  100842:	44 8b 3a             	mov    (%rdx),%r15d
            continue;
  100845:	e9 ca fd ff ff       	jmpq   100614 <printer::vprintf(int, char const*, __va_list_tag*)+0x3d8>
        switch (*format) {
  10084a:	49 89 cc             	mov    %rcx,%r12
  10084d:	eb dd                	jmp    10082c <printer::vprintf(int, char const*, __va_list_tag*)+0x5f0>
            color = va_arg(val, int);
  10084f:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  100853:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  100857:	48 8d 42 08          	lea    0x8(%rdx),%rax
  10085b:	48 89 47 08          	mov    %rax,0x8(%rdi)
  10085f:	eb e1                	jmp    100842 <printer::vprintf(int, char const*, __va_list_tag*)+0x606>
        switch (*format) {
  100861:	49 89 cc             	mov    %rcx,%r12
            numbuf[0] = va_arg(val, int);
  100864:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  100868:	8b 07                	mov    (%rdi),%eax
  10086a:	83 f8 2f             	cmp    $0x2f,%eax
  10086d:	77 28                	ja     100897 <printer::vprintf(int, char const*, __va_list_tag*)+0x65b>
  10086f:	89 c2                	mov    %eax,%edx
  100871:	48 03 57 10          	add    0x10(%rdi),%rdx
  100875:	83 c0 08             	add    $0x8,%eax
  100878:	89 07                	mov    %eax,(%rdi)
  10087a:	8b 02                	mov    (%rdx),%eax
  10087c:	88 45 b8             	mov    %al,-0x48(%rbp)
            numbuf[1] = '\0';
  10087f:	c6 45 b9 00          	movb   $0x0,-0x47(%rbp)
            data = numbuf;
  100883:	48 8d 5d b8          	lea    -0x48(%rbp),%rbx
        unsigned long num = 0;
  100887:	41 b8 00 00 00 00    	mov    $0x0,%r8d
            break;
  10088d:	e9 1a fc ff ff       	jmpq   1004ac <printer::vprintf(int, char const*, __va_list_tag*)+0x270>
        switch (*format) {
  100892:	49 89 cc             	mov    %rcx,%r12
  100895:	eb cd                	jmp    100864 <printer::vprintf(int, char const*, __va_list_tag*)+0x628>
            numbuf[0] = va_arg(val, int);
  100897:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  10089b:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  10089f:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1008a3:	48 89 41 08          	mov    %rax,0x8(%rcx)
  1008a7:	eb d1                	jmp    10087a <printer::vprintf(int, char const*, __va_list_tag*)+0x63e>
        switch (*format) {
  1008a9:	4c 89 e1             	mov    %r12,%rcx
            numbuf[0] = (*format ? *format : '%');
  1008ac:	84 c0                	test   %al,%al
  1008ae:	0f 85 3b 01 00 00    	jne    1009ef <printer::vprintf(int, char const*, __va_list_tag*)+0x7b3>
  1008b4:	c6 45 b8 25          	movb   $0x25,-0x48(%rbp)
            numbuf[1] = '\0';
  1008b8:	c6 45 b9 00          	movb   $0x0,-0x47(%rbp)
                format--;
  1008bc:	4c 8d 61 ff          	lea    -0x1(%rcx),%r12
            data = numbuf;
  1008c0:	48 8d 5d b8          	lea    -0x48(%rbp),%rbx
        unsigned long num = 0;
  1008c4:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  1008ca:	e9 dd fb ff ff       	jmpq   1004ac <printer::vprintf(int, char const*, __va_list_tag*)+0x270>
        if (flags & FLAG_NUMERIC) {
  1008cf:	41 b9 0a 00 00 00    	mov    $0xa,%r9d
    const char* digits = upper_digits;
  1008d5:	bf 00 14 10 00       	mov    $0x101400,%edi
        if (flags & FLAG_NUMERIC) {
  1008da:	be 0a 00 00 00       	mov    $0xa,%esi
    *--numbuf_end = '\0';
  1008df:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
  1008e3:	4c 89 c1             	mov    %r8,%rcx
  1008e6:	48 8d 5d cf          	lea    -0x31(%rbp),%rbx
        *--numbuf_end = digits[val % base];
  1008ea:	48 63 f6             	movslq %esi,%rsi
  1008ed:	48 83 eb 01          	sub    $0x1,%rbx
  1008f1:	48 89 c8             	mov    %rcx,%rax
  1008f4:	ba 00 00 00 00       	mov    $0x0,%edx
  1008f9:	48 f7 f6             	div    %rsi
  1008fc:	0f b6 14 17          	movzbl (%rdi,%rdx,1),%edx
  100900:	88 13                	mov    %dl,(%rbx)
        val /= base;
  100902:	48 89 ca             	mov    %rcx,%rdx
  100905:	48 89 c1             	mov    %rax,%rcx
    } while (val != 0);
  100908:	48 39 d6             	cmp    %rdx,%rsi
  10090b:	76 e0                	jbe    1008ed <printer::vprintf(int, char const*, __va_list_tag*)+0x6b1>
  10090d:	e9 af fb ff ff       	jmpq   1004c1 <printer::vprintf(int, char const*, __va_list_tag*)+0x285>
                prefix = "-";
  100912:	48 c7 45 a8 07 0d 10 	movq   $0x100d07,-0x58(%rbp)
  100919:	00 
            if (flags & FLAG_NEGATIVE) {
  10091a:	41 f6 c5 80          	test   $0x80,%r13b
  10091e:	0f 85 c7 fb ff ff    	jne    1004eb <printer::vprintf(int, char const*, __va_list_tag*)+0x2af>
                prefix = "+";
  100924:	48 c7 45 a8 05 0d 10 	movq   $0x100d05,-0x58(%rbp)
  10092b:	00 
            } else if (flags & FLAG_PLUSPOSITIVE) {
  10092c:	41 f6 c5 10          	test   $0x10,%r13b
  100930:	0f 85 b5 fb ff ff    	jne    1004eb <printer::vprintf(int, char const*, __va_list_tag*)+0x2af>
                prefix = " ";
  100936:	41 f6 c5 08          	test   $0x8,%r13b
  10093a:	ba a5 14 10 00       	mov    $0x1014a5,%edx
  10093f:	b8 96 14 10 00       	mov    $0x101496,%eax
  100944:	48 0f 44 c2          	cmove  %rdx,%rax
  100948:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
  10094c:	e9 9a fb ff ff       	jmpq   1004eb <printer::vprintf(int, char const*, __va_list_tag*)+0x2af>
                   && (base == 16 || base == -16)
  100951:	41 8d 41 10          	lea    0x10(%r9),%eax
  100955:	a9 df ff ff ff       	test   $0xffffffdf,%eax
  10095a:	0f 85 8b fb ff ff    	jne    1004eb <printer::vprintf(int, char const*, __va_list_tag*)+0x2af>
                   && (num || (flags & FLAG_ALT2))) {
  100960:	4d 85 c0             	test   %r8,%r8
  100963:	75 0d                	jne    100972 <printer::vprintf(int, char const*, __va_list_tag*)+0x736>
  100965:	41 f7 c5 00 01 00 00 	test   $0x100,%r13d
  10096c:	0f 84 79 fb ff ff    	je     1004eb <printer::vprintf(int, char const*, __va_list_tag*)+0x2af>
            prefix = (base == -16 ? "0x" : "0X");
  100972:	41 83 f9 f0          	cmp    $0xfffffff0,%r9d
  100976:	ba 02 0d 10 00       	mov    $0x100d02,%edx
  10097b:	b8 09 0d 10 00       	mov    $0x100d09,%eax
  100980:	48 0f 44 c2          	cmove  %rdx,%rax
  100984:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
  100988:	e9 5e fb ff ff       	jmpq   1004eb <printer::vprintf(int, char const*, __va_list_tag*)+0x2af>
            datalen = strlen(data);
  10098d:	48 89 df             	mov    %rbx,%rdi
  100990:	e8 7b f7 ff ff       	callq  100110 <strlen>
  100995:	89 45 a0             	mov    %eax,-0x60(%rbp)
            && precision >= 0) {
  100998:	83 7d 9c 00          	cmpl   $0x0,-0x64(%rbp)
  10099c:	0f 84 76 fb ff ff    	je     100518 <printer::vprintf(int, char const*, __va_list_tag*)+0x2dc>
  1009a2:	80 7d 88 00          	cmpb   $0x0,-0x78(%rbp)
  1009a6:	0f 84 6c fb ff ff    	je     100518 <printer::vprintf(int, char const*, __va_list_tag*)+0x2dc>
            zeros = precision > datalen ? precision - datalen : 0;
  1009ac:	8b 4d a4             	mov    -0x5c(%rbp),%ecx
  1009af:	89 ca                	mov    %ecx,%edx
  1009b1:	29 c2                	sub    %eax,%edx
  1009b3:	39 c1                	cmp    %eax,%ecx
  1009b5:	b8 00 00 00 00       	mov    $0x0,%eax
  1009ba:	0f 4f c2             	cmovg  %edx,%eax
  1009bd:	89 45 a4             	mov    %eax,-0x5c(%rbp)
  1009c0:	e9 69 fb ff ff       	jmpq   10052e <printer::vprintf(int, char const*, __va_list_tag*)+0x2f2>
                   && datalen + (int) strlen(prefix) < width) {
  1009c5:	48 8b 7d a8          	mov    -0x58(%rbp),%rdi
  1009c9:	e8 42 f7 ff ff       	callq  100110 <strlen>
  1009ce:	8b 75 a0             	mov    -0x60(%rbp),%esi
  1009d1:	8d 14 06             	lea    (%rsi,%rax,1),%edx
            zeros = width - datalen - strlen(prefix);
  1009d4:	8b 7d 98             	mov    -0x68(%rbp),%edi
  1009d7:	89 f9                	mov    %edi,%ecx
  1009d9:	29 f1                	sub    %esi,%ecx
  1009db:	29 c1                	sub    %eax,%ecx
  1009dd:	39 fa                	cmp    %edi,%edx
  1009df:	b8 00 00 00 00       	mov    $0x0,%eax
  1009e4:	0f 4c c1             	cmovl  %ecx,%eax
  1009e7:	89 45 a4             	mov    %eax,-0x5c(%rbp)
  1009ea:	e9 3f fb ff ff       	jmpq   10052e <printer::vprintf(int, char const*, __va_list_tag*)+0x2f2>
  1009ef:	49 89 cc             	mov    %rcx,%r12
            numbuf[0] = (*format ? *format : '%');
  1009f2:	88 45 b8             	mov    %al,-0x48(%rbp)
            numbuf[1] = '\0';
  1009f5:	c6 45 b9 00          	movb   $0x0,-0x47(%rbp)
            data = numbuf;
  1009f9:	48 8d 5d b8          	lea    -0x48(%rbp),%rbx
        unsigned long num = 0;
  1009fd:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  100a03:	e9 a4 fa ff ff       	jmpq   1004ac <printer::vprintf(int, char const*, __va_list_tag*)+0x270>
        int flags = 0;
  100a08:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  100a0e:	e9 a4 f8 ff ff       	jmpq   1002b7 <printer::vprintf(int, char const*, __va_list_tag*)+0x7b>
        switch (*format) {
  100a13:	8d 50 bd             	lea    -0x43(%rax),%edx
  100a16:	80 fa 35             	cmp    $0x35,%dl
  100a19:	77 d7                	ja     1009f2 <printer::vprintf(int, char const*, __va_list_tag*)+0x7b6>
  100a1b:	0f b6 d2             	movzbl %dl,%edx
  100a1e:	3e ff 24 d5 20 12 10 	notrack jmpq *0x101220(,%rdx,8)
  100a25:	00 
        }
    }
}
  100a26:	48 83 c4 58          	add    $0x58,%rsp
  100a2a:	5b                   	pop    %rbx
  100a2b:	41 5c                	pop    %r12
  100a2d:	41 5d                	pop    %r13
  100a2f:	41 5e                	pop    %r14
  100a31:	41 5f                	pop    %r15
  100a33:	5d                   	pop    %rbp
  100a34:	c3                   	retq   
  100a35:	90                   	nop

0000000000100a36 <console_printer::console_printer(int, bool)>:
    void scroll();
    void move_cursor();
};

__noinline
console_printer::console_printer(int cpos, bool scroll)
  100a36:	f3 0f 1e fa          	endbr64 
    : cell_(console), scroll_(scroll) {
  100a3a:	48 c7 07 88 14 10 00 	movq   $0x101488,(%rdi)
  100a41:	48 c7 47 08 00 80 0b 	movq   $0xb8000,0x8(%rdi)
  100a48:	00 
  100a49:	88 57 10             	mov    %dl,0x10(%rdi)
    if (cpos < 0) {
  100a4c:	85 f6                	test   %esi,%esi
  100a4e:	78 18                	js     100a68 <console_printer::console_printer(int, bool)+0x32>
        cell_ += cursorpos;
    } else if (cpos <= CONSOLE_ROWS * CONSOLE_COLUMNS) {
  100a50:	81 fe d0 07 00 00    	cmp    $0x7d0,%esi
  100a56:	7f 0f                	jg     100a67 <console_printer::console_printer(int, bool)+0x31>
        cell_ += cpos;
  100a58:	48 63 f6             	movslq %esi,%rsi
  100a5b:	48 8d 84 36 00 80 0b 	lea    0xb8000(%rsi,%rsi,1),%rax
  100a62:	00 
  100a63:	48 89 47 08          	mov    %rax,0x8(%rdi)
    }
}
  100a67:	c3                   	retq   
        cell_ += cursorpos;
  100a68:	8b 05 8e 85 fb ff    	mov    -0x47a72(%rip),%eax        # b8ffc <cursorpos>
  100a6e:	48 98                	cltq   
  100a70:	48 8d 84 00 00 80 0b 	lea    0xb8000(%rax,%rax,1),%rax
  100a77:	00 
  100a78:	48 89 47 08          	mov    %rax,0x8(%rdi)
  100a7c:	c3                   	retq   
  100a7d:	90                   	nop

0000000000100a7e <console_printer::scroll()>:

__noinline
void console_printer::scroll() {
  100a7e:	f3 0f 1e fa          	endbr64 
  100a82:	55                   	push   %rbp
  100a83:	48 89 e5             	mov    %rsp,%rbp
  100a86:	53                   	push   %rbx
  100a87:	48 83 ec 08          	sub    $0x8,%rsp
    assert(cell_ >= console + CONSOLE_ROWS * CONSOLE_COLUMNS);
  100a8b:	48 81 7f 08 a0 8f 0b 	cmpq   $0xb8fa0,0x8(%rdi)
  100a92:	00 
  100a93:	72 18                	jb     100aad <console_printer::scroll()+0x2f>
  100a95:	48 89 fb             	mov    %rdi,%rbx
    if (scroll_) {
  100a98:	80 7f 10 00          	cmpb   $0x0,0x10(%rdi)
  100a9c:	75 28                	jne    100ac6 <console_printer::scroll()+0x48>
                (CONSOLE_ROWS - 1) * CONSOLE_COLUMNS * sizeof(*console));
        memset(console + (CONSOLE_ROWS - 1) * CONSOLE_COLUMNS,
               0, CONSOLE_COLUMNS * sizeof(*console));
        cell_ -= CONSOLE_COLUMNS;
    } else {
        cell_ = console;
  100a9e:	48 c7 47 08 00 80 0b 	movq   $0xb8000,0x8(%rdi)
  100aa5:	00 
    }
}
  100aa6:	48 83 c4 08          	add    $0x8,%rsp
  100aaa:	5b                   	pop    %rbx
  100aab:	5d                   	pop    %rbp
  100aac:	c3                   	retq   
    assert(cell_ >= console + CONSOLE_ROWS * CONSOLE_COLUMNS);
  100aad:	b9 00 00 00 00       	mov    $0x0,%ecx
  100ab2:	ba 18 14 10 00       	mov    $0x101418,%edx
  100ab7:	be 2c 02 00 00       	mov    $0x22c,%esi
  100abc:	bf fb 0c 10 00       	mov    $0x100cfb,%edi
  100ac1:	e8 c9 01 00 00       	callq  100c8f <assert_fail(char const*, int, char const*, char const*)>
        memmove(console, console + CONSOLE_COLUMNS,
  100ac6:	ba 00 0f 00 00       	mov    $0xf00,%edx
  100acb:	be a0 80 0b 00       	mov    $0xb80a0,%esi
  100ad0:	bf 00 80 0b 00       	mov    $0xb8000,%edi
  100ad5:	e8 c9 f5 ff ff       	callq  1000a3 <memmove>
        memset(console + (CONSOLE_ROWS - 1) * CONSOLE_COLUMNS,
  100ada:	ba a0 00 00 00       	mov    $0xa0,%edx
  100adf:	be 00 00 00 00       	mov    $0x0,%esi
  100ae4:	bf 00 8f 0b 00       	mov    $0xb8f00,%edi
  100ae9:	e8 02 f6 ff ff       	callq  1000f0 <memset>
        cell_ -= CONSOLE_COLUMNS;
  100aee:	48 81 6b 08 a0 00 00 	subq   $0xa0,0x8(%rbx)
  100af5:	00 
  100af6:	eb ae                	jmp    100aa6 <console_printer::scroll()+0x28>

0000000000100af8 <console_printer::putc(unsigned char, int)>:
    extern void console_show_cursor(int);
    console_show_cursor(cursorpos);
#endif
}

inline void console_printer::putc(unsigned char c, int color) {
  100af8:	f3 0f 1e fa          	endbr64 
  100afc:	55                   	push   %rbp
  100afd:	48 89 e5             	mov    %rsp,%rbp
  100b00:	41 55                	push   %r13
  100b02:	41 54                	push   %r12
  100b04:	53                   	push   %rbx
  100b05:	48 83 ec 08          	sub    $0x8,%rsp
  100b09:	48 89 fb             	mov    %rdi,%rbx
  100b0c:	41 89 f5             	mov    %esi,%r13d
  100b0f:	41 89 d4             	mov    %edx,%r12d
    while (cell_ >= console + CONSOLE_ROWS * CONSOLE_COLUMNS) {
  100b12:	48 8b 47 08          	mov    0x8(%rdi),%rax
  100b16:	48 3d a0 8f 0b 00    	cmp    $0xb8fa0,%rax
  100b1c:	72 14                	jb     100b32 <console_printer::putc(unsigned char, int)+0x3a>
        scroll();
  100b1e:	48 89 df             	mov    %rbx,%rdi
  100b21:	e8 58 ff ff ff       	callq  100a7e <console_printer::scroll()>
    while (cell_ >= console + CONSOLE_ROWS * CONSOLE_COLUMNS) {
  100b26:	48 8b 43 08          	mov    0x8(%rbx),%rax
  100b2a:	48 3d a0 8f 0b 00    	cmp    $0xb8fa0,%rax
  100b30:	73 ec                	jae    100b1e <console_printer::putc(unsigned char, int)+0x26>
    }
    if (c == '\n') {
  100b32:	41 80 fd 0a          	cmp    $0xa,%r13b
  100b36:	74 1e                	je     100b56 <console_printer::putc(unsigned char, int)+0x5e>
        while (pos != 80) {
            *cell_++ = ' ' | color;
            ++pos;
        }
    } else {
        *cell_++ = c | color;
  100b38:	48 8d 50 02          	lea    0x2(%rax),%rdx
  100b3c:	48 89 53 08          	mov    %rdx,0x8(%rbx)
  100b40:	45 0f b6 ed          	movzbl %r13b,%r13d
  100b44:	45 09 ec             	or     %r13d,%r12d
  100b47:	66 44 89 20          	mov    %r12w,(%rax)
    }
}
  100b4b:	48 83 c4 08          	add    $0x8,%rsp
  100b4f:	5b                   	pop    %rbx
  100b50:	41 5c                	pop    %r12
  100b52:	41 5d                	pop    %r13
  100b54:	5d                   	pop    %rbp
  100b55:	c3                   	retq   
        int pos = (cell_ - console) % 80;
  100b56:	48 2d 00 80 0b 00    	sub    $0xb8000,%rax
  100b5c:	48 89 c1             	mov    %rax,%rcx
  100b5f:	48 89 c6             	mov    %rax,%rsi
  100b62:	48 d1 fe             	sar    %rsi
  100b65:	48 ba 67 66 66 66 66 	movabs $0x6666666666666667,%rdx
  100b6c:	66 66 66 
  100b6f:	48 89 f0             	mov    %rsi,%rax
  100b72:	48 f7 ea             	imul   %rdx
  100b75:	48 c1 fa 05          	sar    $0x5,%rdx
  100b79:	48 89 c8             	mov    %rcx,%rax
  100b7c:	48 c1 f8 3f          	sar    $0x3f,%rax
  100b80:	48 29 c2             	sub    %rax,%rdx
  100b83:	48 8d 04 92          	lea    (%rdx,%rdx,4),%rax
  100b87:	48 c1 e0 04          	shl    $0x4,%rax
  100b8b:	89 f2                	mov    %esi,%edx
  100b8d:	29 c2                	sub    %eax,%edx
  100b8f:	89 d0                	mov    %edx,%eax
            *cell_++ = ' ' | color;
  100b91:	41 83 cc 20          	or     $0x20,%r12d
  100b95:	48 8b 4b 08          	mov    0x8(%rbx),%rcx
  100b99:	48 8d 71 02          	lea    0x2(%rcx),%rsi
  100b9d:	48 89 73 08          	mov    %rsi,0x8(%rbx)
  100ba1:	66 44 89 21          	mov    %r12w,(%rcx)
            ++pos;
  100ba5:	83 c0 01             	add    $0x1,%eax
        while (pos != 80) {
  100ba8:	83 f8 50             	cmp    $0x50,%eax
  100bab:	75 e8                	jne    100b95 <console_printer::putc(unsigned char, int)+0x9d>
  100bad:	eb 9c                	jmp    100b4b <console_printer::putc(unsigned char, int)+0x53>
  100baf:	90                   	nop

0000000000100bb0 <console_printer::move_cursor()>:
void console_printer::move_cursor() {
  100bb0:	f3 0f 1e fa          	endbr64 
    cursorpos = cell_ - console;
  100bb4:	48 8b 47 08          	mov    0x8(%rdi),%rax
  100bb8:	48 2d 00 80 0b 00    	sub    $0xb8000,%rax
  100bbe:	48 d1 f8             	sar    %rax
  100bc1:	89 05 35 84 fb ff    	mov    %eax,-0x47bcb(%rip)        # b8ffc <cursorpos>
}
  100bc7:	c3                   	retq   

0000000000100bc8 <console_vprintf(int, int, char const*, __va_list_tag*)>:

// console_vprintf, console_printf
//    Print a message onto the console, starting at the given cursor position.

__noinline
int console_vprintf(int cpos, int color, const char* format, va_list val) {
  100bc8:	f3 0f 1e fa          	endbr64 
  100bcc:	55                   	push   %rbp
  100bcd:	48 89 e5             	mov    %rsp,%rbp
  100bd0:	41 56                	push   %r14
  100bd2:	41 55                	push   %r13
  100bd4:	41 54                	push   %r12
  100bd6:	53                   	push   %rbx
  100bd7:	48 83 ec 20          	sub    $0x20,%rsp
  100bdb:	89 fb                	mov    %edi,%ebx
  100bdd:	41 89 f4             	mov    %esi,%r12d
  100be0:	49 89 d5             	mov    %rdx,%r13
  100be3:	49 89 ce             	mov    %rcx,%r14
    console_printer cp(cpos, cpos < 0);
  100be6:	89 fa                	mov    %edi,%edx
  100be8:	c1 ea 1f             	shr    $0x1f,%edx
  100beb:	89 fe                	mov    %edi,%esi
  100bed:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
  100bf1:	e8 40 fe ff ff       	callq  100a36 <console_printer::console_printer(int, bool)>
    cp.vprintf(color, format, val);
  100bf6:	4c 89 f1             	mov    %r14,%rcx
  100bf9:	4c 89 ea             	mov    %r13,%rdx
  100bfc:	44 89 e6             	mov    %r12d,%esi
  100bff:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
  100c03:	e8 34 f6 ff ff       	callq  10023c <printer::vprintf(int, char const*, __va_list_tag*)>
    if (cpos < 0) {
  100c08:	85 db                	test   %ebx,%ebx
  100c0a:	78 1a                	js     100c26 <console_vprintf(int, int, char const*, __va_list_tag*)+0x5e>
        cp.move_cursor();
    }
    return cp.cell_ - console;
  100c0c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  100c10:	48 2d 00 80 0b 00    	sub    $0xb8000,%rax
  100c16:	48 d1 f8             	sar    %rax
}
  100c19:	48 83 c4 20          	add    $0x20,%rsp
  100c1d:	5b                   	pop    %rbx
  100c1e:	41 5c                	pop    %r12
  100c20:	41 5d                	pop    %r13
  100c22:	41 5e                	pop    %r14
  100c24:	5d                   	pop    %rbp
  100c25:	c3                   	retq   
        cp.move_cursor();
  100c26:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
  100c2a:	e8 81 ff ff ff       	callq  100bb0 <console_printer::move_cursor()>
  100c2f:	eb db                	jmp    100c0c <console_vprintf(int, int, char const*, __va_list_tag*)+0x44>

0000000000100c31 <error_printf(char const*, ...)>:
    error_vprintf(-1, color, format, val);
    va_end(val);
}

__noinline
void error_printf(const char* format, ...) {
  100c31:	f3 0f 1e fa          	endbr64 
  100c35:	55                   	push   %rbp
  100c36:	48 89 e5             	mov    %rsp,%rbp
  100c39:	48 83 ec 50          	sub    $0x50,%rsp
  100c3d:	48 89 75 d8          	mov    %rsi,-0x28(%rbp)
  100c41:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  100c45:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  100c49:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
  100c4d:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
  100c51:	c7 45 b8 08 00 00 00 	movl   $0x8,-0x48(%rbp)
  100c58:	48 8d 45 10          	lea    0x10(%rbp),%rax
  100c5c:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  100c60:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  100c64:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    error_vprintf(-1, COLOR_ERROR, format, val);
  100c68:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
  100c6c:	48 89 fa             	mov    %rdi,%rdx
  100c6f:	be 00 c0 00 00       	mov    $0xc000,%esi
  100c74:	bf ff ff ff ff       	mov    $0xffffffff,%edi
  100c79:	e8 02 00 00 00       	callq  100c80 <error_vprintf(int, int, char const*, __va_list_tag*)>
    va_end(val);
}
  100c7e:	c9                   	leaveq 
  100c7f:	c3                   	retq   

0000000000100c80 <error_vprintf(int, int, char const*, __va_list_tag*)>:
    }
    (void) console_printf(CPOS(23, 0), 0xC000, "%s", buf);
    sys_panic(nullptr);
}

int error_vprintf(int cpos, int color, const char* format, va_list val) {
  100c80:	f3 0f 1e fa          	endbr64 
  100c84:	55                   	push   %rbp
  100c85:	48 89 e5             	mov    %rsp,%rbp
    return console_vprintf(cpos, color, format, val);
  100c88:	e8 3b ff ff ff       	callq  100bc8 <console_vprintf(int, int, char const*, __va_list_tag*)>
}
  100c8d:	5d                   	pop    %rbp
  100c8e:	c3                   	retq   

0000000000100c8f <assert_fail(char const*, int, char const*, char const*)>:

void assert_fail(const char* file, int line, const char* msg,
                 const char* description) {
  100c8f:	f3 0f 1e fa          	endbr64 
  100c93:	55                   	push   %rbp
  100c94:	48 89 e5             	mov    %rsp,%rbp
  100c97:	41 55                	push   %r13
  100c99:	41 54                	push   %r12
  100c9b:	53                   	push   %rbx
  100c9c:	48 83 ec 08          	sub    $0x8,%rsp
  100ca0:	48 89 fb             	mov    %rdi,%rbx
  100ca3:	41 89 f4             	mov    %esi,%r12d
  100ca6:	49 89 d5             	mov    %rdx,%r13
    cursorpos = CPOS(23, 0);
  100ca9:	c7 05 49 83 fb ff 30 	movl   $0x730,-0x47cb7(%rip)        # b8ffc <cursorpos>
  100cb0:	07 00 00 
    if (description) {
  100cb3:	48 85 c9             	test   %rcx,%rcx
  100cb6:	74 11                	je     100cc9 <assert_fail(char const*, int, char const*, char const*)+0x3a>
        error_printf("%s:%d: %s\n", file, line, description);
  100cb8:	89 f2                	mov    %esi,%edx
  100cba:	48 89 fe             	mov    %rdi,%rsi
  100cbd:	bf 9b 14 10 00       	mov    $0x10149b,%edi
  100cc2:	b0 00                	mov    $0x0,%al
  100cc4:	e8 68 ff ff ff       	callq  100c31 <error_printf(char const*, ...)>
    }
    error_printf("%s:%d: user assertion '%s' failed\n", file, line, msg);
  100cc9:	4c 89 e9             	mov    %r13,%rcx
  100ccc:	44 89 e2             	mov    %r12d,%edx
  100ccf:	48 89 de             	mov    %rbx,%rsi
  100cd2:	bf a8 14 10 00       	mov    $0x1014a8,%edi
  100cd7:	b0 00                	mov    $0x0,%al
  100cd9:	e8 53 ff ff ff       	callq  100c31 <error_printf(char const*, ...)>
    register uintptr_t rax asm("rax") = syscallno;
  100cde:	b8 03 00 00 00       	mov    $0x3,%eax
            : "cc", "memory", "rcx", "rdx", "rsi", "r8", "r9", "r10", "r11");
  100ce3:	bf 00 00 00 00       	mov    $0x0,%edi
  100ce8:	0f 05                	syscall 
//    Panic.
[[noreturn]] inline void sys_panic(const char* msg) {
    make_syscall(SYSCALL_PANIC, (uintptr_t) msg);

    // should never get here
    while (true) {
  100cea:	eb fe                	jmp    100cea <assert_fail(char const*, int, char const*, char const*)+0x5b>

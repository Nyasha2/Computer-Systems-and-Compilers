
obj/p-allocator4.full:     file format elf64-x86-64


Disassembly of section .text:

00000000001c0000 <process_main()>:

// These global variables go on the data page.
uint8_t* heap_top;
uint8_t* stack_bottom;

void process_main() {
  1c0000:	f3 0f 1e fa          	endbr64 
  1c0004:	55                   	push   %rbp
  1c0005:	48 89 e5             	mov    %rsp,%rbp
  1c0008:	41 54                	push   %r12
  1c000a:	53                   	push   %rbx
// make_syscall
//    These functions define the WeensyOS system call calling convention.
//    We provide versions for system calls with 0-2 arguments.

__always_inline uintptr_t make_syscall(int syscallno) {
    register uintptr_t rax asm("rax") = syscallno;
  1c000b:	b8 01 00 00 00       	mov    $0x1,%eax
    asm volatile ("syscall"
            : "+a" (rax)
            : /* all input registers are also output registers */
            : "cc", "memory", "rcx", "rdx", "rsi", "rdi", "r8", "r9",
              "r10", "r11");
  1c0010:	0f 05                	syscall 
    return rax;
  1c0012:	48 89 c3             	mov    %rax,%rbx


// sys_getpid
//    Return current process ID.
inline pid_t sys_getpid() {
    return make_syscall(SYSCALL_GETPID);
  1c0015:	41 89 c4             	mov    %eax,%r12d
    pid_t p = sys_getpid();
    srand(p);
  1c0018:	89 c7                	mov    %eax,%edi
  1c001a:	e8 af 01 00 00       	callq  1c01ce <srand(unsigned int)>
//    Return the smallest multiple of `m` greater than or equal to `x`.
//    Equivalently, round `x` up to the nearest multiple of `m`.
template <typename T>
inline constexpr T round_up(T x, unsigned m) {
    static_assert(std::is_unsigned<T>::value, "T must be unsigned");
    return round_down(x + m - 1, m);
  1c001f:	b8 1b 30 1c 00       	mov    $0x1c301b,%eax

    // The heap starts on the page right after the 'end' symbol,
    // whose address is the first address not allocated to process code
    // or data.
    heap_top = (uint8_t*) round_up((uintptr_t) end, PAGESIZE);
  1c0024:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  1c002a:	48 89 05 d7 1f 00 00 	mov    %rax,0x1fd7(%rip)        # 1c2008 <heap_top>
    return x;
}

__always_inline uintptr_t rdrsp() {
    uintptr_t x;
    asm volatile("movq %%rsp, %0" : "=r" (x));
  1c0031:	48 89 e0             	mov    %rsp,%rax

    // The bottom of the stack is the first address on the current
    // stack page (this process never needs more than one stack page).
    stack_bottom = (uint8_t*) round_down((uintptr_t) rdrsp() - 1, PAGESIZE);
  1c0034:	48 83 e8 01          	sub    $0x1,%rax
  1c0038:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  1c003e:	48 89 05 bb 1f 00 00 	mov    %rax,0x1fbb(%rip)        # 1c2000 <stack_bottom>
  1c0045:	eb 07                	jmp    1c004e <process_main()+0x4e>
    register uintptr_t rax asm("rax") = syscallno;
  1c0047:	b8 02 00 00 00       	mov    $0x2,%eax
              "r10", "r11");
  1c004c:	0f 05                	syscall 

    // Allocate heap pages until (1) hit the stack (out of address space)
    // or (2) allocation fails (out of physical memory).
    while (true) {
#if !NO_SLOWDOWN
        if (rand(0, ALLOC_SLOWDOWN - 1) < p) {
  1c004e:	be 63 00 00 00       	mov    $0x63,%esi
  1c0053:	bf 00 00 00 00       	mov    $0x0,%edi
  1c0058:	e8 90 01 00 00       	callq  1c01ed <rand(int, int)>
  1c005d:	44 39 e0             	cmp    %r12d,%eax
  1c0060:	7d e5                	jge    1c0047 <process_main()+0x47>
#else
        for (int i = 0; i < p; i++) {
#endif
            if (heap_top == stack_bottom
  1c0062:	48 8b 3d 9f 1f 00 00 	mov    0x1f9f(%rip),%rdi        # 1c2008 <heap_top>
                || sys_page_alloc(heap_top) < 0) {
  1c0069:	48 3b 3d 90 1f 00 00 	cmp    0x1f90(%rip),%rdi        # 1c2000 <stack_bottom>
  1c0070:	74 28                	je     1c009a <process_main()+0x9a>
    register uintptr_t rax asm("rax") = syscallno;
  1c0072:	b8 04 00 00 00       	mov    $0x4,%eax
            : "cc", "memory", "rcx", "rdx", "rsi", "r8", "r9", "r10", "r11");
  1c0077:	0f 05                	syscall 
  1c0079:	85 c0                	test   %eax,%eax
  1c007b:	78 1d                	js     1c009a <process_main()+0x9a>
                break;
            }
            *heap_top = p;               // check we can write to new page
  1c007d:	48 8b 05 84 1f 00 00 	mov    0x1f84(%rip),%rax        # 1c2008 <heap_top>
  1c0084:	88 18                	mov    %bl,(%rax)
            console[CPOS(24, 79)] = p;   // check we can write to console
  1c0086:	66 89 1d 11 8f ef ff 	mov    %bx,-0x1070ef(%rip)        # b8f9e <console+0xf9e>
            heap_top += PAGESIZE;
  1c008d:	48 81 05 70 1f 00 00 	addq   $0x1000,0x1f70(%rip)        # 1c2008 <heap_top>
  1c0094:	00 10 00 00 
  1c0098:	eb ad                	jmp    1c0047 <process_main()+0x47>
    register uintptr_t rax asm("rax") = syscallno;
  1c009a:	b8 02 00 00 00       	mov    $0x2,%eax
              "r10", "r11");
  1c009f:	0f 05                	syscall 
    return rax;
  1c00a1:	eb f7                	jmp    1c009a <process_main()+0x9a>

00000000001c00a3 <memmove>:
        *d = *s;
    }
    return dst;
}

void* memmove(void* dst, const void* src, size_t n) {
  1c00a3:	f3 0f 1e fa          	endbr64 
  1c00a7:	48 89 f8             	mov    %rdi,%rax
    const char* s = (const char*) src;
    char* d = (char*) dst;
    if (s < d && s + n > d) {
  1c00aa:	48 39 fe             	cmp    %rdi,%rsi
  1c00ad:	73 09                	jae    1c00b8 <memmove+0x15>
  1c00af:	48 8d 0c 16          	lea    (%rsi,%rdx,1),%rcx
  1c00b3:	48 39 cf             	cmp    %rcx,%rdi
  1c00b6:	72 1d                	jb     1c00d5 <memmove+0x32>
        s += n, d += n;
        while (n-- > 0) {
            *--d = *--s;
        }
    } else {
        while (n-- > 0) {
  1c00b8:	b9 00 00 00 00       	mov    $0x0,%ecx
  1c00bd:	48 85 d2             	test   %rdx,%rdx
  1c00c0:	74 12                	je     1c00d4 <memmove+0x31>
            *d++ = *s++;
  1c00c2:	0f b6 3c 0e          	movzbl (%rsi,%rcx,1),%edi
  1c00c6:	40 88 3c 08          	mov    %dil,(%rax,%rcx,1)
        while (n-- > 0) {
  1c00ca:	48 83 c1 01          	add    $0x1,%rcx
  1c00ce:	48 39 d1             	cmp    %rdx,%rcx
  1c00d1:	75 ef                	jne    1c00c2 <memmove+0x1f>
        }
    }
    return dst;
}
  1c00d3:	c3                   	retq   
  1c00d4:	c3                   	retq   
        while (n-- > 0) {
  1c00d5:	48 8d 4a ff          	lea    -0x1(%rdx),%rcx
  1c00d9:	48 85 d2             	test   %rdx,%rdx
  1c00dc:	74 f5                	je     1c00d3 <memmove+0x30>
            *--d = *--s;
  1c00de:	0f b6 14 0e          	movzbl (%rsi,%rcx,1),%edx
  1c00e2:	88 14 08             	mov    %dl,(%rax,%rcx,1)
        while (n-- > 0) {
  1c00e5:	48 83 e9 01          	sub    $0x1,%rcx
  1c00e9:	48 83 f9 ff          	cmp    $0xffffffffffffffff,%rcx
  1c00ed:	75 ef                	jne    1c00de <memmove+0x3b>
  1c00ef:	c3                   	retq   

00000000001c00f0 <memset>:

void* memset(void* v, int c, size_t n) {
  1c00f0:	f3 0f 1e fa          	endbr64 
  1c00f4:	48 89 f8             	mov    %rdi,%rax
    for (char* p = (char*) v; n > 0; ++p, --n) {
  1c00f7:	48 85 d2             	test   %rdx,%rdx
  1c00fa:	74 13                	je     1c010f <memset+0x1f>
  1c00fc:	48 8d 0c 17          	lea    (%rdi,%rdx,1),%rcx
  1c0100:	48 89 fa             	mov    %rdi,%rdx
        *p = c;
  1c0103:	40 88 32             	mov    %sil,(%rdx)
    for (char* p = (char*) v; n > 0; ++p, --n) {
  1c0106:	48 83 c2 01          	add    $0x1,%rdx
  1c010a:	48 39 d1             	cmp    %rdx,%rcx
  1c010d:	75 f4                	jne    1c0103 <memset+0x13>
    }
    return v;
}
  1c010f:	c3                   	retq   

00000000001c0110 <strlen>:
        }
    }
    return nullptr;
}

size_t strlen(const char* s) {
  1c0110:	f3 0f 1e fa          	endbr64 
    size_t n;
    for (n = 0; *s != '\0'; ++s) {
  1c0114:	80 3f 00             	cmpb   $0x0,(%rdi)
  1c0117:	74 10                	je     1c0129 <strlen+0x19>
  1c0119:	b8 00 00 00 00       	mov    $0x0,%eax
        ++n;
  1c011e:	48 83 c0 01          	add    $0x1,%rax
    for (n = 0; *s != '\0'; ++s) {
  1c0122:	80 3c 07 00          	cmpb   $0x0,(%rdi,%rax,1)
  1c0126:	75 f6                	jne    1c011e <strlen+0xe>
  1c0128:	c3                   	retq   
  1c0129:	b8 00 00 00 00       	mov    $0x0,%eax
    }
    return n;
}
  1c012e:	c3                   	retq   

00000000001c012f <strnlen>:

size_t strnlen(const char* s, size_t maxlen) {
  1c012f:	f3 0f 1e fa          	endbr64 
    size_t n;
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
  1c0133:	48 85 f6             	test   %rsi,%rsi
  1c0136:	74 15                	je     1c014d <strnlen+0x1e>
  1c0138:	b8 00 00 00 00       	mov    $0x0,%eax
  1c013d:	80 3c 07 00          	cmpb   $0x0,(%rdi,%rax,1)
  1c0141:	74 0d                	je     1c0150 <strnlen+0x21>
        ++n;
  1c0143:	48 83 c0 01          	add    $0x1,%rax
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
  1c0147:	48 39 c6             	cmp    %rax,%rsi
  1c014a:	75 f1                	jne    1c013d <strnlen+0xe>
  1c014c:	c3                   	retq   
  1c014d:	48 89 f0             	mov    %rsi,%rax
    }
    return n;
}
  1c0150:	c3                   	retq   

00000000001c0151 <strchr>:
        }
        ++a, ++b, --n;
    }
}

char* strchr(const char* s, int c) {
  1c0151:	f3 0f 1e fa          	endbr64 
    while (*s && *s != (char) c) {
  1c0155:	0f b6 07             	movzbl (%rdi),%eax
  1c0158:	84 c0                	test   %al,%al
  1c015a:	74 10                	je     1c016c <strchr+0x1b>
  1c015c:	40 38 f0             	cmp    %sil,%al
  1c015f:	74 18                	je     1c0179 <strchr+0x28>
        ++s;
  1c0161:	48 83 c7 01          	add    $0x1,%rdi
    while (*s && *s != (char) c) {
  1c0165:	0f b6 07             	movzbl (%rdi),%eax
  1c0168:	84 c0                	test   %al,%al
  1c016a:	75 f0                	jne    1c015c <strchr+0xb>
    }
    if (*s == (char) c) {
        return (char*) s;
    } else {
        return nullptr;
  1c016c:	40 84 f6             	test   %sil,%sil
  1c016f:	b8 00 00 00 00       	mov    $0x0,%eax
  1c0174:	48 0f 44 c7          	cmove  %rdi,%rax
  1c0178:	c3                   	retq   
  1c0179:	48 89 f8             	mov    %rdi,%rax
    }
}
  1c017c:	c3                   	retq   

00000000001c017d <rand()>:
// rand, srand

static int rand_seed_set;
static unsigned long rand_seed;

int rand() {
  1c017d:	f3 0f 1e fa          	endbr64 
    if (!rand_seed_set) {
  1c0181:	83 3d 90 1e 00 00 00 	cmpl   $0x0,0x1e90(%rip)        # 1c2018 <rand_seed_set>
  1c0188:	74 27                	je     1c01b1 <rand()+0x34>
        srand(819234718U);
    }
    rand_seed = rand_seed * 6364136223846793005UL + 1;
  1c018a:	48 b8 2d 7f 95 4c 2d 	movabs $0x5851f42d4c957f2d,%rax
  1c0191:	f4 51 58 
  1c0194:	48 0f af 05 74 1e 00 	imul   0x1e74(%rip),%rax        # 1c2010 <rand_seed>
  1c019b:	00 
  1c019c:	48 83 c0 01          	add    $0x1,%rax
  1c01a0:	48 89 05 69 1e 00 00 	mov    %rax,0x1e69(%rip)        # 1c2010 <rand_seed>
    return (rand_seed >> 32) & RAND_MAX;
  1c01a7:	48 c1 e8 20          	shr    $0x20,%rax
  1c01ab:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
}
  1c01b0:	c3                   	retq   

void srand(unsigned seed) {
    rand_seed = ((unsigned long) seed << 32) | seed;
  1c01b1:	48 b8 9e 87 d4 30 9e 	movabs $0x30d4879e30d4879e,%rax
  1c01b8:	87 d4 30 
  1c01bb:	48 89 05 4e 1e 00 00 	mov    %rax,0x1e4e(%rip)        # 1c2010 <rand_seed>
    rand_seed_set = 1;
  1c01c2:	c7 05 4c 1e 00 00 01 	movl   $0x1,0x1e4c(%rip)        # 1c2018 <rand_seed_set>
  1c01c9:	00 00 00 
}
  1c01cc:	eb bc                	jmp    1c018a <rand()+0xd>

00000000001c01ce <srand(unsigned int)>:
void srand(unsigned seed) {
  1c01ce:	f3 0f 1e fa          	endbr64 
    rand_seed = ((unsigned long) seed << 32) | seed;
  1c01d2:	89 f8                	mov    %edi,%eax
  1c01d4:	48 c1 e7 20          	shl    $0x20,%rdi
  1c01d8:	48 09 c7             	or     %rax,%rdi
  1c01db:	48 89 3d 2e 1e 00 00 	mov    %rdi,0x1e2e(%rip)        # 1c2010 <rand_seed>
    rand_seed_set = 1;
  1c01e2:	c7 05 2c 1e 00 00 01 	movl   $0x1,0x1e2c(%rip)        # 1c2018 <rand_seed_set>
  1c01e9:	00 00 00 
}
  1c01ec:	c3                   	retq   

00000000001c01ed <rand(int, int)>:

// rand(min, max)
//    Return a pseudorandom number roughly evenly distributed between
//    `min` and `max`, inclusive. Requires `min <= max` and
//    `max - min <= RAND_MAX`.
int rand(int min, int max) {
  1c01ed:	f3 0f 1e fa          	endbr64 
  1c01f1:	55                   	push   %rbp
  1c01f2:	48 89 e5             	mov    %rsp,%rbp
  1c01f5:	41 54                	push   %r12
  1c01f7:	53                   	push   %rbx
    assert(min <= max);
  1c01f8:	39 f7                	cmp    %esi,%edi
  1c01fa:	7f 27                	jg     1c0223 <rand(int, int)+0x36>
  1c01fc:	41 89 fc             	mov    %edi,%r12d
  1c01ff:	89 f3                	mov    %esi,%ebx
    assert(max - min <= RAND_MAX);

    unsigned long r = rand();
  1c0201:	e8 77 ff ff ff       	callq  1c017d <rand()>
  1c0206:	89 c2                	mov    %eax,%edx
    return min + (r * (max - min + 1)) / ((unsigned long) RAND_MAX + 1);
  1c0208:	44 29 e3             	sub    %r12d,%ebx
  1c020b:	8d 43 01             	lea    0x1(%rbx),%eax
  1c020e:	48 98                	cltq   
    unsigned long r = rand();
  1c0210:	48 63 da             	movslq %edx,%rbx
    return min + (r * (max - min + 1)) / ((unsigned long) RAND_MAX + 1);
  1c0213:	48 0f af c3          	imul   %rbx,%rax
  1c0217:	48 c1 e8 1f          	shr    $0x1f,%rax
  1c021b:	44 01 e0             	add    %r12d,%eax
}
  1c021e:	5b                   	pop    %rbx
  1c021f:	41 5c                	pop    %r12
  1c0221:	5d                   	pop    %rbp
  1c0222:	c3                   	retq   
    assert(min <= max);
  1c0223:	b9 00 00 00 00       	mov    $0x0,%ecx
  1c0228:	ba f0 0c 1c 00       	mov    $0x1c0cf0,%edx
  1c022d:	be ff 00 00 00       	mov    $0xff,%esi
  1c0232:	bf fb 0c 1c 00       	mov    $0x1c0cfb,%edi
  1c0237:	e8 53 0a 00 00       	callq  1c0c8f <assert_fail(char const*, int, char const*, char const*)>

00000000001c023c <printer::vprintf(int, char const*, __va_list_tag*)>:
#define FLAG_NUMERIC            (1<<5)
#define FLAG_SIGNED             (1<<6)
#define FLAG_NEGATIVE           (1<<7)
#define FLAG_ALT2               (1<<8)

void printer::vprintf(int color, const char* format, va_list val) {
  1c023c:	f3 0f 1e fa          	endbr64 
  1c0240:	55                   	push   %rbp
  1c0241:	48 89 e5             	mov    %rsp,%rbp
  1c0244:	41 57                	push   %r15
  1c0246:	41 56                	push   %r14
  1c0248:	41 55                	push   %r13
  1c024a:	41 54                	push   %r12
  1c024c:	53                   	push   %rbx
  1c024d:	48 83 ec 58          	sub    $0x58,%rsp
  1c0251:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
#define NUMBUFSIZ 24
    char numbuf[NUMBUFSIZ];

    for (; *format; ++format) {
  1c0255:	0f b6 02             	movzbl (%rdx),%eax
  1c0258:	84 c0                	test   %al,%al
  1c025a:	0f 84 c6 07 00 00    	je     1c0a26 <printer::vprintf(int, char const*, __va_list_tag*)+0x7ea>
  1c0260:	49 89 fe             	mov    %rdi,%r14
  1c0263:	41 89 f7             	mov    %esi,%r15d
  1c0266:	48 89 d3             	mov    %rdx,%rbx
  1c0269:	e9 b9 03 00 00       	jmpq   1c0627 <printer::vprintf(int, char const*, __va_list_tag*)+0x3eb>
            continue;
        }

        // process flags
        int flags = 0;
        for (++format; *format; ++format) {
  1c026e:	4c 8d 63 01          	lea    0x1(%rbx),%r12
  1c0272:	0f b6 5b 01          	movzbl 0x1(%rbx),%ebx
  1c0276:	84 db                	test   %bl,%bl
  1c0278:	0f 84 8a 07 00 00    	je     1c0a08 <printer::vprintf(int, char const*, __va_list_tag*)+0x7cc>
        int flags = 0;
  1c027e:	41 bd 00 00 00 00    	mov    $0x0,%r13d
            const char* flagc = strchr(flag_chars, *format);
  1c0284:	0f be f3             	movsbl %bl,%esi
  1c0287:	bf d0 13 1c 00       	mov    $0x1c13d0,%edi
  1c028c:	e8 c0 fe ff ff       	callq  1c0151 <strchr>
  1c0291:	48 89 c1             	mov    %rax,%rcx
            if (flagc) {
  1c0294:	48 85 c0             	test   %rax,%rax
  1c0297:	74 74                	je     1c030d <printer::vprintf(int, char const*, __va_list_tag*)+0xd1>
                flags |= 1 << (flagc - flag_chars);
  1c0299:	48 81 e9 d0 13 1c 00 	sub    $0x1c13d0,%rcx
  1c02a0:	b8 01 00 00 00       	mov    $0x1,%eax
  1c02a5:	d3 e0                	shl    %cl,%eax
  1c02a7:	41 09 c5             	or     %eax,%r13d
        for (++format; *format; ++format) {
  1c02aa:	49 83 c4 01          	add    $0x1,%r12
  1c02ae:	41 0f b6 1c 24       	movzbl (%r12),%ebx
  1c02b3:	84 db                	test   %bl,%bl
  1c02b5:	75 cd                	jne    1c0284 <printer::vprintf(int, char const*, __va_list_tag*)+0x48>
                break;
            }
        }

        // process width
        int width = -1;
  1c02b7:	c7 45 98 ff ff ff ff 	movl   $0xffffffff,-0x68(%rbp)
            width = va_arg(val, int);
            ++format;
        }

        // process precision
        int precision = -1;
  1c02be:	c7 45 a4 ff ff ff ff 	movl   $0xffffffff,-0x5c(%rbp)
        if (*format == '.') {
  1c02c5:	41 80 3c 24 2e       	cmpb   $0x2e,(%r12)
  1c02ca:	0f 84 cc 00 00 00    	je     1c039c <printer::vprintf(int, char const*, __va_list_tag*)+0x160>
            }
        }

        // process length
        int length = 0;
        switch (*format) {
  1c02d0:	41 0f b6 04 24       	movzbl (%r12),%eax
  1c02d5:	3c 6c                	cmp    $0x6c,%al
  1c02d7:	0f 84 54 01 00 00    	je     1c0431 <printer::vprintf(int, char const*, __va_list_tag*)+0x1f5>
  1c02dd:	0f 8f 42 01 00 00    	jg     1c0425 <printer::vprintf(int, char const*, __va_list_tag*)+0x1e9>
  1c02e3:	3c 68                	cmp    $0x68,%al
  1c02e5:	0f 85 68 01 00 00    	jne    1c0453 <printer::vprintf(int, char const*, __va_list_tag*)+0x217>
        case 'z': // size_t, ssize_t
            length = 1;
            ++format;
            break;
        case 'h':
            ++format;
  1c02eb:	49 8d 4c 24 01       	lea    0x1(%r12),%rcx
        // process main conversion character
        int base = 10;
        unsigned long num = 0;
        const char* data = "";

        switch (*format) {
  1c02f0:	41 0f b6 44 24 01    	movzbl 0x1(%r12),%eax
  1c02f6:	8d 50 bd             	lea    -0x43(%rax),%edx
  1c02f9:	80 fa 35             	cmp    $0x35,%dl
  1c02fc:	0f 87 aa 05 00 00    	ja     1c08ac <printer::vprintf(int, char const*, __va_list_tag*)+0x670>
  1c0302:	0f b6 d2             	movzbl %dl,%edx
  1c0305:	3e ff 24 d5 10 0d 1c 	notrack jmpq *0x1c0d10(,%rdx,8)
  1c030c:	00 
        if (*format >= '1' && *format <= '9') {
  1c030d:	8d 43 cf             	lea    -0x31(%rbx),%eax
  1c0310:	3c 08                	cmp    $0x8,%al
  1c0312:	77 35                	ja     1c0349 <printer::vprintf(int, char const*, __va_list_tag*)+0x10d>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  1c0314:	41 0f b6 04 24       	movzbl (%r12),%eax
  1c0319:	8d 50 d0             	lea    -0x30(%rax),%edx
  1c031c:	80 fa 09             	cmp    $0x9,%dl
  1c031f:	77 63                	ja     1c0384 <printer::vprintf(int, char const*, __va_list_tag*)+0x148>
  1c0321:	ba 00 00 00 00       	mov    $0x0,%edx
                width = 10 * width + *format++ - '0';
  1c0326:	49 83 c4 01          	add    $0x1,%r12
  1c032a:	8d 14 92             	lea    (%rdx,%rdx,4),%edx
  1c032d:	0f be c0             	movsbl %al,%eax
  1c0330:	8d 54 50 d0          	lea    -0x30(%rax,%rdx,2),%edx
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  1c0334:	41 0f b6 04 24       	movzbl (%r12),%eax
  1c0339:	8d 48 d0             	lea    -0x30(%rax),%ecx
  1c033c:	80 f9 09             	cmp    $0x9,%cl
  1c033f:	76 e5                	jbe    1c0326 <printer::vprintf(int, char const*, __va_list_tag*)+0xea>
  1c0341:	89 55 98             	mov    %edx,-0x68(%rbp)
  1c0344:	e9 75 ff ff ff       	jmpq   1c02be <printer::vprintf(int, char const*, __va_list_tag*)+0x82>
        } else if (*format == '*') {
  1c0349:	80 fb 2a             	cmp    $0x2a,%bl
  1c034c:	75 42                	jne    1c0390 <printer::vprintf(int, char const*, __va_list_tag*)+0x154>
            width = va_arg(val, int);
  1c034e:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1c0352:	8b 07                	mov    (%rdi),%eax
  1c0354:	83 f8 2f             	cmp    $0x2f,%eax
  1c0357:	77 19                	ja     1c0372 <printer::vprintf(int, char const*, __va_list_tag*)+0x136>
  1c0359:	89 c2                	mov    %eax,%edx
  1c035b:	48 03 57 10          	add    0x10(%rdi),%rdx
  1c035f:	83 c0 08             	add    $0x8,%eax
  1c0362:	89 07                	mov    %eax,(%rdi)
  1c0364:	8b 02                	mov    (%rdx),%eax
  1c0366:	89 45 98             	mov    %eax,-0x68(%rbp)
            ++format;
  1c0369:	49 83 c4 01          	add    $0x1,%r12
  1c036d:	e9 4c ff ff ff       	jmpq   1c02be <printer::vprintf(int, char const*, __va_list_tag*)+0x82>
            width = va_arg(val, int);
  1c0372:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1c0376:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  1c037a:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1c037e:	48 89 47 08          	mov    %rax,0x8(%rdi)
  1c0382:	eb e0                	jmp    1c0364 <printer::vprintf(int, char const*, __va_list_tag*)+0x128>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  1c0384:	c7 45 98 00 00 00 00 	movl   $0x0,-0x68(%rbp)
  1c038b:	e9 2e ff ff ff       	jmpq   1c02be <printer::vprintf(int, char const*, __va_list_tag*)+0x82>
        int width = -1;
  1c0390:	c7 45 98 ff ff ff ff 	movl   $0xffffffff,-0x68(%rbp)
  1c0397:	e9 22 ff ff ff       	jmpq   1c02be <printer::vprintf(int, char const*, __va_list_tag*)+0x82>
            ++format;
  1c039c:	49 8d 54 24 01       	lea    0x1(%r12),%rdx
            if (*format >= '0' && *format <= '9') {
  1c03a1:	41 0f b6 44 24 01    	movzbl 0x1(%r12),%eax
  1c03a7:	8d 48 d0             	lea    -0x30(%rax),%ecx
  1c03aa:	80 f9 09             	cmp    $0x9,%cl
  1c03ad:	76 13                	jbe    1c03c2 <printer::vprintf(int, char const*, __va_list_tag*)+0x186>
            } else if (*format == '*') {
  1c03af:	3c 2a                	cmp    $0x2a,%al
  1c03b1:	74 32                	je     1c03e5 <printer::vprintf(int, char const*, __va_list_tag*)+0x1a9>
            ++format;
  1c03b3:	49 89 d4             	mov    %rdx,%r12
                precision = 0;
  1c03b6:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%rbp)
  1c03bd:	e9 0e ff ff ff       	jmpq   1c02d0 <printer::vprintf(int, char const*, __va_list_tag*)+0x94>
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
  1c03c2:	be 00 00 00 00       	mov    $0x0,%esi
                    precision = 10 * precision + *format++ - '0';
  1c03c7:	48 83 c2 01          	add    $0x1,%rdx
  1c03cb:	8d 0c b6             	lea    (%rsi,%rsi,4),%ecx
  1c03ce:	0f be c0             	movsbl %al,%eax
  1c03d1:	8d 74 48 d0          	lea    -0x30(%rax,%rcx,2),%esi
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
  1c03d5:	0f b6 02             	movzbl (%rdx),%eax
  1c03d8:	8d 48 d0             	lea    -0x30(%rax),%ecx
  1c03db:	80 f9 09             	cmp    $0x9,%cl
  1c03de:	76 e7                	jbe    1c03c7 <printer::vprintf(int, char const*, __va_list_tag*)+0x18b>
                    precision = 10 * precision + *format++ - '0';
  1c03e0:	49 89 d4             	mov    %rdx,%r12
  1c03e3:	eb 1c                	jmp    1c0401 <printer::vprintf(int, char const*, __va_list_tag*)+0x1c5>
                precision = va_arg(val, int);
  1c03e5:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1c03e9:	8b 01                	mov    (%rcx),%eax
  1c03eb:	83 f8 2f             	cmp    $0x2f,%eax
  1c03ee:	77 23                	ja     1c0413 <printer::vprintf(int, char const*, __va_list_tag*)+0x1d7>
  1c03f0:	89 c2                	mov    %eax,%edx
  1c03f2:	48 03 51 10          	add    0x10(%rcx),%rdx
  1c03f6:	83 c0 08             	add    $0x8,%eax
  1c03f9:	89 01                	mov    %eax,(%rcx)
  1c03fb:	8b 32                	mov    (%rdx),%esi
                ++format;
  1c03fd:	49 83 c4 02          	add    $0x2,%r12
            if (precision < 0) {
  1c0401:	85 f6                	test   %esi,%esi
  1c0403:	b8 00 00 00 00       	mov    $0x0,%eax
  1c0408:	0f 49 c6             	cmovns %esi,%eax
  1c040b:	89 45 a4             	mov    %eax,-0x5c(%rbp)
  1c040e:	e9 bd fe ff ff       	jmpq   1c02d0 <printer::vprintf(int, char const*, __va_list_tag*)+0x94>
                precision = va_arg(val, int);
  1c0413:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1c0417:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  1c041b:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1c041f:	48 89 47 08          	mov    %rax,0x8(%rdi)
  1c0423:	eb d6                	jmp    1c03fb <printer::vprintf(int, char const*, __va_list_tag*)+0x1bf>
        switch (*format) {
  1c0425:	3c 74                	cmp    $0x74,%al
  1c0427:	74 08                	je     1c0431 <printer::vprintf(int, char const*, __va_list_tag*)+0x1f5>
  1c0429:	3c 7a                	cmp    $0x7a,%al
  1c042b:	0f 85 e2 05 00 00    	jne    1c0a13 <printer::vprintf(int, char const*, __va_list_tag*)+0x7d7>
            ++format;
  1c0431:	49 8d 4c 24 01       	lea    0x1(%r12),%rcx
        switch (*format) {
  1c0436:	41 0f b6 44 24 01    	movzbl 0x1(%r12),%eax
  1c043c:	8d 50 bd             	lea    -0x43(%rax),%edx
  1c043f:	80 fa 35             	cmp    $0x35,%dl
  1c0442:	0f 87 64 04 00 00    	ja     1c08ac <printer::vprintf(int, char const*, __va_list_tag*)+0x670>
  1c0448:	0f b6 d2             	movzbl %dl,%edx
  1c044b:	3e ff 24 d5 c0 0e 1c 	notrack jmpq *0x1c0ec0(,%rdx,8)
  1c0452:	00 
  1c0453:	8d 50 bd             	lea    -0x43(%rax),%edx
  1c0456:	80 fa 35             	cmp    $0x35,%dl
  1c0459:	0f 87 4a 04 00 00    	ja     1c08a9 <printer::vprintf(int, char const*, __va_list_tag*)+0x66d>
  1c045f:	0f b6 d2             	movzbl %dl,%edx
  1c0462:	3e ff 24 d5 70 10 1c 	notrack jmpq *0x1c1070(,%rdx,8)
  1c0469:	00 
        case 'd':
        case 'i': {
            long x = length ? va_arg(val, long) : va_arg(val, int);
  1c046a:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1c046e:	8b 07                	mov    (%rdi),%eax
  1c0470:	83 f8 2f             	cmp    $0x2f,%eax
  1c0473:	0f 87 c9 01 00 00    	ja     1c0642 <printer::vprintf(int, char const*, __va_list_tag*)+0x406>
  1c0479:	89 c2                	mov    %eax,%edx
  1c047b:	48 03 57 10          	add    0x10(%rdi),%rdx
  1c047f:	83 c0 08             	add    $0x8,%eax
  1c0482:	89 07                	mov    %eax,(%rdi)
  1c0484:	48 8b 12             	mov    (%rdx),%rdx
  1c0487:	49 89 cc             	mov    %rcx,%r12
            int negative = x < 0 ? FLAG_NEGATIVE : 0;
  1c048a:	48 89 d0             	mov    %rdx,%rax
  1c048d:	48 c1 f8 38          	sar    $0x38,%rax
            num = negative ? -x : x;
  1c0491:	49 89 d0             	mov    %rdx,%r8
  1c0494:	49 f7 d8             	neg    %r8
  1c0497:	25 80 00 00 00       	and    $0x80,%eax
  1c049c:	4c 0f 44 c2          	cmove  %rdx,%r8
            flags |= FLAG_NUMERIC | FLAG_SIGNED | negative;
  1c04a0:	41 09 c5             	or     %eax,%r13d
  1c04a3:	41 83 cd 60          	or     $0x60,%r13d
        const char* data = "";
  1c04a7:	bb a5 14 1c 00       	mov    $0x1c14a5,%ebx
                format--;
            }
            break;
        }

        if (flags & FLAG_NUMERIC) {
  1c04ac:	44 89 e8             	mov    %r13d,%eax
  1c04af:	83 e0 20             	and    $0x20,%eax
  1c04b2:	89 45 9c             	mov    %eax,-0x64(%rbp)
  1c04b5:	41 b9 0a 00 00 00    	mov    $0xa,%r9d
  1c04bb:	0f 85 0e 04 00 00    	jne    1c08cf <printer::vprintf(int, char const*, __va_list_tag*)+0x693>
            data = fill_numbuf(numbuf + NUMBUFSIZ, num, base);
        }

        const char* prefix = "";
        if ((flags & FLAG_NUMERIC) && (flags & FLAG_SIGNED)) {
  1c04c1:	44 89 6d 8c          	mov    %r13d,-0x74(%rbp)
  1c04c5:	44 89 e8             	mov    %r13d,%eax
  1c04c8:	83 e0 60             	and    $0x60,%eax
  1c04cb:	83 f8 60             	cmp    $0x60,%eax
  1c04ce:	0f 84 3e 04 00 00    	je     1c0912 <printer::vprintf(int, char const*, __va_list_tag*)+0x6d6>
            } else if (flags & FLAG_PLUSPOSITIVE) {
                prefix = "+";
            } else if (flags & FLAG_SPACEPOSITIVE) {
                prefix = " ";
            }
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
  1c04d4:	44 89 e8             	mov    %r13d,%eax
  1c04d7:	83 e0 21             	and    $0x21,%eax
        const char* prefix = "";
  1c04da:	48 c7 45 a8 a5 14 1c 	movq   $0x1c14a5,-0x58(%rbp)
  1c04e1:	00 
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
  1c04e2:	83 f8 21             	cmp    $0x21,%eax
  1c04e5:	0f 84 66 04 00 00    	je     1c0951 <printer::vprintf(int, char const*, __va_list_tag*)+0x715>
                   && (num || (flags & FLAG_ALT2))) {
            prefix = (base == -16 ? "0x" : "0X");
        }

        int datalen;
        if (precision >= 0 && !(flags & FLAG_NUMERIC)) {
  1c04eb:	8b 4d a4             	mov    -0x5c(%rbp),%ecx
  1c04ee:	89 c8                	mov    %ecx,%eax
  1c04f0:	f7 d0                	not    %eax
  1c04f2:	c1 e8 1f             	shr    $0x1f,%eax
  1c04f5:	89 45 88             	mov    %eax,-0x78(%rbp)
  1c04f8:	83 7d 9c 00          	cmpl   $0x0,-0x64(%rbp)
  1c04fc:	0f 85 8b 04 00 00    	jne    1c098d <printer::vprintf(int, char const*, __va_list_tag*)+0x751>
  1c0502:	84 c0                	test   %al,%al
  1c0504:	0f 84 83 04 00 00    	je     1c098d <printer::vprintf(int, char const*, __va_list_tag*)+0x751>
            datalen = strnlen(data, precision);
  1c050a:	48 63 f1             	movslq %ecx,%rsi
  1c050d:	48 89 df             	mov    %rbx,%rdi
  1c0510:	e8 1a fc ff ff       	callq  1c012f <strnlen>
  1c0515:	89 45 a0             	mov    %eax,-0x60(%rbp)
        if ((flags & FLAG_NUMERIC)
            && precision >= 0) {
            zeros = precision > datalen ? precision - datalen : 0;
        } else if ((flags & FLAG_NUMERIC)
                   && (flags & FLAG_ZERO)
                   && !(flags & FLAG_LEFTJUSTIFY)
  1c0518:	8b 45 8c             	mov    -0x74(%rbp),%eax
  1c051b:	83 e0 26             	and    $0x26,%eax
                   && datalen + (int) strlen(prefix) < width) {
            zeros = width - datalen - strlen(prefix);
        } else {
            zeros = 0;
  1c051e:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%rbp)
                   && datalen + (int) strlen(prefix) < width) {
  1c0525:	83 f8 22             	cmp    $0x22,%eax
  1c0528:	0f 84 97 04 00 00    	je     1c09c5 <printer::vprintf(int, char const*, __va_list_tag*)+0x789>
        }

        width -= datalen + zeros + strlen(prefix);
  1c052e:	48 8b 7d a8          	mov    -0x58(%rbp),%rdi
  1c0532:	e8 d9 fb ff ff       	callq  1c0110 <strlen>
  1c0537:	8b 55 a4             	mov    -0x5c(%rbp),%edx
  1c053a:	03 55 a0             	add    -0x60(%rbp),%edx
  1c053d:	8b 7d 98             	mov    -0x68(%rbp),%edi
  1c0540:	29 d7                	sub    %edx,%edi
  1c0542:	89 fa                	mov    %edi,%edx
  1c0544:	29 c2                	sub    %eax,%edx
  1c0546:	89 55 98             	mov    %edx,-0x68(%rbp)
  1c0549:	89 55 9c             	mov    %edx,-0x64(%rbp)
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
  1c054c:	41 f6 c5 04          	test   $0x4,%r13b
  1c0550:	75 32                	jne    1c0584 <printer::vprintf(int, char const*, __va_list_tag*)+0x348>
        width -= datalen + zeros + strlen(prefix);
  1c0552:	41 89 d5             	mov    %edx,%r13d
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
  1c0555:	85 d2                	test   %edx,%edx
  1c0557:	7e 2b                	jle    1c0584 <printer::vprintf(int, char const*, __va_list_tag*)+0x348>
            putc(' ', color);
  1c0559:	49 8b 06             	mov    (%r14),%rax
  1c055c:	44 89 fa             	mov    %r15d,%edx
  1c055f:	be 20 00 00 00       	mov    $0x20,%esi
  1c0564:	4c 89 f7             	mov    %r14,%rdi
  1c0567:	ff 10                	callq  *(%rax)
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
  1c0569:	41 83 ed 01          	sub    $0x1,%r13d
  1c056d:	45 85 ed             	test   %r13d,%r13d
  1c0570:	7f e7                	jg     1c0559 <printer::vprintf(int, char const*, __va_list_tag*)+0x31d>
  1c0572:	8b 7d 98             	mov    -0x68(%rbp),%edi
  1c0575:	85 ff                	test   %edi,%edi
  1c0577:	b8 01 00 00 00       	mov    $0x1,%eax
  1c057c:	0f 4f c7             	cmovg  %edi,%eax
  1c057f:	29 c7                	sub    %eax,%edi
  1c0581:	89 7d 9c             	mov    %edi,-0x64(%rbp)
        }
        for (; *prefix; ++prefix) {
  1c0584:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  1c0588:	0f b6 00             	movzbl (%rax),%eax
  1c058b:	4c 8b 6d a8          	mov    -0x58(%rbp),%r13
  1c058f:	84 c0                	test   %al,%al
  1c0591:	74 1b                	je     1c05ae <printer::vprintf(int, char const*, __va_list_tag*)+0x372>
            putc(*prefix, color);
  1c0593:	0f b6 f0             	movzbl %al,%esi
  1c0596:	49 8b 06             	mov    (%r14),%rax
  1c0599:	44 89 fa             	mov    %r15d,%edx
  1c059c:	4c 89 f7             	mov    %r14,%rdi
  1c059f:	ff 10                	callq  *(%rax)
        for (; *prefix; ++prefix) {
  1c05a1:	49 83 c5 01          	add    $0x1,%r13
  1c05a5:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
  1c05aa:	84 c0                	test   %al,%al
  1c05ac:	75 e5                	jne    1c0593 <printer::vprintf(int, char const*, __va_list_tag*)+0x357>
        }
        for (; zeros > 0; --zeros) {
  1c05ae:	44 8b 6d a4          	mov    -0x5c(%rbp),%r13d
  1c05b2:	83 7d a4 00          	cmpl   $0x0,-0x5c(%rbp)
  1c05b6:	7e 16                	jle    1c05ce <printer::vprintf(int, char const*, __va_list_tag*)+0x392>
            putc('0', color);
  1c05b8:	49 8b 06             	mov    (%r14),%rax
  1c05bb:	44 89 fa             	mov    %r15d,%edx
  1c05be:	be 30 00 00 00       	mov    $0x30,%esi
  1c05c3:	4c 89 f7             	mov    %r14,%rdi
  1c05c6:	ff 10                	callq  *(%rax)
        for (; zeros > 0; --zeros) {
  1c05c8:	41 83 ed 01          	sub    $0x1,%r13d
  1c05cc:	75 ea                	jne    1c05b8 <printer::vprintf(int, char const*, __va_list_tag*)+0x37c>
        }
        for (; datalen > 0; ++data, --datalen) {
  1c05ce:	83 7d a0 00          	cmpl   $0x0,-0x60(%rbp)
  1c05d2:	7e 22                	jle    1c05f6 <printer::vprintf(int, char const*, __va_list_tag*)+0x3ba>
  1c05d4:	8b 45 a0             	mov    -0x60(%rbp),%eax
  1c05d7:	8d 40 ff             	lea    -0x1(%rax),%eax
  1c05da:	4c 8d 6c 03 01       	lea    0x1(%rbx,%rax,1),%r13
            putc(*data, color);
  1c05df:	0f b6 33             	movzbl (%rbx),%esi
  1c05e2:	49 8b 06             	mov    (%r14),%rax
  1c05e5:	44 89 fa             	mov    %r15d,%edx
  1c05e8:	4c 89 f7             	mov    %r14,%rdi
  1c05eb:	ff 10                	callq  *(%rax)
        for (; datalen > 0; ++data, --datalen) {
  1c05ed:	48 83 c3 01          	add    $0x1,%rbx
  1c05f1:	4c 39 eb             	cmp    %r13,%rbx
  1c05f4:	75 e9                	jne    1c05df <printer::vprintf(int, char const*, __va_list_tag*)+0x3a3>
        }
        for (; width > 0; --width) {
  1c05f6:	8b 5d 9c             	mov    -0x64(%rbp),%ebx
  1c05f9:	83 7d 9c 00          	cmpl   $0x0,-0x64(%rbp)
  1c05fd:	7e 15                	jle    1c0614 <printer::vprintf(int, char const*, __va_list_tag*)+0x3d8>
            putc(' ', color);
  1c05ff:	49 8b 06             	mov    (%r14),%rax
  1c0602:	44 89 fa             	mov    %r15d,%edx
  1c0605:	be 20 00 00 00       	mov    $0x20,%esi
  1c060a:	4c 89 f7             	mov    %r14,%rdi
  1c060d:	ff 10                	callq  *(%rax)
        for (; width > 0; --width) {
  1c060f:	83 eb 01             	sub    $0x1,%ebx
  1c0612:	75 eb                	jne    1c05ff <printer::vprintf(int, char const*, __va_list_tag*)+0x3c3>
    for (; *format; ++format) {
  1c0614:	49 8d 5c 24 01       	lea    0x1(%r12),%rbx
  1c0619:	41 0f b6 44 24 01    	movzbl 0x1(%r12),%eax
  1c061f:	84 c0                	test   %al,%al
  1c0621:	0f 84 ff 03 00 00    	je     1c0a26 <printer::vprintf(int, char const*, __va_list_tag*)+0x7ea>
        if (*format != '%') {
  1c0627:	3c 25                	cmp    $0x25,%al
  1c0629:	0f 84 3f fc ff ff    	je     1c026e <printer::vprintf(int, char const*, __va_list_tag*)+0x32>
            putc(*format, color);
  1c062f:	0f b6 f0             	movzbl %al,%esi
  1c0632:	49 8b 06             	mov    (%r14),%rax
  1c0635:	44 89 fa             	mov    %r15d,%edx
  1c0638:	4c 89 f7             	mov    %r14,%rdi
  1c063b:	ff 10                	callq  *(%rax)
            continue;
  1c063d:	49 89 dc             	mov    %rbx,%r12
  1c0640:	eb d2                	jmp    1c0614 <printer::vprintf(int, char const*, __va_list_tag*)+0x3d8>
            long x = length ? va_arg(val, long) : va_arg(val, int);
  1c0642:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1c0646:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  1c064a:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1c064e:	48 89 47 08          	mov    %rax,0x8(%rdi)
  1c0652:	e9 2d fe ff ff       	jmpq   1c0484 <printer::vprintf(int, char const*, __va_list_tag*)+0x248>
        switch (*format) {
  1c0657:	49 89 cc             	mov    %rcx,%r12
            long x = length ? va_arg(val, long) : va_arg(val, int);
  1c065a:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1c065e:	8b 01                	mov    (%rcx),%eax
  1c0660:	83 f8 2f             	cmp    $0x2f,%eax
  1c0663:	77 13                	ja     1c0678 <printer::vprintf(int, char const*, __va_list_tag*)+0x43c>
  1c0665:	89 c2                	mov    %eax,%edx
  1c0667:	48 03 51 10          	add    0x10(%rcx),%rdx
  1c066b:	83 c0 08             	add    $0x8,%eax
  1c066e:	89 01                	mov    %eax,(%rcx)
  1c0670:	48 63 12             	movslq (%rdx),%rdx
  1c0673:	e9 12 fe ff ff       	jmpq   1c048a <printer::vprintf(int, char const*, __va_list_tag*)+0x24e>
  1c0678:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1c067c:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  1c0680:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1c0684:	48 89 41 08          	mov    %rax,0x8(%rcx)
  1c0688:	eb e6                	jmp    1c0670 <printer::vprintf(int, char const*, __va_list_tag*)+0x434>
        switch (*format) {
  1c068a:	49 89 cc             	mov    %rcx,%r12
  1c068d:	b8 01 00 00 00       	mov    $0x1,%eax
  1c0692:	be 0a 00 00 00       	mov    $0xa,%esi
  1c0697:	e9 a8 00 00 00       	jmpq   1c0744 <printer::vprintf(int, char const*, __va_list_tag*)+0x508>
  1c069c:	49 89 cc             	mov    %rcx,%r12
  1c069f:	b8 00 00 00 00       	mov    $0x0,%eax
  1c06a4:	be 0a 00 00 00       	mov    $0xa,%esi
  1c06a9:	e9 96 00 00 00       	jmpq   1c0744 <printer::vprintf(int, char const*, __va_list_tag*)+0x508>
        switch (*format) {
  1c06ae:	b8 00 00 00 00       	mov    $0x0,%eax
  1c06b3:	be 0a 00 00 00       	mov    $0xa,%esi
  1c06b8:	e9 87 00 00 00       	jmpq   1c0744 <printer::vprintf(int, char const*, __va_list_tag*)+0x508>
  1c06bd:	b8 00 00 00 00       	mov    $0x0,%eax
  1c06c2:	be 0a 00 00 00       	mov    $0xa,%esi
  1c06c7:	eb 7b                	jmp    1c0744 <printer::vprintf(int, char const*, __va_list_tag*)+0x508>
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
  1c06c9:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1c06cd:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  1c06d1:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1c06d5:	48 89 47 08          	mov    %rax,0x8(%rdi)
  1c06d9:	e9 84 00 00 00       	jmpq   1c0762 <printer::vprintf(int, char const*, __va_list_tag*)+0x526>
  1c06de:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1c06e2:	8b 01                	mov    (%rcx),%eax
  1c06e4:	83 f8 2f             	cmp    $0x2f,%eax
  1c06e7:	77 10                	ja     1c06f9 <printer::vprintf(int, char const*, __va_list_tag*)+0x4bd>
  1c06e9:	89 c2                	mov    %eax,%edx
  1c06eb:	48 03 51 10          	add    0x10(%rcx),%rdx
  1c06ef:	83 c0 08             	add    $0x8,%eax
  1c06f2:	89 01                	mov    %eax,(%rcx)
  1c06f4:	44 8b 02             	mov    (%rdx),%r8d
  1c06f7:	eb 6c                	jmp    1c0765 <printer::vprintf(int, char const*, __va_list_tag*)+0x529>
  1c06f9:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1c06fd:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  1c0701:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1c0705:	48 89 41 08          	mov    %rax,0x8(%rcx)
  1c0709:	eb e9                	jmp    1c06f4 <printer::vprintf(int, char const*, __va_list_tag*)+0x4b8>
  1c070b:	41 89 f1             	mov    %esi,%r9d
        if (flags & FLAG_NUMERIC) {
  1c070e:	c7 45 9c 20 00 00 00 	movl   $0x20,-0x64(%rbp)
    const char* digits = upper_digits;
  1c0715:	bf 00 14 1c 00       	mov    $0x1c1400,%edi
  1c071a:	e9 c0 01 00 00       	jmpq   1c08df <printer::vprintf(int, char const*, __va_list_tag*)+0x6a3>
        switch (*format) {
  1c071f:	49 89 cc             	mov    %rcx,%r12
  1c0722:	b8 01 00 00 00       	mov    $0x1,%eax
  1c0727:	eb 16                	jmp    1c073f <printer::vprintf(int, char const*, __va_list_tag*)+0x503>
  1c0729:	49 89 cc             	mov    %rcx,%r12
  1c072c:	b8 00 00 00 00       	mov    $0x0,%eax
  1c0731:	eb 0c                	jmp    1c073f <printer::vprintf(int, char const*, __va_list_tag*)+0x503>
        switch (*format) {
  1c0733:	b8 00 00 00 00       	mov    $0x0,%eax
  1c0738:	eb 05                	jmp    1c073f <printer::vprintf(int, char const*, __va_list_tag*)+0x503>
  1c073a:	b8 00 00 00 00       	mov    $0x0,%eax
            base = -16;
  1c073f:	be f0 ff ff ff       	mov    $0xfffffff0,%esi
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
  1c0744:	85 c0                	test   %eax,%eax
  1c0746:	74 96                	je     1c06de <printer::vprintf(int, char const*, __va_list_tag*)+0x4a2>
  1c0748:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1c074c:	8b 01                	mov    (%rcx),%eax
  1c074e:	83 f8 2f             	cmp    $0x2f,%eax
  1c0751:	0f 87 72 ff ff ff    	ja     1c06c9 <printer::vprintf(int, char const*, __va_list_tag*)+0x48d>
  1c0757:	89 c2                	mov    %eax,%edx
  1c0759:	48 03 51 10          	add    0x10(%rcx),%rdx
  1c075d:	83 c0 08             	add    $0x8,%eax
  1c0760:	89 01                	mov    %eax,(%rcx)
  1c0762:	4c 8b 02             	mov    (%rdx),%r8
            flags |= FLAG_NUMERIC;
  1c0765:	41 83 cd 20          	or     $0x20,%r13d
    if (base < 0) {
  1c0769:	85 f6                	test   %esi,%esi
  1c076b:	79 9e                	jns    1c070b <printer::vprintf(int, char const*, __va_list_tag*)+0x4cf>
        base = -base;
  1c076d:	41 89 f1             	mov    %esi,%r9d
  1c0770:	f7 de                	neg    %esi
  1c0772:	c7 45 9c 20 00 00 00 	movl   $0x20,-0x64(%rbp)
        digits = lower_digits;
  1c0779:	bf e0 13 1c 00       	mov    $0x1c13e0,%edi
  1c077e:	e9 5c 01 00 00       	jmpq   1c08df <printer::vprintf(int, char const*, __va_list_tag*)+0x6a3>
        switch (*format) {
  1c0783:	49 89 cc             	mov    %rcx,%r12
  1c0786:	b8 01 00 00 00       	mov    $0x1,%eax
  1c078b:	eb 16                	jmp    1c07a3 <printer::vprintf(int, char const*, __va_list_tag*)+0x567>
  1c078d:	49 89 cc             	mov    %rcx,%r12
  1c0790:	b8 00 00 00 00       	mov    $0x0,%eax
  1c0795:	eb 0c                	jmp    1c07a3 <printer::vprintf(int, char const*, __va_list_tag*)+0x567>
        switch (*format) {
  1c0797:	b8 00 00 00 00       	mov    $0x0,%eax
  1c079c:	eb 05                	jmp    1c07a3 <printer::vprintf(int, char const*, __va_list_tag*)+0x567>
  1c079e:	b8 00 00 00 00       	mov    $0x0,%eax
            base = 16;
  1c07a3:	be 10 00 00 00       	mov    $0x10,%esi
            goto format_unsigned;
  1c07a8:	eb 9a                	jmp    1c0744 <printer::vprintf(int, char const*, __va_list_tag*)+0x508>
        switch (*format) {
  1c07aa:	49 89 cc             	mov    %rcx,%r12
            num = (uintptr_t) va_arg(val, void*);
  1c07ad:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1c07b1:	8b 01                	mov    (%rcx),%eax
  1c07b3:	83 f8 2f             	cmp    $0x2f,%eax
  1c07b6:	77 21                	ja     1c07d9 <printer::vprintf(int, char const*, __va_list_tag*)+0x59d>
  1c07b8:	89 c2                	mov    %eax,%edx
  1c07ba:	48 03 51 10          	add    0x10(%rcx),%rdx
  1c07be:	83 c0 08             	add    $0x8,%eax
  1c07c1:	89 01                	mov    %eax,(%rcx)
  1c07c3:	4c 8b 02             	mov    (%rdx),%r8
            flags |= FLAG_ALT | FLAG_ALT2 | FLAG_NUMERIC;
  1c07c6:	41 81 cd 21 01 00 00 	or     $0x121,%r13d
            base = -16;
  1c07cd:	be f0 ff ff ff       	mov    $0xfffffff0,%esi
  1c07d2:	eb 99                	jmp    1c076d <printer::vprintf(int, char const*, __va_list_tag*)+0x531>
        switch (*format) {
  1c07d4:	49 89 cc             	mov    %rcx,%r12
  1c07d7:	eb d4                	jmp    1c07ad <printer::vprintf(int, char const*, __va_list_tag*)+0x571>
            num = (uintptr_t) va_arg(val, void*);
  1c07d9:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1c07dd:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  1c07e1:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1c07e5:	48 89 47 08          	mov    %rax,0x8(%rdi)
  1c07e9:	eb d8                	jmp    1c07c3 <printer::vprintf(int, char const*, __va_list_tag*)+0x587>
        switch (*format) {
  1c07eb:	49 89 cc             	mov    %rcx,%r12
            data = va_arg(val, char*);
  1c07ee:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1c07f2:	8b 07                	mov    (%rdi),%eax
  1c07f4:	83 f8 2f             	cmp    $0x2f,%eax
  1c07f7:	77 1e                	ja     1c0817 <printer::vprintf(int, char const*, __va_list_tag*)+0x5db>
  1c07f9:	89 c2                	mov    %eax,%edx
  1c07fb:	48 03 57 10          	add    0x10(%rdi),%rdx
  1c07ff:	83 c0 08             	add    $0x8,%eax
  1c0802:	89 07                	mov    %eax,(%rdi)
  1c0804:	48 8b 1a             	mov    (%rdx),%rbx
        unsigned long num = 0;
  1c0807:	41 b8 00 00 00 00    	mov    $0x0,%r8d
            break;
  1c080d:	e9 9a fc ff ff       	jmpq   1c04ac <printer::vprintf(int, char const*, __va_list_tag*)+0x270>
        switch (*format) {
  1c0812:	49 89 cc             	mov    %rcx,%r12
  1c0815:	eb d7                	jmp    1c07ee <printer::vprintf(int, char const*, __va_list_tag*)+0x5b2>
            data = va_arg(val, char*);
  1c0817:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1c081b:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  1c081f:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1c0823:	48 89 41 08          	mov    %rax,0x8(%rcx)
  1c0827:	eb db                	jmp    1c0804 <printer::vprintf(int, char const*, __va_list_tag*)+0x5c8>
        switch (*format) {
  1c0829:	49 89 cc             	mov    %rcx,%r12
            color = va_arg(val, int);
  1c082c:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1c0830:	8b 01                	mov    (%rcx),%eax
  1c0832:	83 f8 2f             	cmp    $0x2f,%eax
  1c0835:	77 18                	ja     1c084f <printer::vprintf(int, char const*, __va_list_tag*)+0x613>
  1c0837:	89 c2                	mov    %eax,%edx
  1c0839:	48 03 51 10          	add    0x10(%rcx),%rdx
  1c083d:	83 c0 08             	add    $0x8,%eax
  1c0840:	89 01                	mov    %eax,(%rcx)
  1c0842:	44 8b 3a             	mov    (%rdx),%r15d
            continue;
  1c0845:	e9 ca fd ff ff       	jmpq   1c0614 <printer::vprintf(int, char const*, __va_list_tag*)+0x3d8>
        switch (*format) {
  1c084a:	49 89 cc             	mov    %rcx,%r12
  1c084d:	eb dd                	jmp    1c082c <printer::vprintf(int, char const*, __va_list_tag*)+0x5f0>
            color = va_arg(val, int);
  1c084f:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1c0853:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  1c0857:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1c085b:	48 89 47 08          	mov    %rax,0x8(%rdi)
  1c085f:	eb e1                	jmp    1c0842 <printer::vprintf(int, char const*, __va_list_tag*)+0x606>
        switch (*format) {
  1c0861:	49 89 cc             	mov    %rcx,%r12
            numbuf[0] = va_arg(val, int);
  1c0864:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1c0868:	8b 07                	mov    (%rdi),%eax
  1c086a:	83 f8 2f             	cmp    $0x2f,%eax
  1c086d:	77 28                	ja     1c0897 <printer::vprintf(int, char const*, __va_list_tag*)+0x65b>
  1c086f:	89 c2                	mov    %eax,%edx
  1c0871:	48 03 57 10          	add    0x10(%rdi),%rdx
  1c0875:	83 c0 08             	add    $0x8,%eax
  1c0878:	89 07                	mov    %eax,(%rdi)
  1c087a:	8b 02                	mov    (%rdx),%eax
  1c087c:	88 45 b8             	mov    %al,-0x48(%rbp)
            numbuf[1] = '\0';
  1c087f:	c6 45 b9 00          	movb   $0x0,-0x47(%rbp)
            data = numbuf;
  1c0883:	48 8d 5d b8          	lea    -0x48(%rbp),%rbx
        unsigned long num = 0;
  1c0887:	41 b8 00 00 00 00    	mov    $0x0,%r8d
            break;
  1c088d:	e9 1a fc ff ff       	jmpq   1c04ac <printer::vprintf(int, char const*, __va_list_tag*)+0x270>
        switch (*format) {
  1c0892:	49 89 cc             	mov    %rcx,%r12
  1c0895:	eb cd                	jmp    1c0864 <printer::vprintf(int, char const*, __va_list_tag*)+0x628>
            numbuf[0] = va_arg(val, int);
  1c0897:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1c089b:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  1c089f:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1c08a3:	48 89 41 08          	mov    %rax,0x8(%rcx)
  1c08a7:	eb d1                	jmp    1c087a <printer::vprintf(int, char const*, __va_list_tag*)+0x63e>
        switch (*format) {
  1c08a9:	4c 89 e1             	mov    %r12,%rcx
            numbuf[0] = (*format ? *format : '%');
  1c08ac:	84 c0                	test   %al,%al
  1c08ae:	0f 85 3b 01 00 00    	jne    1c09ef <printer::vprintf(int, char const*, __va_list_tag*)+0x7b3>
  1c08b4:	c6 45 b8 25          	movb   $0x25,-0x48(%rbp)
            numbuf[1] = '\0';
  1c08b8:	c6 45 b9 00          	movb   $0x0,-0x47(%rbp)
                format--;
  1c08bc:	4c 8d 61 ff          	lea    -0x1(%rcx),%r12
            data = numbuf;
  1c08c0:	48 8d 5d b8          	lea    -0x48(%rbp),%rbx
        unsigned long num = 0;
  1c08c4:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  1c08ca:	e9 dd fb ff ff       	jmpq   1c04ac <printer::vprintf(int, char const*, __va_list_tag*)+0x270>
        if (flags & FLAG_NUMERIC) {
  1c08cf:	41 b9 0a 00 00 00    	mov    $0xa,%r9d
    const char* digits = upper_digits;
  1c08d5:	bf 00 14 1c 00       	mov    $0x1c1400,%edi
        if (flags & FLAG_NUMERIC) {
  1c08da:	be 0a 00 00 00       	mov    $0xa,%esi
    *--numbuf_end = '\0';
  1c08df:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
  1c08e3:	4c 89 c1             	mov    %r8,%rcx
  1c08e6:	48 8d 5d cf          	lea    -0x31(%rbp),%rbx
        *--numbuf_end = digits[val % base];
  1c08ea:	48 63 f6             	movslq %esi,%rsi
  1c08ed:	48 83 eb 01          	sub    $0x1,%rbx
  1c08f1:	48 89 c8             	mov    %rcx,%rax
  1c08f4:	ba 00 00 00 00       	mov    $0x0,%edx
  1c08f9:	48 f7 f6             	div    %rsi
  1c08fc:	0f b6 14 17          	movzbl (%rdi,%rdx,1),%edx
  1c0900:	88 13                	mov    %dl,(%rbx)
        val /= base;
  1c0902:	48 89 ca             	mov    %rcx,%rdx
  1c0905:	48 89 c1             	mov    %rax,%rcx
    } while (val != 0);
  1c0908:	48 39 d6             	cmp    %rdx,%rsi
  1c090b:	76 e0                	jbe    1c08ed <printer::vprintf(int, char const*, __va_list_tag*)+0x6b1>
  1c090d:	e9 af fb ff ff       	jmpq   1c04c1 <printer::vprintf(int, char const*, __va_list_tag*)+0x285>
                prefix = "-";
  1c0912:	48 c7 45 a8 07 0d 1c 	movq   $0x1c0d07,-0x58(%rbp)
  1c0919:	00 
            if (flags & FLAG_NEGATIVE) {
  1c091a:	41 f6 c5 80          	test   $0x80,%r13b
  1c091e:	0f 85 c7 fb ff ff    	jne    1c04eb <printer::vprintf(int, char const*, __va_list_tag*)+0x2af>
                prefix = "+";
  1c0924:	48 c7 45 a8 05 0d 1c 	movq   $0x1c0d05,-0x58(%rbp)
  1c092b:	00 
            } else if (flags & FLAG_PLUSPOSITIVE) {
  1c092c:	41 f6 c5 10          	test   $0x10,%r13b
  1c0930:	0f 85 b5 fb ff ff    	jne    1c04eb <printer::vprintf(int, char const*, __va_list_tag*)+0x2af>
                prefix = " ";
  1c0936:	41 f6 c5 08          	test   $0x8,%r13b
  1c093a:	ba a5 14 1c 00       	mov    $0x1c14a5,%edx
  1c093f:	b8 96 14 1c 00       	mov    $0x1c1496,%eax
  1c0944:	48 0f 44 c2          	cmove  %rdx,%rax
  1c0948:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
  1c094c:	e9 9a fb ff ff       	jmpq   1c04eb <printer::vprintf(int, char const*, __va_list_tag*)+0x2af>
                   && (base == 16 || base == -16)
  1c0951:	41 8d 41 10          	lea    0x10(%r9),%eax
  1c0955:	a9 df ff ff ff       	test   $0xffffffdf,%eax
  1c095a:	0f 85 8b fb ff ff    	jne    1c04eb <printer::vprintf(int, char const*, __va_list_tag*)+0x2af>
                   && (num || (flags & FLAG_ALT2))) {
  1c0960:	4d 85 c0             	test   %r8,%r8
  1c0963:	75 0d                	jne    1c0972 <printer::vprintf(int, char const*, __va_list_tag*)+0x736>
  1c0965:	41 f7 c5 00 01 00 00 	test   $0x100,%r13d
  1c096c:	0f 84 79 fb ff ff    	je     1c04eb <printer::vprintf(int, char const*, __va_list_tag*)+0x2af>
            prefix = (base == -16 ? "0x" : "0X");
  1c0972:	41 83 f9 f0          	cmp    $0xfffffff0,%r9d
  1c0976:	ba 02 0d 1c 00       	mov    $0x1c0d02,%edx
  1c097b:	b8 09 0d 1c 00       	mov    $0x1c0d09,%eax
  1c0980:	48 0f 44 c2          	cmove  %rdx,%rax
  1c0984:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
  1c0988:	e9 5e fb ff ff       	jmpq   1c04eb <printer::vprintf(int, char const*, __va_list_tag*)+0x2af>
            datalen = strlen(data);
  1c098d:	48 89 df             	mov    %rbx,%rdi
  1c0990:	e8 7b f7 ff ff       	callq  1c0110 <strlen>
  1c0995:	89 45 a0             	mov    %eax,-0x60(%rbp)
            && precision >= 0) {
  1c0998:	83 7d 9c 00          	cmpl   $0x0,-0x64(%rbp)
  1c099c:	0f 84 76 fb ff ff    	je     1c0518 <printer::vprintf(int, char const*, __va_list_tag*)+0x2dc>
  1c09a2:	80 7d 88 00          	cmpb   $0x0,-0x78(%rbp)
  1c09a6:	0f 84 6c fb ff ff    	je     1c0518 <printer::vprintf(int, char const*, __va_list_tag*)+0x2dc>
            zeros = precision > datalen ? precision - datalen : 0;
  1c09ac:	8b 4d a4             	mov    -0x5c(%rbp),%ecx
  1c09af:	89 ca                	mov    %ecx,%edx
  1c09b1:	29 c2                	sub    %eax,%edx
  1c09b3:	39 c1                	cmp    %eax,%ecx
  1c09b5:	b8 00 00 00 00       	mov    $0x0,%eax
  1c09ba:	0f 4f c2             	cmovg  %edx,%eax
  1c09bd:	89 45 a4             	mov    %eax,-0x5c(%rbp)
  1c09c0:	e9 69 fb ff ff       	jmpq   1c052e <printer::vprintf(int, char const*, __va_list_tag*)+0x2f2>
                   && datalen + (int) strlen(prefix) < width) {
  1c09c5:	48 8b 7d a8          	mov    -0x58(%rbp),%rdi
  1c09c9:	e8 42 f7 ff ff       	callq  1c0110 <strlen>
  1c09ce:	8b 75 a0             	mov    -0x60(%rbp),%esi
  1c09d1:	8d 14 06             	lea    (%rsi,%rax,1),%edx
            zeros = width - datalen - strlen(prefix);
  1c09d4:	8b 7d 98             	mov    -0x68(%rbp),%edi
  1c09d7:	89 f9                	mov    %edi,%ecx
  1c09d9:	29 f1                	sub    %esi,%ecx
  1c09db:	29 c1                	sub    %eax,%ecx
  1c09dd:	39 fa                	cmp    %edi,%edx
  1c09df:	b8 00 00 00 00       	mov    $0x0,%eax
  1c09e4:	0f 4c c1             	cmovl  %ecx,%eax
  1c09e7:	89 45 a4             	mov    %eax,-0x5c(%rbp)
  1c09ea:	e9 3f fb ff ff       	jmpq   1c052e <printer::vprintf(int, char const*, __va_list_tag*)+0x2f2>
  1c09ef:	49 89 cc             	mov    %rcx,%r12
            numbuf[0] = (*format ? *format : '%');
  1c09f2:	88 45 b8             	mov    %al,-0x48(%rbp)
            numbuf[1] = '\0';
  1c09f5:	c6 45 b9 00          	movb   $0x0,-0x47(%rbp)
            data = numbuf;
  1c09f9:	48 8d 5d b8          	lea    -0x48(%rbp),%rbx
        unsigned long num = 0;
  1c09fd:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  1c0a03:	e9 a4 fa ff ff       	jmpq   1c04ac <printer::vprintf(int, char const*, __va_list_tag*)+0x270>
        int flags = 0;
  1c0a08:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  1c0a0e:	e9 a4 f8 ff ff       	jmpq   1c02b7 <printer::vprintf(int, char const*, __va_list_tag*)+0x7b>
        switch (*format) {
  1c0a13:	8d 50 bd             	lea    -0x43(%rax),%edx
  1c0a16:	80 fa 35             	cmp    $0x35,%dl
  1c0a19:	77 d7                	ja     1c09f2 <printer::vprintf(int, char const*, __va_list_tag*)+0x7b6>
  1c0a1b:	0f b6 d2             	movzbl %dl,%edx
  1c0a1e:	3e ff 24 d5 20 12 1c 	notrack jmpq *0x1c1220(,%rdx,8)
  1c0a25:	00 
        }
    }
}
  1c0a26:	48 83 c4 58          	add    $0x58,%rsp
  1c0a2a:	5b                   	pop    %rbx
  1c0a2b:	41 5c                	pop    %r12
  1c0a2d:	41 5d                	pop    %r13
  1c0a2f:	41 5e                	pop    %r14
  1c0a31:	41 5f                	pop    %r15
  1c0a33:	5d                   	pop    %rbp
  1c0a34:	c3                   	retq   
  1c0a35:	90                   	nop

00000000001c0a36 <console_printer::console_printer(int, bool)>:
    void scroll();
    void move_cursor();
};

__noinline
console_printer::console_printer(int cpos, bool scroll)
  1c0a36:	f3 0f 1e fa          	endbr64 
    : cell_(console), scroll_(scroll) {
  1c0a3a:	48 c7 07 88 14 1c 00 	movq   $0x1c1488,(%rdi)
  1c0a41:	48 c7 47 08 00 80 0b 	movq   $0xb8000,0x8(%rdi)
  1c0a48:	00 
  1c0a49:	88 57 10             	mov    %dl,0x10(%rdi)
    if (cpos < 0) {
  1c0a4c:	85 f6                	test   %esi,%esi
  1c0a4e:	78 18                	js     1c0a68 <console_printer::console_printer(int, bool)+0x32>
        cell_ += cursorpos;
    } else if (cpos <= CONSOLE_ROWS * CONSOLE_COLUMNS) {
  1c0a50:	81 fe d0 07 00 00    	cmp    $0x7d0,%esi
  1c0a56:	7f 0f                	jg     1c0a67 <console_printer::console_printer(int, bool)+0x31>
        cell_ += cpos;
  1c0a58:	48 63 f6             	movslq %esi,%rsi
  1c0a5b:	48 8d 84 36 00 80 0b 	lea    0xb8000(%rsi,%rsi,1),%rax
  1c0a62:	00 
  1c0a63:	48 89 47 08          	mov    %rax,0x8(%rdi)
    }
}
  1c0a67:	c3                   	retq   
        cell_ += cursorpos;
  1c0a68:	8b 05 8e 85 ef ff    	mov    -0x107a72(%rip),%eax        # b8ffc <cursorpos>
  1c0a6e:	48 98                	cltq   
  1c0a70:	48 8d 84 00 00 80 0b 	lea    0xb8000(%rax,%rax,1),%rax
  1c0a77:	00 
  1c0a78:	48 89 47 08          	mov    %rax,0x8(%rdi)
  1c0a7c:	c3                   	retq   
  1c0a7d:	90                   	nop

00000000001c0a7e <console_printer::scroll()>:

__noinline
void console_printer::scroll() {
  1c0a7e:	f3 0f 1e fa          	endbr64 
  1c0a82:	55                   	push   %rbp
  1c0a83:	48 89 e5             	mov    %rsp,%rbp
  1c0a86:	53                   	push   %rbx
  1c0a87:	48 83 ec 08          	sub    $0x8,%rsp
    assert(cell_ >= console + CONSOLE_ROWS * CONSOLE_COLUMNS);
  1c0a8b:	48 81 7f 08 a0 8f 0b 	cmpq   $0xb8fa0,0x8(%rdi)
  1c0a92:	00 
  1c0a93:	72 18                	jb     1c0aad <console_printer::scroll()+0x2f>
  1c0a95:	48 89 fb             	mov    %rdi,%rbx
    if (scroll_) {
  1c0a98:	80 7f 10 00          	cmpb   $0x0,0x10(%rdi)
  1c0a9c:	75 28                	jne    1c0ac6 <console_printer::scroll()+0x48>
                (CONSOLE_ROWS - 1) * CONSOLE_COLUMNS * sizeof(*console));
        memset(console + (CONSOLE_ROWS - 1) * CONSOLE_COLUMNS,
               0, CONSOLE_COLUMNS * sizeof(*console));
        cell_ -= CONSOLE_COLUMNS;
    } else {
        cell_ = console;
  1c0a9e:	48 c7 47 08 00 80 0b 	movq   $0xb8000,0x8(%rdi)
  1c0aa5:	00 
    }
}
  1c0aa6:	48 83 c4 08          	add    $0x8,%rsp
  1c0aaa:	5b                   	pop    %rbx
  1c0aab:	5d                   	pop    %rbp
  1c0aac:	c3                   	retq   
    assert(cell_ >= console + CONSOLE_ROWS * CONSOLE_COLUMNS);
  1c0aad:	b9 00 00 00 00       	mov    $0x0,%ecx
  1c0ab2:	ba 18 14 1c 00       	mov    $0x1c1418,%edx
  1c0ab7:	be 2c 02 00 00       	mov    $0x22c,%esi
  1c0abc:	bf fb 0c 1c 00       	mov    $0x1c0cfb,%edi
  1c0ac1:	e8 c9 01 00 00       	callq  1c0c8f <assert_fail(char const*, int, char const*, char const*)>
        memmove(console, console + CONSOLE_COLUMNS,
  1c0ac6:	ba 00 0f 00 00       	mov    $0xf00,%edx
  1c0acb:	be a0 80 0b 00       	mov    $0xb80a0,%esi
  1c0ad0:	bf 00 80 0b 00       	mov    $0xb8000,%edi
  1c0ad5:	e8 c9 f5 ff ff       	callq  1c00a3 <memmove>
        memset(console + (CONSOLE_ROWS - 1) * CONSOLE_COLUMNS,
  1c0ada:	ba a0 00 00 00       	mov    $0xa0,%edx
  1c0adf:	be 00 00 00 00       	mov    $0x0,%esi
  1c0ae4:	bf 00 8f 0b 00       	mov    $0xb8f00,%edi
  1c0ae9:	e8 02 f6 ff ff       	callq  1c00f0 <memset>
        cell_ -= CONSOLE_COLUMNS;
  1c0aee:	48 81 6b 08 a0 00 00 	subq   $0xa0,0x8(%rbx)
  1c0af5:	00 
  1c0af6:	eb ae                	jmp    1c0aa6 <console_printer::scroll()+0x28>

00000000001c0af8 <console_printer::putc(unsigned char, int)>:
    extern void console_show_cursor(int);
    console_show_cursor(cursorpos);
#endif
}

inline void console_printer::putc(unsigned char c, int color) {
  1c0af8:	f3 0f 1e fa          	endbr64 
  1c0afc:	55                   	push   %rbp
  1c0afd:	48 89 e5             	mov    %rsp,%rbp
  1c0b00:	41 55                	push   %r13
  1c0b02:	41 54                	push   %r12
  1c0b04:	53                   	push   %rbx
  1c0b05:	48 83 ec 08          	sub    $0x8,%rsp
  1c0b09:	48 89 fb             	mov    %rdi,%rbx
  1c0b0c:	41 89 f5             	mov    %esi,%r13d
  1c0b0f:	41 89 d4             	mov    %edx,%r12d
    while (cell_ >= console + CONSOLE_ROWS * CONSOLE_COLUMNS) {
  1c0b12:	48 8b 47 08          	mov    0x8(%rdi),%rax
  1c0b16:	48 3d a0 8f 0b 00    	cmp    $0xb8fa0,%rax
  1c0b1c:	72 14                	jb     1c0b32 <console_printer::putc(unsigned char, int)+0x3a>
        scroll();
  1c0b1e:	48 89 df             	mov    %rbx,%rdi
  1c0b21:	e8 58 ff ff ff       	callq  1c0a7e <console_printer::scroll()>
    while (cell_ >= console + CONSOLE_ROWS * CONSOLE_COLUMNS) {
  1c0b26:	48 8b 43 08          	mov    0x8(%rbx),%rax
  1c0b2a:	48 3d a0 8f 0b 00    	cmp    $0xb8fa0,%rax
  1c0b30:	73 ec                	jae    1c0b1e <console_printer::putc(unsigned char, int)+0x26>
    }
    if (c == '\n') {
  1c0b32:	41 80 fd 0a          	cmp    $0xa,%r13b
  1c0b36:	74 1e                	je     1c0b56 <console_printer::putc(unsigned char, int)+0x5e>
        while (pos != 80) {
            *cell_++ = ' ' | color;
            ++pos;
        }
    } else {
        *cell_++ = c | color;
  1c0b38:	48 8d 50 02          	lea    0x2(%rax),%rdx
  1c0b3c:	48 89 53 08          	mov    %rdx,0x8(%rbx)
  1c0b40:	45 0f b6 ed          	movzbl %r13b,%r13d
  1c0b44:	45 09 ec             	or     %r13d,%r12d
  1c0b47:	66 44 89 20          	mov    %r12w,(%rax)
    }
}
  1c0b4b:	48 83 c4 08          	add    $0x8,%rsp
  1c0b4f:	5b                   	pop    %rbx
  1c0b50:	41 5c                	pop    %r12
  1c0b52:	41 5d                	pop    %r13
  1c0b54:	5d                   	pop    %rbp
  1c0b55:	c3                   	retq   
        int pos = (cell_ - console) % 80;
  1c0b56:	48 2d 00 80 0b 00    	sub    $0xb8000,%rax
  1c0b5c:	48 89 c1             	mov    %rax,%rcx
  1c0b5f:	48 89 c6             	mov    %rax,%rsi
  1c0b62:	48 d1 fe             	sar    %rsi
  1c0b65:	48 ba 67 66 66 66 66 	movabs $0x6666666666666667,%rdx
  1c0b6c:	66 66 66 
  1c0b6f:	48 89 f0             	mov    %rsi,%rax
  1c0b72:	48 f7 ea             	imul   %rdx
  1c0b75:	48 c1 fa 05          	sar    $0x5,%rdx
  1c0b79:	48 89 c8             	mov    %rcx,%rax
  1c0b7c:	48 c1 f8 3f          	sar    $0x3f,%rax
  1c0b80:	48 29 c2             	sub    %rax,%rdx
  1c0b83:	48 8d 04 92          	lea    (%rdx,%rdx,4),%rax
  1c0b87:	48 c1 e0 04          	shl    $0x4,%rax
  1c0b8b:	89 f2                	mov    %esi,%edx
  1c0b8d:	29 c2                	sub    %eax,%edx
  1c0b8f:	89 d0                	mov    %edx,%eax
            *cell_++ = ' ' | color;
  1c0b91:	41 83 cc 20          	or     $0x20,%r12d
  1c0b95:	48 8b 4b 08          	mov    0x8(%rbx),%rcx
  1c0b99:	48 8d 71 02          	lea    0x2(%rcx),%rsi
  1c0b9d:	48 89 73 08          	mov    %rsi,0x8(%rbx)
  1c0ba1:	66 44 89 21          	mov    %r12w,(%rcx)
            ++pos;
  1c0ba5:	83 c0 01             	add    $0x1,%eax
        while (pos != 80) {
  1c0ba8:	83 f8 50             	cmp    $0x50,%eax
  1c0bab:	75 e8                	jne    1c0b95 <console_printer::putc(unsigned char, int)+0x9d>
  1c0bad:	eb 9c                	jmp    1c0b4b <console_printer::putc(unsigned char, int)+0x53>
  1c0baf:	90                   	nop

00000000001c0bb0 <console_printer::move_cursor()>:
void console_printer::move_cursor() {
  1c0bb0:	f3 0f 1e fa          	endbr64 
    cursorpos = cell_ - console;
  1c0bb4:	48 8b 47 08          	mov    0x8(%rdi),%rax
  1c0bb8:	48 2d 00 80 0b 00    	sub    $0xb8000,%rax
  1c0bbe:	48 d1 f8             	sar    %rax
  1c0bc1:	89 05 35 84 ef ff    	mov    %eax,-0x107bcb(%rip)        # b8ffc <cursorpos>
}
  1c0bc7:	c3                   	retq   

00000000001c0bc8 <console_vprintf(int, int, char const*, __va_list_tag*)>:

// console_vprintf, console_printf
//    Print a message onto the console, starting at the given cursor position.

__noinline
int console_vprintf(int cpos, int color, const char* format, va_list val) {
  1c0bc8:	f3 0f 1e fa          	endbr64 
  1c0bcc:	55                   	push   %rbp
  1c0bcd:	48 89 e5             	mov    %rsp,%rbp
  1c0bd0:	41 56                	push   %r14
  1c0bd2:	41 55                	push   %r13
  1c0bd4:	41 54                	push   %r12
  1c0bd6:	53                   	push   %rbx
  1c0bd7:	48 83 ec 20          	sub    $0x20,%rsp
  1c0bdb:	89 fb                	mov    %edi,%ebx
  1c0bdd:	41 89 f4             	mov    %esi,%r12d
  1c0be0:	49 89 d5             	mov    %rdx,%r13
  1c0be3:	49 89 ce             	mov    %rcx,%r14
    console_printer cp(cpos, cpos < 0);
  1c0be6:	89 fa                	mov    %edi,%edx
  1c0be8:	c1 ea 1f             	shr    $0x1f,%edx
  1c0beb:	89 fe                	mov    %edi,%esi
  1c0bed:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
  1c0bf1:	e8 40 fe ff ff       	callq  1c0a36 <console_printer::console_printer(int, bool)>
    cp.vprintf(color, format, val);
  1c0bf6:	4c 89 f1             	mov    %r14,%rcx
  1c0bf9:	4c 89 ea             	mov    %r13,%rdx
  1c0bfc:	44 89 e6             	mov    %r12d,%esi
  1c0bff:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
  1c0c03:	e8 34 f6 ff ff       	callq  1c023c <printer::vprintf(int, char const*, __va_list_tag*)>
    if (cpos < 0) {
  1c0c08:	85 db                	test   %ebx,%ebx
  1c0c0a:	78 1a                	js     1c0c26 <console_vprintf(int, int, char const*, __va_list_tag*)+0x5e>
        cp.move_cursor();
    }
    return cp.cell_ - console;
  1c0c0c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  1c0c10:	48 2d 00 80 0b 00    	sub    $0xb8000,%rax
  1c0c16:	48 d1 f8             	sar    %rax
}
  1c0c19:	48 83 c4 20          	add    $0x20,%rsp
  1c0c1d:	5b                   	pop    %rbx
  1c0c1e:	41 5c                	pop    %r12
  1c0c20:	41 5d                	pop    %r13
  1c0c22:	41 5e                	pop    %r14
  1c0c24:	5d                   	pop    %rbp
  1c0c25:	c3                   	retq   
        cp.move_cursor();
  1c0c26:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
  1c0c2a:	e8 81 ff ff ff       	callq  1c0bb0 <console_printer::move_cursor()>
  1c0c2f:	eb db                	jmp    1c0c0c <console_vprintf(int, int, char const*, __va_list_tag*)+0x44>

00000000001c0c31 <error_printf(char const*, ...)>:
    error_vprintf(-1, color, format, val);
    va_end(val);
}

__noinline
void error_printf(const char* format, ...) {
  1c0c31:	f3 0f 1e fa          	endbr64 
  1c0c35:	55                   	push   %rbp
  1c0c36:	48 89 e5             	mov    %rsp,%rbp
  1c0c39:	48 83 ec 50          	sub    $0x50,%rsp
  1c0c3d:	48 89 75 d8          	mov    %rsi,-0x28(%rbp)
  1c0c41:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  1c0c45:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  1c0c49:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
  1c0c4d:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
  1c0c51:	c7 45 b8 08 00 00 00 	movl   $0x8,-0x48(%rbp)
  1c0c58:	48 8d 45 10          	lea    0x10(%rbp),%rax
  1c0c5c:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  1c0c60:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  1c0c64:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    error_vprintf(-1, COLOR_ERROR, format, val);
  1c0c68:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
  1c0c6c:	48 89 fa             	mov    %rdi,%rdx
  1c0c6f:	be 00 c0 00 00       	mov    $0xc000,%esi
  1c0c74:	bf ff ff ff ff       	mov    $0xffffffff,%edi
  1c0c79:	e8 02 00 00 00       	callq  1c0c80 <error_vprintf(int, int, char const*, __va_list_tag*)>
    va_end(val);
}
  1c0c7e:	c9                   	leaveq 
  1c0c7f:	c3                   	retq   

00000000001c0c80 <error_vprintf(int, int, char const*, __va_list_tag*)>:
    }
    (void) console_printf(CPOS(23, 0), 0xC000, "%s", buf);
    sys_panic(nullptr);
}

int error_vprintf(int cpos, int color, const char* format, va_list val) {
  1c0c80:	f3 0f 1e fa          	endbr64 
  1c0c84:	55                   	push   %rbp
  1c0c85:	48 89 e5             	mov    %rsp,%rbp
    return console_vprintf(cpos, color, format, val);
  1c0c88:	e8 3b ff ff ff       	callq  1c0bc8 <console_vprintf(int, int, char const*, __va_list_tag*)>
}
  1c0c8d:	5d                   	pop    %rbp
  1c0c8e:	c3                   	retq   

00000000001c0c8f <assert_fail(char const*, int, char const*, char const*)>:

void assert_fail(const char* file, int line, const char* msg,
                 const char* description) {
  1c0c8f:	f3 0f 1e fa          	endbr64 
  1c0c93:	55                   	push   %rbp
  1c0c94:	48 89 e5             	mov    %rsp,%rbp
  1c0c97:	41 55                	push   %r13
  1c0c99:	41 54                	push   %r12
  1c0c9b:	53                   	push   %rbx
  1c0c9c:	48 83 ec 08          	sub    $0x8,%rsp
  1c0ca0:	48 89 fb             	mov    %rdi,%rbx
  1c0ca3:	41 89 f4             	mov    %esi,%r12d
  1c0ca6:	49 89 d5             	mov    %rdx,%r13
    cursorpos = CPOS(23, 0);
  1c0ca9:	c7 05 49 83 ef ff 30 	movl   $0x730,-0x107cb7(%rip)        # b8ffc <cursorpos>
  1c0cb0:	07 00 00 
    if (description) {
  1c0cb3:	48 85 c9             	test   %rcx,%rcx
  1c0cb6:	74 11                	je     1c0cc9 <assert_fail(char const*, int, char const*, char const*)+0x3a>
        error_printf("%s:%d: %s\n", file, line, description);
  1c0cb8:	89 f2                	mov    %esi,%edx
  1c0cba:	48 89 fe             	mov    %rdi,%rsi
  1c0cbd:	bf 9b 14 1c 00       	mov    $0x1c149b,%edi
  1c0cc2:	b0 00                	mov    $0x0,%al
  1c0cc4:	e8 68 ff ff ff       	callq  1c0c31 <error_printf(char const*, ...)>
    }
    error_printf("%s:%d: user assertion '%s' failed\n", file, line, msg);
  1c0cc9:	4c 89 e9             	mov    %r13,%rcx
  1c0ccc:	44 89 e2             	mov    %r12d,%edx
  1c0ccf:	48 89 de             	mov    %rbx,%rsi
  1c0cd2:	bf a8 14 1c 00       	mov    $0x1c14a8,%edi
  1c0cd7:	b0 00                	mov    $0x0,%al
  1c0cd9:	e8 53 ff ff ff       	callq  1c0c31 <error_printf(char const*, ...)>
    register uintptr_t rax asm("rax") = syscallno;
  1c0cde:	b8 03 00 00 00       	mov    $0x3,%eax
            : "cc", "memory", "rcx", "rdx", "rsi", "r8", "r9", "r10", "r11");
  1c0ce3:	bf 00 00 00 00       	mov    $0x0,%edi
  1c0ce8:	0f 05                	syscall 
//    Panic.
[[noreturn]] inline void sys_panic(const char* msg) {
    make_syscall(SYSCALL_PANIC, (uintptr_t) msg);

    // should never get here
    while (true) {
  1c0cea:	eb fe                	jmp    1c0cea <assert_fail(char const*, int, char const*, char const*)+0x5b>

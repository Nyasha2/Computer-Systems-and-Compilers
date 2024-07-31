
obj/p-fork.full:     file format elf64-x86-64


Disassembly of section .text:

0000000000100000 <process_main()>:
    int field2;
};
const test_struct test1 = {61, {0}, 6161};
test_struct test2;

void process_main() {
  100000:	f3 0f 1e fa          	endbr64 
  100004:	55                   	push   %rbp
  100005:	48 89 e5             	mov    %rsp,%rbp
  100008:	41 56                	push   %r14
  10000a:	41 55                	push   %r13
  10000c:	41 54                	push   %r12
  10000e:	53                   	push   %rbx
// make_syscall
//    These functions define the WeensyOS system call calling convention.
//    We provide versions for system calls with 0-2 arguments.

__always_inline uintptr_t make_syscall(int syscallno) {
    register uintptr_t rax asm("rax") = syscallno;
  10000f:	b8 01 00 00 00       	mov    $0x1,%eax
    asm volatile ("syscall"
            : "+a" (rax)
            : /* all input registers are also output registers */
            : "cc", "memory", "rcx", "rdx", "rsi", "rdi", "r8", "r9",
              "r10", "r11");
  100014:	0f 05                	syscall 
    return rax;
  100016:	49 89 c4             	mov    %rax,%r12
    pid_t initial_pid = sys_getpid();
    test2.field1 = 61;
  100019:	c7 05 dd 1f 00 00 3d 	movl   $0x3d,0x1fdd(%rip)        # 102000 <test2>
  100020:	00 00 00 
    register uintptr_t rax asm("rax") = syscallno;
  100023:	b8 05 00 00 00       	mov    $0x5,%eax
              "r10", "r11");
  100028:	0f 05                	syscall 
    return rax;
  10002a:	49 89 c6             	mov    %rax,%r14
    register uintptr_t rax asm("rax") = syscallno;
  10002d:	b8 01 00 00 00       	mov    $0x1,%eax
              "r10", "r11");
  100032:	0f 05                	syscall 
    return rax;
  100034:	48 89 c3             	mov    %rax,%rbx
    assert(test1.field1 == 61 && test1.field2 == 6161);

    // Fork a total of three new copies, checking `fork` return values.
    pid_t p1 = sys_fork();
    pid_t intermediate_pid = sys_getpid();
    if (p1 == 0) {
  100037:	45 85 f6             	test   %r14d,%r14d
  10003a:	0f 85 b5 00 00 00    	jne    1000f5 <process_main()+0xf5>
        assert(intermediate_pid != initial_pid);
  100040:	41 39 c4             	cmp    %eax,%r12d
  100043:	0f 84 93 00 00 00    	je     1000dc <process_main()+0xdc>
    register uintptr_t rax asm("rax") = syscallno;
  100049:	b8 05 00 00 00       	mov    $0x5,%eax
              "r10", "r11");
  10004e:	0f 05                	syscall 
    return rax;
  100050:	49 89 c5             	mov    %rax,%r13
    register uintptr_t rax asm("rax") = syscallno;
  100053:	b8 01 00 00 00       	mov    $0x1,%eax
              "r10", "r11");
  100058:	0f 05                	syscall 
        assert(intermediate_pid == initial_pid && p1 != initial_pid);
    }

    pid_t p2 = sys_fork();
    pid_t final_pid = sys_getpid();
    if (p2 == 0) {
  10005a:	45 85 ed             	test   %r13d,%r13d
  10005d:	0f 85 d2 00 00 00    	jne    100135 <process_main()+0x135>
        assert(final_pid != initial_pid && final_pid != intermediate_pid);
  100063:	41 39 c4             	cmp    %eax,%r12d
  100066:	0f 84 b0 00 00 00    	je     10011c <process_main()+0x11c>
  10006c:	39 c3                	cmp    %eax,%ebx
  10006e:	0f 84 a8 00 00 00    	je     10011c <process_main()+0x11c>
        assert(final_pid == intermediate_pid);
    }

    // Check that multi-page segments can be loaded.
    assert(test1.field1 == 61 && test1.field2 == 6161);
    assert(test2.field1 == 61);
  100074:	83 3d 85 1f 00 00 3d 	cmpl   $0x3d,0x1f85(%rip)        # 102000 <test2>
  10007b:	0f 85 03 01 00 00    	jne    100184 <process_main()+0x184>
    test2.field2 = 61 + final_pid;
  100081:	8d 58 3d             	lea    0x3d(%rax),%ebx
  100084:	89 1d 7a 2f 00 00    	mov    %ebx,0x2f7a(%rip)        # 103004 <test2+0x1004>
    register uintptr_t rax asm("rax") = syscallno;
  10008a:	b8 02 00 00 00       	mov    $0x2,%eax
              "r10", "r11");
  10008f:	0f 05                	syscall 
    sys_yield();
    assert(test2.field2 == 61 + final_pid);
  100091:	3b 1d 6d 2f 00 00    	cmp    0x2f6d(%rip),%ebx        # 103004 <test2+0x1004>
  100097:	0f 85 00 01 00 00    	jne    10019d <process_main()+0x19d>
    register uintptr_t rax asm("rax") = syscallno;
  10009d:	b8 01 00 00 00       	mov    $0x1,%eax
              "r10", "r11");
  1000a2:	0f 05                	syscall 
    return rax;
  1000a4:	48 89 c3             	mov    %rax,%rbx


// sys_getpid
//    Return current process ID.
inline pid_t sys_getpid() {
    return make_syscall(SYSCALL_GETPID);
  1000a7:	41 89 c4             	mov    %eax,%r12d

    // The rest of this code is like p-allocator.c.

    pid_t p = sys_getpid();
    srand(p);
  1000aa:	89 c7                	mov    %eax,%edi
  1000ac:	e8 8c 02 00 00       	callq  10033d <srand(unsigned int)>
//    Return the smallest multiple of `m` greater than or equal to `x`.
//    Equivalently, round `x` up to the nearest multiple of `m`.
template <typename T>
inline constexpr T round_up(T x, unsigned m) {
    static_assert(std::is_unsigned<T>::value, "T must be unsigned");
    return round_down(x + m - 1, m);
  1000b1:	b8 23 40 10 00       	mov    $0x104023,%eax

    heap_top = (uint8_t*) round_up((uintptr_t) end, PAGESIZE);
  1000b6:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  1000bc:	48 89 05 4d 2f 00 00 	mov    %rax,0x2f4d(%rip)        # 103010 <heap_top>
    return x;
}

__always_inline uintptr_t rdrsp() {
    uintptr_t x;
    asm volatile("movq %%rsp, %0" : "=r" (x));
  1000c3:	48 89 e0             	mov    %rsp,%rax
    stack_bottom = (uint8_t*) round_down((uintptr_t) rdrsp() - 1, PAGESIZE);
  1000c6:	48 83 e8 01          	sub    $0x1,%rax
  1000ca:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  1000d0:	48 89 05 31 2f 00 00 	mov    %rax,0x2f31(%rip)        # 103008 <stack_bottom>
  1000d7:	e9 e1 00 00 00       	jmpq   1001bd <process_main()+0x1bd>
        assert(intermediate_pid != initial_pid);
  1000dc:	b9 00 00 00 00       	mov    $0x0,%ecx
  1000e1:	ba 60 0e 10 00       	mov    $0x100e60,%edx
  1000e6:	be 1d 00 00 00       	mov    $0x1d,%esi
  1000eb:	bf 4f 0f 10 00       	mov    $0x100f4f,%edi
  1000f0:	e8 0a 0d 00 00       	callq  100dff <assert_fail(char const*, int, char const*, char const*)>
        assert(intermediate_pid == initial_pid && p1 != initial_pid);
  1000f5:	41 39 c4             	cmp    %eax,%r12d
  1000f8:	75 09                	jne    100103 <process_main()+0x103>
  1000fa:	45 39 f4             	cmp    %r14d,%r12d
  1000fd:	0f 85 46 ff ff ff    	jne    100049 <process_main()+0x49>
  100103:	b9 00 00 00 00       	mov    $0x0,%ecx
  100108:	ba 80 0e 10 00       	mov    $0x100e80,%edx
  10010d:	be 1f 00 00 00       	mov    $0x1f,%esi
  100112:	bf 4f 0f 10 00       	mov    $0x100f4f,%edi
  100117:	e8 e3 0c 00 00       	callq  100dff <assert_fail(char const*, int, char const*, char const*)>
        assert(final_pid != initial_pid && final_pid != intermediate_pid);
  10011c:	b9 00 00 00 00       	mov    $0x0,%ecx
  100121:	ba b8 0e 10 00       	mov    $0x100eb8,%edx
  100126:	be 25 00 00 00       	mov    $0x25,%esi
  10012b:	bf 4f 0f 10 00       	mov    $0x100f4f,%edi
  100130:	e8 ca 0c 00 00       	callq  100dff <assert_fail(char const*, int, char const*, char const*)>
        assert(p2 != p1 && p2 != intermediate_pid && p2 != initial_pid);
  100135:	45 39 ee             	cmp    %r13d,%r14d
  100138:	0f 94 c1             	sete   %cl
  10013b:	44 39 eb             	cmp    %r13d,%ebx
  10013e:	0f 94 c2             	sete   %dl
  100141:	08 d1                	or     %dl,%cl
  100143:	75 26                	jne    10016b <process_main()+0x16b>
  100145:	45 39 ec             	cmp    %r13d,%r12d
  100148:	74 21                	je     10016b <process_main()+0x16b>
        assert(final_pid == intermediate_pid);
  10014a:	39 c3                	cmp    %eax,%ebx
  10014c:	0f 84 22 ff ff ff    	je     100074 <process_main()+0x74>
  100152:	b9 00 00 00 00       	mov    $0x0,%ecx
  100157:	ba 59 0f 10 00       	mov    $0x100f59,%edx
  10015c:	be 28 00 00 00       	mov    $0x28,%esi
  100161:	bf 4f 0f 10 00       	mov    $0x100f4f,%edi
  100166:	e8 94 0c 00 00       	callq  100dff <assert_fail(char const*, int, char const*, char const*)>
        assert(p2 != p1 && p2 != intermediate_pid && p2 != initial_pid);
  10016b:	b9 00 00 00 00       	mov    $0x0,%ecx
  100170:	ba f8 0e 10 00       	mov    $0x100ef8,%edx
  100175:	be 27 00 00 00       	mov    $0x27,%esi
  10017a:	bf 4f 0f 10 00       	mov    $0x100f4f,%edi
  10017f:	e8 7b 0c 00 00       	callq  100dff <assert_fail(char const*, int, char const*, char const*)>
    assert(test2.field1 == 61);
  100184:	b9 00 00 00 00       	mov    $0x0,%ecx
  100189:	ba 77 0f 10 00       	mov    $0x100f77,%edx
  10018e:	be 2d 00 00 00       	mov    $0x2d,%esi
  100193:	bf 4f 0f 10 00       	mov    $0x100f4f,%edi
  100198:	e8 62 0c 00 00       	callq  100dff <assert_fail(char const*, int, char const*, char const*)>
    assert(test2.field2 == 61 + final_pid);
  10019d:	b9 00 00 00 00       	mov    $0x0,%ecx
  1001a2:	ba 30 0f 10 00       	mov    $0x100f30,%edx
  1001a7:	be 30 00 00 00       	mov    $0x30,%esi
  1001ac:	bf 4f 0f 10 00       	mov    $0x100f4f,%edi
  1001b1:	e8 49 0c 00 00       	callq  100dff <assert_fail(char const*, int, char const*, char const*)>
    register uintptr_t rax asm("rax") = syscallno;
  1001b6:	b8 02 00 00 00       	mov    $0x2,%eax
              "r10", "r11");
  1001bb:	0f 05                	syscall 

    while (true) {
#if !NO_SLOWDOWN
        if (rand(0, ALLOC_SLOWDOWN - 1) < p) {
  1001bd:	be 63 00 00 00       	mov    $0x63,%esi
  1001c2:	bf 00 00 00 00       	mov    $0x0,%edi
  1001c7:	e8 90 01 00 00       	callq  10035c <rand(int, int)>
  1001cc:	44 39 e0             	cmp    %r12d,%eax
  1001cf:	7d e5                	jge    1001b6 <process_main()+0x1b6>
#else
        for (int i = 0; i < p; i++) {
#endif
            if (heap_top == stack_bottom
  1001d1:	48 8b 3d 38 2e 00 00 	mov    0x2e38(%rip),%rdi        # 103010 <heap_top>
                || sys_page_alloc(heap_top) < 0) {
  1001d8:	48 3b 3d 29 2e 00 00 	cmp    0x2e29(%rip),%rdi        # 103008 <stack_bottom>
  1001df:	74 28                	je     100209 <process_main()+0x209>
    register uintptr_t rax asm("rax") = syscallno;
  1001e1:	b8 04 00 00 00       	mov    $0x4,%eax
            : "cc", "memory", "rcx", "rdx", "rsi", "r8", "r9", "r10", "r11");
  1001e6:	0f 05                	syscall 
  1001e8:	85 c0                	test   %eax,%eax
  1001ea:	78 1d                	js     100209 <process_main()+0x209>
                break;
            }
            *heap_top = p;               // check we can write to new page
  1001ec:	48 8b 05 1d 2e 00 00 	mov    0x2e1d(%rip),%rax        # 103010 <heap_top>
  1001f3:	88 18                	mov    %bl,(%rax)
            console[CPOS(24, 79)] = p;   // check we can write to console
  1001f5:	66 89 1d a2 8d fb ff 	mov    %bx,-0x4725e(%rip)        # b8f9e <console+0xf9e>
            heap_top += PAGESIZE;
  1001fc:	48 81 05 09 2e 00 00 	addq   $0x1000,0x2e09(%rip)        # 103010 <heap_top>
  100203:	00 10 00 00 
  100207:	eb ad                	jmp    1001b6 <process_main()+0x1b6>
    register uintptr_t rax asm("rax") = syscallno;
  100209:	b8 02 00 00 00       	mov    $0x2,%eax
              "r10", "r11");
  10020e:	0f 05                	syscall 
    return rax;
  100210:	eb f7                	jmp    100209 <process_main()+0x209>

0000000000100212 <memmove>:
        *d = *s;
    }
    return dst;
}

void* memmove(void* dst, const void* src, size_t n) {
  100212:	f3 0f 1e fa          	endbr64 
  100216:	48 89 f8             	mov    %rdi,%rax
    const char* s = (const char*) src;
    char* d = (char*) dst;
    if (s < d && s + n > d) {
  100219:	48 39 fe             	cmp    %rdi,%rsi
  10021c:	73 09                	jae    100227 <memmove+0x15>
  10021e:	48 8d 0c 16          	lea    (%rsi,%rdx,1),%rcx
  100222:	48 39 cf             	cmp    %rcx,%rdi
  100225:	72 1d                	jb     100244 <memmove+0x32>
        s += n, d += n;
        while (n-- > 0) {
            *--d = *--s;
        }
    } else {
        while (n-- > 0) {
  100227:	b9 00 00 00 00       	mov    $0x0,%ecx
  10022c:	48 85 d2             	test   %rdx,%rdx
  10022f:	74 12                	je     100243 <memmove+0x31>
            *d++ = *s++;
  100231:	0f b6 3c 0e          	movzbl (%rsi,%rcx,1),%edi
  100235:	40 88 3c 08          	mov    %dil,(%rax,%rcx,1)
        while (n-- > 0) {
  100239:	48 83 c1 01          	add    $0x1,%rcx
  10023d:	48 39 d1             	cmp    %rdx,%rcx
  100240:	75 ef                	jne    100231 <memmove+0x1f>
        }
    }
    return dst;
}
  100242:	c3                   	retq   
  100243:	c3                   	retq   
        while (n-- > 0) {
  100244:	48 8d 4a ff          	lea    -0x1(%rdx),%rcx
  100248:	48 85 d2             	test   %rdx,%rdx
  10024b:	74 f5                	je     100242 <memmove+0x30>
            *--d = *--s;
  10024d:	0f b6 14 0e          	movzbl (%rsi,%rcx,1),%edx
  100251:	88 14 08             	mov    %dl,(%rax,%rcx,1)
        while (n-- > 0) {
  100254:	48 83 e9 01          	sub    $0x1,%rcx
  100258:	48 83 f9 ff          	cmp    $0xffffffffffffffff,%rcx
  10025c:	75 ef                	jne    10024d <memmove+0x3b>
  10025e:	c3                   	retq   

000000000010025f <memset>:

void* memset(void* v, int c, size_t n) {
  10025f:	f3 0f 1e fa          	endbr64 
  100263:	48 89 f8             	mov    %rdi,%rax
    for (char* p = (char*) v; n > 0; ++p, --n) {
  100266:	48 85 d2             	test   %rdx,%rdx
  100269:	74 13                	je     10027e <memset+0x1f>
  10026b:	48 8d 0c 17          	lea    (%rdi,%rdx,1),%rcx
  10026f:	48 89 fa             	mov    %rdi,%rdx
        *p = c;
  100272:	40 88 32             	mov    %sil,(%rdx)
    for (char* p = (char*) v; n > 0; ++p, --n) {
  100275:	48 83 c2 01          	add    $0x1,%rdx
  100279:	48 39 d1             	cmp    %rdx,%rcx
  10027c:	75 f4                	jne    100272 <memset+0x13>
    }
    return v;
}
  10027e:	c3                   	retq   

000000000010027f <strlen>:
        }
    }
    return nullptr;
}

size_t strlen(const char* s) {
  10027f:	f3 0f 1e fa          	endbr64 
    size_t n;
    for (n = 0; *s != '\0'; ++s) {
  100283:	80 3f 00             	cmpb   $0x0,(%rdi)
  100286:	74 10                	je     100298 <strlen+0x19>
  100288:	b8 00 00 00 00       	mov    $0x0,%eax
        ++n;
  10028d:	48 83 c0 01          	add    $0x1,%rax
    for (n = 0; *s != '\0'; ++s) {
  100291:	80 3c 07 00          	cmpb   $0x0,(%rdi,%rax,1)
  100295:	75 f6                	jne    10028d <strlen+0xe>
  100297:	c3                   	retq   
  100298:	b8 00 00 00 00       	mov    $0x0,%eax
    }
    return n;
}
  10029d:	c3                   	retq   

000000000010029e <strnlen>:

size_t strnlen(const char* s, size_t maxlen) {
  10029e:	f3 0f 1e fa          	endbr64 
    size_t n;
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
  1002a2:	48 85 f6             	test   %rsi,%rsi
  1002a5:	74 15                	je     1002bc <strnlen+0x1e>
  1002a7:	b8 00 00 00 00       	mov    $0x0,%eax
  1002ac:	80 3c 07 00          	cmpb   $0x0,(%rdi,%rax,1)
  1002b0:	74 0d                	je     1002bf <strnlen+0x21>
        ++n;
  1002b2:	48 83 c0 01          	add    $0x1,%rax
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
  1002b6:	48 39 c6             	cmp    %rax,%rsi
  1002b9:	75 f1                	jne    1002ac <strnlen+0xe>
  1002bb:	c3                   	retq   
  1002bc:	48 89 f0             	mov    %rsi,%rax
    }
    return n;
}
  1002bf:	c3                   	retq   

00000000001002c0 <strchr>:
        }
        ++a, ++b, --n;
    }
}

char* strchr(const char* s, int c) {
  1002c0:	f3 0f 1e fa          	endbr64 
    while (*s && *s != (char) c) {
  1002c4:	0f b6 07             	movzbl (%rdi),%eax
  1002c7:	84 c0                	test   %al,%al
  1002c9:	74 10                	je     1002db <strchr+0x1b>
  1002cb:	40 38 f0             	cmp    %sil,%al
  1002ce:	74 18                	je     1002e8 <strchr+0x28>
        ++s;
  1002d0:	48 83 c7 01          	add    $0x1,%rdi
    while (*s && *s != (char) c) {
  1002d4:	0f b6 07             	movzbl (%rdi),%eax
  1002d7:	84 c0                	test   %al,%al
  1002d9:	75 f0                	jne    1002cb <strchr+0xb>
    }
    if (*s == (char) c) {
        return (char*) s;
    } else {
        return nullptr;
  1002db:	40 84 f6             	test   %sil,%sil
  1002de:	b8 00 00 00 00       	mov    $0x0,%eax
  1002e3:	48 0f 44 c7          	cmove  %rdi,%rax
  1002e7:	c3                   	retq   
  1002e8:	48 89 f8             	mov    %rdi,%rax
    }
}
  1002eb:	c3                   	retq   

00000000001002ec <rand()>:
// rand, srand

static int rand_seed_set;
static unsigned long rand_seed;

int rand() {
  1002ec:	f3 0f 1e fa          	endbr64 
    if (!rand_seed_set) {
  1002f0:	83 3d 29 2d 00 00 00 	cmpl   $0x0,0x2d29(%rip)        # 103020 <rand_seed_set>
  1002f7:	74 27                	je     100320 <rand()+0x34>
        srand(819234718U);
    }
    rand_seed = rand_seed * 6364136223846793005UL + 1;
  1002f9:	48 b8 2d 7f 95 4c 2d 	movabs $0x5851f42d4c957f2d,%rax
  100300:	f4 51 58 
  100303:	48 0f af 05 0d 2d 00 	imul   0x2d0d(%rip),%rax        # 103018 <rand_seed>
  10030a:	00 
  10030b:	48 83 c0 01          	add    $0x1,%rax
  10030f:	48 89 05 02 2d 00 00 	mov    %rax,0x2d02(%rip)        # 103018 <rand_seed>
    return (rand_seed >> 32) & RAND_MAX;
  100316:	48 c1 e8 20          	shr    $0x20,%rax
  10031a:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
}
  10031f:	c3                   	retq   

void srand(unsigned seed) {
    rand_seed = ((unsigned long) seed << 32) | seed;
  100320:	48 b8 9e 87 d4 30 9e 	movabs $0x30d4879e30d4879e,%rax
  100327:	87 d4 30 
  10032a:	48 89 05 e7 2c 00 00 	mov    %rax,0x2ce7(%rip)        # 103018 <rand_seed>
    rand_seed_set = 1;
  100331:	c7 05 e5 2c 00 00 01 	movl   $0x1,0x2ce5(%rip)        # 103020 <rand_seed_set>
  100338:	00 00 00 
}
  10033b:	eb bc                	jmp    1002f9 <rand()+0xd>

000000000010033d <srand(unsigned int)>:
void srand(unsigned seed) {
  10033d:	f3 0f 1e fa          	endbr64 
    rand_seed = ((unsigned long) seed << 32) | seed;
  100341:	89 f8                	mov    %edi,%eax
  100343:	48 c1 e7 20          	shl    $0x20,%rdi
  100347:	48 09 c7             	or     %rax,%rdi
  10034a:	48 89 3d c7 2c 00 00 	mov    %rdi,0x2cc7(%rip)        # 103018 <rand_seed>
    rand_seed_set = 1;
  100351:	c7 05 c5 2c 00 00 01 	movl   $0x1,0x2cc5(%rip)        # 103020 <rand_seed_set>
  100358:	00 00 00 
}
  10035b:	c3                   	retq   

000000000010035c <rand(int, int)>:

// rand(min, max)
//    Return a pseudorandom number roughly evenly distributed between
//    `min` and `max`, inclusive. Requires `min <= max` and
//    `max - min <= RAND_MAX`.
int rand(int min, int max) {
  10035c:	f3 0f 1e fa          	endbr64 
  100360:	55                   	push   %rbp
  100361:	48 89 e5             	mov    %rsp,%rbp
  100364:	41 54                	push   %r12
  100366:	53                   	push   %rbx
    assert(min <= max);
  100367:	39 f7                	cmp    %esi,%edi
  100369:	7f 27                	jg     100392 <rand(int, int)+0x36>
  10036b:	41 89 fc             	mov    %edi,%r12d
  10036e:	89 f3                	mov    %esi,%ebx
    assert(max - min <= RAND_MAX);

    unsigned long r = rand();
  100370:	e8 77 ff ff ff       	callq  1002ec <rand()>
  100375:	89 c2                	mov    %eax,%edx
    return min + (r * (max - min + 1)) / ((unsigned long) RAND_MAX + 1);
  100377:	44 29 e3             	sub    %r12d,%ebx
  10037a:	8d 43 01             	lea    0x1(%rbx),%eax
  10037d:	48 98                	cltq   
    unsigned long r = rand();
  10037f:	48 63 da             	movslq %edx,%rbx
    return min + (r * (max - min + 1)) / ((unsigned long) RAND_MAX + 1);
  100382:	48 0f af c3          	imul   %rbx,%rax
  100386:	48 c1 e8 1f          	shr    $0x1f,%rax
  10038a:	44 01 e0             	add    %r12d,%eax
}
  10038d:	5b                   	pop    %rbx
  10038e:	41 5c                	pop    %r12
  100390:	5d                   	pop    %rbp
  100391:	c3                   	retq   
    assert(min <= max);
  100392:	b9 00 00 00 00       	mov    $0x0,%ecx
  100397:	ba 8a 0f 10 00       	mov    $0x100f8a,%edx
  10039c:	be ff 00 00 00       	mov    $0xff,%esi
  1003a1:	bf 95 0f 10 00       	mov    $0x100f95,%edi
  1003a6:	e8 54 0a 00 00       	callq  100dff <assert_fail(char const*, int, char const*, char const*)>
  1003ab:	90                   	nop

00000000001003ac <printer::vprintf(int, char const*, __va_list_tag*)>:
#define FLAG_NUMERIC            (1<<5)
#define FLAG_SIGNED             (1<<6)
#define FLAG_NEGATIVE           (1<<7)
#define FLAG_ALT2               (1<<8)

void printer::vprintf(int color, const char* format, va_list val) {
  1003ac:	f3 0f 1e fa          	endbr64 
  1003b0:	55                   	push   %rbp
  1003b1:	48 89 e5             	mov    %rsp,%rbp
  1003b4:	41 57                	push   %r15
  1003b6:	41 56                	push   %r14
  1003b8:	41 55                	push   %r13
  1003ba:	41 54                	push   %r12
  1003bc:	53                   	push   %rbx
  1003bd:	48 83 ec 58          	sub    $0x58,%rsp
  1003c1:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
#define NUMBUFSIZ 24
    char numbuf[NUMBUFSIZ];

    for (; *format; ++format) {
  1003c5:	0f b6 02             	movzbl (%rdx),%eax
  1003c8:	84 c0                	test   %al,%al
  1003ca:	0f 84 c6 07 00 00    	je     100b96 <printer::vprintf(int, char const*, __va_list_tag*)+0x7ea>
  1003d0:	49 89 fe             	mov    %rdi,%r14
  1003d3:	41 89 f7             	mov    %esi,%r15d
  1003d6:	48 89 d3             	mov    %rdx,%rbx
  1003d9:	e9 b9 03 00 00       	jmpq   100797 <printer::vprintf(int, char const*, __va_list_tag*)+0x3eb>
            continue;
        }

        // process flags
        int flags = 0;
        for (++format; *format; ++format) {
  1003de:	4c 8d 63 01          	lea    0x1(%rbx),%r12
  1003e2:	0f b6 5b 01          	movzbl 0x1(%rbx),%ebx
  1003e6:	84 db                	test   %bl,%bl
  1003e8:	0f 84 8a 07 00 00    	je     100b78 <printer::vprintf(int, char const*, __va_list_tag*)+0x7cc>
        int flags = 0;
  1003ee:	41 bd 00 00 00 00    	mov    $0x0,%r13d
            const char* flagc = strchr(flag_chars, *format);
  1003f4:	0f be f3             	movsbl %bl,%esi
  1003f7:	bf 70 16 10 00       	mov    $0x101670,%edi
  1003fc:	e8 bf fe ff ff       	callq  1002c0 <strchr>
  100401:	48 89 c1             	mov    %rax,%rcx
            if (flagc) {
  100404:	48 85 c0             	test   %rax,%rax
  100407:	74 74                	je     10047d <printer::vprintf(int, char const*, __va_list_tag*)+0xd1>
                flags |= 1 << (flagc - flag_chars);
  100409:	48 81 e9 70 16 10 00 	sub    $0x101670,%rcx
  100410:	b8 01 00 00 00       	mov    $0x1,%eax
  100415:	d3 e0                	shl    %cl,%eax
  100417:	41 09 c5             	or     %eax,%r13d
        for (++format; *format; ++format) {
  10041a:	49 83 c4 01          	add    $0x1,%r12
  10041e:	41 0f b6 1c 24       	movzbl (%r12),%ebx
  100423:	84 db                	test   %bl,%bl
  100425:	75 cd                	jne    1003f4 <printer::vprintf(int, char const*, __va_list_tag*)+0x48>
                break;
            }
        }

        // process width
        int width = -1;
  100427:	c7 45 98 ff ff ff ff 	movl   $0xffffffff,-0x68(%rbp)
            width = va_arg(val, int);
            ++format;
        }

        // process precision
        int precision = -1;
  10042e:	c7 45 a4 ff ff ff ff 	movl   $0xffffffff,-0x5c(%rbp)
        if (*format == '.') {
  100435:	41 80 3c 24 2e       	cmpb   $0x2e,(%r12)
  10043a:	0f 84 cc 00 00 00    	je     10050c <printer::vprintf(int, char const*, __va_list_tag*)+0x160>
            }
        }

        // process length
        int length = 0;
        switch (*format) {
  100440:	41 0f b6 04 24       	movzbl (%r12),%eax
  100445:	3c 6c                	cmp    $0x6c,%al
  100447:	0f 84 54 01 00 00    	je     1005a1 <printer::vprintf(int, char const*, __va_list_tag*)+0x1f5>
  10044d:	0f 8f 42 01 00 00    	jg     100595 <printer::vprintf(int, char const*, __va_list_tag*)+0x1e9>
  100453:	3c 68                	cmp    $0x68,%al
  100455:	0f 85 68 01 00 00    	jne    1005c3 <printer::vprintf(int, char const*, __va_list_tag*)+0x217>
        case 'z': // size_t, ssize_t
            length = 1;
            ++format;
            break;
        case 'h':
            ++format;
  10045b:	49 8d 4c 24 01       	lea    0x1(%r12),%rcx
        // process main conversion character
        int base = 10;
        unsigned long num = 0;
        const char* data = "";

        switch (*format) {
  100460:	41 0f b6 44 24 01    	movzbl 0x1(%r12),%eax
  100466:	8d 50 bd             	lea    -0x43(%rax),%edx
  100469:	80 fa 35             	cmp    $0x35,%dl
  10046c:	0f 87 aa 05 00 00    	ja     100a1c <printer::vprintf(int, char const*, __va_list_tag*)+0x670>
  100472:	0f b6 d2             	movzbl %dl,%edx
  100475:	3e ff 24 d5 b0 0f 10 	notrack jmpq *0x100fb0(,%rdx,8)
  10047c:	00 
        if (*format >= '1' && *format <= '9') {
  10047d:	8d 43 cf             	lea    -0x31(%rbx),%eax
  100480:	3c 08                	cmp    $0x8,%al
  100482:	77 35                	ja     1004b9 <printer::vprintf(int, char const*, __va_list_tag*)+0x10d>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  100484:	41 0f b6 04 24       	movzbl (%r12),%eax
  100489:	8d 50 d0             	lea    -0x30(%rax),%edx
  10048c:	80 fa 09             	cmp    $0x9,%dl
  10048f:	77 63                	ja     1004f4 <printer::vprintf(int, char const*, __va_list_tag*)+0x148>
  100491:	ba 00 00 00 00       	mov    $0x0,%edx
                width = 10 * width + *format++ - '0';
  100496:	49 83 c4 01          	add    $0x1,%r12
  10049a:	8d 14 92             	lea    (%rdx,%rdx,4),%edx
  10049d:	0f be c0             	movsbl %al,%eax
  1004a0:	8d 54 50 d0          	lea    -0x30(%rax,%rdx,2),%edx
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  1004a4:	41 0f b6 04 24       	movzbl (%r12),%eax
  1004a9:	8d 48 d0             	lea    -0x30(%rax),%ecx
  1004ac:	80 f9 09             	cmp    $0x9,%cl
  1004af:	76 e5                	jbe    100496 <printer::vprintf(int, char const*, __va_list_tag*)+0xea>
  1004b1:	89 55 98             	mov    %edx,-0x68(%rbp)
  1004b4:	e9 75 ff ff ff       	jmpq   10042e <printer::vprintf(int, char const*, __va_list_tag*)+0x82>
        } else if (*format == '*') {
  1004b9:	80 fb 2a             	cmp    $0x2a,%bl
  1004bc:	75 42                	jne    100500 <printer::vprintf(int, char const*, __va_list_tag*)+0x154>
            width = va_arg(val, int);
  1004be:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1004c2:	8b 07                	mov    (%rdi),%eax
  1004c4:	83 f8 2f             	cmp    $0x2f,%eax
  1004c7:	77 19                	ja     1004e2 <printer::vprintf(int, char const*, __va_list_tag*)+0x136>
  1004c9:	89 c2                	mov    %eax,%edx
  1004cb:	48 03 57 10          	add    0x10(%rdi),%rdx
  1004cf:	83 c0 08             	add    $0x8,%eax
  1004d2:	89 07                	mov    %eax,(%rdi)
  1004d4:	8b 02                	mov    (%rdx),%eax
  1004d6:	89 45 98             	mov    %eax,-0x68(%rbp)
            ++format;
  1004d9:	49 83 c4 01          	add    $0x1,%r12
  1004dd:	e9 4c ff ff ff       	jmpq   10042e <printer::vprintf(int, char const*, __va_list_tag*)+0x82>
            width = va_arg(val, int);
  1004e2:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1004e6:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  1004ea:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1004ee:	48 89 47 08          	mov    %rax,0x8(%rdi)
  1004f2:	eb e0                	jmp    1004d4 <printer::vprintf(int, char const*, __va_list_tag*)+0x128>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  1004f4:	c7 45 98 00 00 00 00 	movl   $0x0,-0x68(%rbp)
  1004fb:	e9 2e ff ff ff       	jmpq   10042e <printer::vprintf(int, char const*, __va_list_tag*)+0x82>
        int width = -1;
  100500:	c7 45 98 ff ff ff ff 	movl   $0xffffffff,-0x68(%rbp)
  100507:	e9 22 ff ff ff       	jmpq   10042e <printer::vprintf(int, char const*, __va_list_tag*)+0x82>
            ++format;
  10050c:	49 8d 54 24 01       	lea    0x1(%r12),%rdx
            if (*format >= '0' && *format <= '9') {
  100511:	41 0f b6 44 24 01    	movzbl 0x1(%r12),%eax
  100517:	8d 48 d0             	lea    -0x30(%rax),%ecx
  10051a:	80 f9 09             	cmp    $0x9,%cl
  10051d:	76 13                	jbe    100532 <printer::vprintf(int, char const*, __va_list_tag*)+0x186>
            } else if (*format == '*') {
  10051f:	3c 2a                	cmp    $0x2a,%al
  100521:	74 32                	je     100555 <printer::vprintf(int, char const*, __va_list_tag*)+0x1a9>
            ++format;
  100523:	49 89 d4             	mov    %rdx,%r12
                precision = 0;
  100526:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%rbp)
  10052d:	e9 0e ff ff ff       	jmpq   100440 <printer::vprintf(int, char const*, __va_list_tag*)+0x94>
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
  100532:	be 00 00 00 00       	mov    $0x0,%esi
                    precision = 10 * precision + *format++ - '0';
  100537:	48 83 c2 01          	add    $0x1,%rdx
  10053b:	8d 0c b6             	lea    (%rsi,%rsi,4),%ecx
  10053e:	0f be c0             	movsbl %al,%eax
  100541:	8d 74 48 d0          	lea    -0x30(%rax,%rcx,2),%esi
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
  100545:	0f b6 02             	movzbl (%rdx),%eax
  100548:	8d 48 d0             	lea    -0x30(%rax),%ecx
  10054b:	80 f9 09             	cmp    $0x9,%cl
  10054e:	76 e7                	jbe    100537 <printer::vprintf(int, char const*, __va_list_tag*)+0x18b>
                    precision = 10 * precision + *format++ - '0';
  100550:	49 89 d4             	mov    %rdx,%r12
  100553:	eb 1c                	jmp    100571 <printer::vprintf(int, char const*, __va_list_tag*)+0x1c5>
                precision = va_arg(val, int);
  100555:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  100559:	8b 01                	mov    (%rcx),%eax
  10055b:	83 f8 2f             	cmp    $0x2f,%eax
  10055e:	77 23                	ja     100583 <printer::vprintf(int, char const*, __va_list_tag*)+0x1d7>
  100560:	89 c2                	mov    %eax,%edx
  100562:	48 03 51 10          	add    0x10(%rcx),%rdx
  100566:	83 c0 08             	add    $0x8,%eax
  100569:	89 01                	mov    %eax,(%rcx)
  10056b:	8b 32                	mov    (%rdx),%esi
                ++format;
  10056d:	49 83 c4 02          	add    $0x2,%r12
            if (precision < 0) {
  100571:	85 f6                	test   %esi,%esi
  100573:	b8 00 00 00 00       	mov    $0x0,%eax
  100578:	0f 49 c6             	cmovns %esi,%eax
  10057b:	89 45 a4             	mov    %eax,-0x5c(%rbp)
  10057e:	e9 bd fe ff ff       	jmpq   100440 <printer::vprintf(int, char const*, __va_list_tag*)+0x94>
                precision = va_arg(val, int);
  100583:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  100587:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  10058b:	48 8d 42 08          	lea    0x8(%rdx),%rax
  10058f:	48 89 47 08          	mov    %rax,0x8(%rdi)
  100593:	eb d6                	jmp    10056b <printer::vprintf(int, char const*, __va_list_tag*)+0x1bf>
        switch (*format) {
  100595:	3c 74                	cmp    $0x74,%al
  100597:	74 08                	je     1005a1 <printer::vprintf(int, char const*, __va_list_tag*)+0x1f5>
  100599:	3c 7a                	cmp    $0x7a,%al
  10059b:	0f 85 e2 05 00 00    	jne    100b83 <printer::vprintf(int, char const*, __va_list_tag*)+0x7d7>
            ++format;
  1005a1:	49 8d 4c 24 01       	lea    0x1(%r12),%rcx
        switch (*format) {
  1005a6:	41 0f b6 44 24 01    	movzbl 0x1(%r12),%eax
  1005ac:	8d 50 bd             	lea    -0x43(%rax),%edx
  1005af:	80 fa 35             	cmp    $0x35,%dl
  1005b2:	0f 87 64 04 00 00    	ja     100a1c <printer::vprintf(int, char const*, __va_list_tag*)+0x670>
  1005b8:	0f b6 d2             	movzbl %dl,%edx
  1005bb:	3e ff 24 d5 60 11 10 	notrack jmpq *0x101160(,%rdx,8)
  1005c2:	00 
  1005c3:	8d 50 bd             	lea    -0x43(%rax),%edx
  1005c6:	80 fa 35             	cmp    $0x35,%dl
  1005c9:	0f 87 4a 04 00 00    	ja     100a19 <printer::vprintf(int, char const*, __va_list_tag*)+0x66d>
  1005cf:	0f b6 d2             	movzbl %dl,%edx
  1005d2:	3e ff 24 d5 10 13 10 	notrack jmpq *0x101310(,%rdx,8)
  1005d9:	00 
        case 'd':
        case 'i': {
            long x = length ? va_arg(val, long) : va_arg(val, int);
  1005da:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1005de:	8b 07                	mov    (%rdi),%eax
  1005e0:	83 f8 2f             	cmp    $0x2f,%eax
  1005e3:	0f 87 c9 01 00 00    	ja     1007b2 <printer::vprintf(int, char const*, __va_list_tag*)+0x406>
  1005e9:	89 c2                	mov    %eax,%edx
  1005eb:	48 03 57 10          	add    0x10(%rdi),%rdx
  1005ef:	83 c0 08             	add    $0x8,%eax
  1005f2:	89 07                	mov    %eax,(%rdi)
  1005f4:	48 8b 12             	mov    (%rdx),%rdx
  1005f7:	49 89 cc             	mov    %rcx,%r12
            int negative = x < 0 ? FLAG_NEGATIVE : 0;
  1005fa:	48 89 d0             	mov    %rdx,%rax
  1005fd:	48 c1 f8 38          	sar    $0x38,%rax
            num = negative ? -x : x;
  100601:	49 89 d0             	mov    %rdx,%r8
  100604:	49 f7 d8             	neg    %r8
  100607:	25 80 00 00 00       	and    $0x80,%eax
  10060c:	4c 0f 44 c2          	cmove  %rdx,%r8
            flags |= FLAG_NUMERIC | FLAG_SIGNED | negative;
  100610:	41 09 c5             	or     %eax,%r13d
  100613:	41 83 cd 60          	or     $0x60,%r13d
        const char* data = "";
  100617:	bb 45 17 10 00       	mov    $0x101745,%ebx
                format--;
            }
            break;
        }

        if (flags & FLAG_NUMERIC) {
  10061c:	44 89 e8             	mov    %r13d,%eax
  10061f:	83 e0 20             	and    $0x20,%eax
  100622:	89 45 9c             	mov    %eax,-0x64(%rbp)
  100625:	41 b9 0a 00 00 00    	mov    $0xa,%r9d
  10062b:	0f 85 0e 04 00 00    	jne    100a3f <printer::vprintf(int, char const*, __va_list_tag*)+0x693>
            data = fill_numbuf(numbuf + NUMBUFSIZ, num, base);
        }

        const char* prefix = "";
        if ((flags & FLAG_NUMERIC) && (flags & FLAG_SIGNED)) {
  100631:	44 89 6d 8c          	mov    %r13d,-0x74(%rbp)
  100635:	44 89 e8             	mov    %r13d,%eax
  100638:	83 e0 60             	and    $0x60,%eax
  10063b:	83 f8 60             	cmp    $0x60,%eax
  10063e:	0f 84 3e 04 00 00    	je     100a82 <printer::vprintf(int, char const*, __va_list_tag*)+0x6d6>
            } else if (flags & FLAG_PLUSPOSITIVE) {
                prefix = "+";
            } else if (flags & FLAG_SPACEPOSITIVE) {
                prefix = " ";
            }
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
  100644:	44 89 e8             	mov    %r13d,%eax
  100647:	83 e0 21             	and    $0x21,%eax
        const char* prefix = "";
  10064a:	48 c7 45 a8 45 17 10 	movq   $0x101745,-0x58(%rbp)
  100651:	00 
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
  100652:	83 f8 21             	cmp    $0x21,%eax
  100655:	0f 84 66 04 00 00    	je     100ac1 <printer::vprintf(int, char const*, __va_list_tag*)+0x715>
                   && (num || (flags & FLAG_ALT2))) {
            prefix = (base == -16 ? "0x" : "0X");
        }

        int datalen;
        if (precision >= 0 && !(flags & FLAG_NUMERIC)) {
  10065b:	8b 4d a4             	mov    -0x5c(%rbp),%ecx
  10065e:	89 c8                	mov    %ecx,%eax
  100660:	f7 d0                	not    %eax
  100662:	c1 e8 1f             	shr    $0x1f,%eax
  100665:	89 45 88             	mov    %eax,-0x78(%rbp)
  100668:	83 7d 9c 00          	cmpl   $0x0,-0x64(%rbp)
  10066c:	0f 85 8b 04 00 00    	jne    100afd <printer::vprintf(int, char const*, __va_list_tag*)+0x751>
  100672:	84 c0                	test   %al,%al
  100674:	0f 84 83 04 00 00    	je     100afd <printer::vprintf(int, char const*, __va_list_tag*)+0x751>
            datalen = strnlen(data, precision);
  10067a:	48 63 f1             	movslq %ecx,%rsi
  10067d:	48 89 df             	mov    %rbx,%rdi
  100680:	e8 19 fc ff ff       	callq  10029e <strnlen>
  100685:	89 45 a0             	mov    %eax,-0x60(%rbp)
        if ((flags & FLAG_NUMERIC)
            && precision >= 0) {
            zeros = precision > datalen ? precision - datalen : 0;
        } else if ((flags & FLAG_NUMERIC)
                   && (flags & FLAG_ZERO)
                   && !(flags & FLAG_LEFTJUSTIFY)
  100688:	8b 45 8c             	mov    -0x74(%rbp),%eax
  10068b:	83 e0 26             	and    $0x26,%eax
                   && datalen + (int) strlen(prefix) < width) {
            zeros = width - datalen - strlen(prefix);
        } else {
            zeros = 0;
  10068e:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%rbp)
                   && datalen + (int) strlen(prefix) < width) {
  100695:	83 f8 22             	cmp    $0x22,%eax
  100698:	0f 84 97 04 00 00    	je     100b35 <printer::vprintf(int, char const*, __va_list_tag*)+0x789>
        }

        width -= datalen + zeros + strlen(prefix);
  10069e:	48 8b 7d a8          	mov    -0x58(%rbp),%rdi
  1006a2:	e8 d8 fb ff ff       	callq  10027f <strlen>
  1006a7:	8b 55 a4             	mov    -0x5c(%rbp),%edx
  1006aa:	03 55 a0             	add    -0x60(%rbp),%edx
  1006ad:	8b 7d 98             	mov    -0x68(%rbp),%edi
  1006b0:	29 d7                	sub    %edx,%edi
  1006b2:	89 fa                	mov    %edi,%edx
  1006b4:	29 c2                	sub    %eax,%edx
  1006b6:	89 55 98             	mov    %edx,-0x68(%rbp)
  1006b9:	89 55 9c             	mov    %edx,-0x64(%rbp)
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
  1006bc:	41 f6 c5 04          	test   $0x4,%r13b
  1006c0:	75 32                	jne    1006f4 <printer::vprintf(int, char const*, __va_list_tag*)+0x348>
        width -= datalen + zeros + strlen(prefix);
  1006c2:	41 89 d5             	mov    %edx,%r13d
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
  1006c5:	85 d2                	test   %edx,%edx
  1006c7:	7e 2b                	jle    1006f4 <printer::vprintf(int, char const*, __va_list_tag*)+0x348>
            putc(' ', color);
  1006c9:	49 8b 06             	mov    (%r14),%rax
  1006cc:	44 89 fa             	mov    %r15d,%edx
  1006cf:	be 20 00 00 00       	mov    $0x20,%esi
  1006d4:	4c 89 f7             	mov    %r14,%rdi
  1006d7:	ff 10                	callq  *(%rax)
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
  1006d9:	41 83 ed 01          	sub    $0x1,%r13d
  1006dd:	45 85 ed             	test   %r13d,%r13d
  1006e0:	7f e7                	jg     1006c9 <printer::vprintf(int, char const*, __va_list_tag*)+0x31d>
  1006e2:	8b 7d 98             	mov    -0x68(%rbp),%edi
  1006e5:	85 ff                	test   %edi,%edi
  1006e7:	b8 01 00 00 00       	mov    $0x1,%eax
  1006ec:	0f 4f c7             	cmovg  %edi,%eax
  1006ef:	29 c7                	sub    %eax,%edi
  1006f1:	89 7d 9c             	mov    %edi,-0x64(%rbp)
        }
        for (; *prefix; ++prefix) {
  1006f4:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  1006f8:	0f b6 00             	movzbl (%rax),%eax
  1006fb:	4c 8b 6d a8          	mov    -0x58(%rbp),%r13
  1006ff:	84 c0                	test   %al,%al
  100701:	74 1b                	je     10071e <printer::vprintf(int, char const*, __va_list_tag*)+0x372>
            putc(*prefix, color);
  100703:	0f b6 f0             	movzbl %al,%esi
  100706:	49 8b 06             	mov    (%r14),%rax
  100709:	44 89 fa             	mov    %r15d,%edx
  10070c:	4c 89 f7             	mov    %r14,%rdi
  10070f:	ff 10                	callq  *(%rax)
        for (; *prefix; ++prefix) {
  100711:	49 83 c5 01          	add    $0x1,%r13
  100715:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
  10071a:	84 c0                	test   %al,%al
  10071c:	75 e5                	jne    100703 <printer::vprintf(int, char const*, __va_list_tag*)+0x357>
        }
        for (; zeros > 0; --zeros) {
  10071e:	44 8b 6d a4          	mov    -0x5c(%rbp),%r13d
  100722:	83 7d a4 00          	cmpl   $0x0,-0x5c(%rbp)
  100726:	7e 16                	jle    10073e <printer::vprintf(int, char const*, __va_list_tag*)+0x392>
            putc('0', color);
  100728:	49 8b 06             	mov    (%r14),%rax
  10072b:	44 89 fa             	mov    %r15d,%edx
  10072e:	be 30 00 00 00       	mov    $0x30,%esi
  100733:	4c 89 f7             	mov    %r14,%rdi
  100736:	ff 10                	callq  *(%rax)
        for (; zeros > 0; --zeros) {
  100738:	41 83 ed 01          	sub    $0x1,%r13d
  10073c:	75 ea                	jne    100728 <printer::vprintf(int, char const*, __va_list_tag*)+0x37c>
        }
        for (; datalen > 0; ++data, --datalen) {
  10073e:	83 7d a0 00          	cmpl   $0x0,-0x60(%rbp)
  100742:	7e 22                	jle    100766 <printer::vprintf(int, char const*, __va_list_tag*)+0x3ba>
  100744:	8b 45 a0             	mov    -0x60(%rbp),%eax
  100747:	8d 40 ff             	lea    -0x1(%rax),%eax
  10074a:	4c 8d 6c 03 01       	lea    0x1(%rbx,%rax,1),%r13
            putc(*data, color);
  10074f:	0f b6 33             	movzbl (%rbx),%esi
  100752:	49 8b 06             	mov    (%r14),%rax
  100755:	44 89 fa             	mov    %r15d,%edx
  100758:	4c 89 f7             	mov    %r14,%rdi
  10075b:	ff 10                	callq  *(%rax)
        for (; datalen > 0; ++data, --datalen) {
  10075d:	48 83 c3 01          	add    $0x1,%rbx
  100761:	4c 39 eb             	cmp    %r13,%rbx
  100764:	75 e9                	jne    10074f <printer::vprintf(int, char const*, __va_list_tag*)+0x3a3>
        }
        for (; width > 0; --width) {
  100766:	8b 5d 9c             	mov    -0x64(%rbp),%ebx
  100769:	83 7d 9c 00          	cmpl   $0x0,-0x64(%rbp)
  10076d:	7e 15                	jle    100784 <printer::vprintf(int, char const*, __va_list_tag*)+0x3d8>
            putc(' ', color);
  10076f:	49 8b 06             	mov    (%r14),%rax
  100772:	44 89 fa             	mov    %r15d,%edx
  100775:	be 20 00 00 00       	mov    $0x20,%esi
  10077a:	4c 89 f7             	mov    %r14,%rdi
  10077d:	ff 10                	callq  *(%rax)
        for (; width > 0; --width) {
  10077f:	83 eb 01             	sub    $0x1,%ebx
  100782:	75 eb                	jne    10076f <printer::vprintf(int, char const*, __va_list_tag*)+0x3c3>
    for (; *format; ++format) {
  100784:	49 8d 5c 24 01       	lea    0x1(%r12),%rbx
  100789:	41 0f b6 44 24 01    	movzbl 0x1(%r12),%eax
  10078f:	84 c0                	test   %al,%al
  100791:	0f 84 ff 03 00 00    	je     100b96 <printer::vprintf(int, char const*, __va_list_tag*)+0x7ea>
        if (*format != '%') {
  100797:	3c 25                	cmp    $0x25,%al
  100799:	0f 84 3f fc ff ff    	je     1003de <printer::vprintf(int, char const*, __va_list_tag*)+0x32>
            putc(*format, color);
  10079f:	0f b6 f0             	movzbl %al,%esi
  1007a2:	49 8b 06             	mov    (%r14),%rax
  1007a5:	44 89 fa             	mov    %r15d,%edx
  1007a8:	4c 89 f7             	mov    %r14,%rdi
  1007ab:	ff 10                	callq  *(%rax)
            continue;
  1007ad:	49 89 dc             	mov    %rbx,%r12
  1007b0:	eb d2                	jmp    100784 <printer::vprintf(int, char const*, __va_list_tag*)+0x3d8>
            long x = length ? va_arg(val, long) : va_arg(val, int);
  1007b2:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1007b6:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  1007ba:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1007be:	48 89 47 08          	mov    %rax,0x8(%rdi)
  1007c2:	e9 2d fe ff ff       	jmpq   1005f4 <printer::vprintf(int, char const*, __va_list_tag*)+0x248>
        switch (*format) {
  1007c7:	49 89 cc             	mov    %rcx,%r12
            long x = length ? va_arg(val, long) : va_arg(val, int);
  1007ca:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1007ce:	8b 01                	mov    (%rcx),%eax
  1007d0:	83 f8 2f             	cmp    $0x2f,%eax
  1007d3:	77 13                	ja     1007e8 <printer::vprintf(int, char const*, __va_list_tag*)+0x43c>
  1007d5:	89 c2                	mov    %eax,%edx
  1007d7:	48 03 51 10          	add    0x10(%rcx),%rdx
  1007db:	83 c0 08             	add    $0x8,%eax
  1007de:	89 01                	mov    %eax,(%rcx)
  1007e0:	48 63 12             	movslq (%rdx),%rdx
  1007e3:	e9 12 fe ff ff       	jmpq   1005fa <printer::vprintf(int, char const*, __va_list_tag*)+0x24e>
  1007e8:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1007ec:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  1007f0:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1007f4:	48 89 41 08          	mov    %rax,0x8(%rcx)
  1007f8:	eb e6                	jmp    1007e0 <printer::vprintf(int, char const*, __va_list_tag*)+0x434>
        switch (*format) {
  1007fa:	49 89 cc             	mov    %rcx,%r12
  1007fd:	b8 01 00 00 00       	mov    $0x1,%eax
  100802:	be 0a 00 00 00       	mov    $0xa,%esi
  100807:	e9 a8 00 00 00       	jmpq   1008b4 <printer::vprintf(int, char const*, __va_list_tag*)+0x508>
  10080c:	49 89 cc             	mov    %rcx,%r12
  10080f:	b8 00 00 00 00       	mov    $0x0,%eax
  100814:	be 0a 00 00 00       	mov    $0xa,%esi
  100819:	e9 96 00 00 00       	jmpq   1008b4 <printer::vprintf(int, char const*, __va_list_tag*)+0x508>
        switch (*format) {
  10081e:	b8 00 00 00 00       	mov    $0x0,%eax
  100823:	be 0a 00 00 00       	mov    $0xa,%esi
  100828:	e9 87 00 00 00       	jmpq   1008b4 <printer::vprintf(int, char const*, __va_list_tag*)+0x508>
  10082d:	b8 00 00 00 00       	mov    $0x0,%eax
  100832:	be 0a 00 00 00       	mov    $0xa,%esi
  100837:	eb 7b                	jmp    1008b4 <printer::vprintf(int, char const*, __va_list_tag*)+0x508>
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
  100839:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  10083d:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  100841:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100845:	48 89 47 08          	mov    %rax,0x8(%rdi)
  100849:	e9 84 00 00 00       	jmpq   1008d2 <printer::vprintf(int, char const*, __va_list_tag*)+0x526>
  10084e:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  100852:	8b 01                	mov    (%rcx),%eax
  100854:	83 f8 2f             	cmp    $0x2f,%eax
  100857:	77 10                	ja     100869 <printer::vprintf(int, char const*, __va_list_tag*)+0x4bd>
  100859:	89 c2                	mov    %eax,%edx
  10085b:	48 03 51 10          	add    0x10(%rcx),%rdx
  10085f:	83 c0 08             	add    $0x8,%eax
  100862:	89 01                	mov    %eax,(%rcx)
  100864:	44 8b 02             	mov    (%rdx),%r8d
  100867:	eb 6c                	jmp    1008d5 <printer::vprintf(int, char const*, __va_list_tag*)+0x529>
  100869:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  10086d:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  100871:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100875:	48 89 41 08          	mov    %rax,0x8(%rcx)
  100879:	eb e9                	jmp    100864 <printer::vprintf(int, char const*, __va_list_tag*)+0x4b8>
  10087b:	41 89 f1             	mov    %esi,%r9d
        if (flags & FLAG_NUMERIC) {
  10087e:	c7 45 9c 20 00 00 00 	movl   $0x20,-0x64(%rbp)
    const char* digits = upper_digits;
  100885:	bf a0 16 10 00       	mov    $0x1016a0,%edi
  10088a:	e9 c0 01 00 00       	jmpq   100a4f <printer::vprintf(int, char const*, __va_list_tag*)+0x6a3>
        switch (*format) {
  10088f:	49 89 cc             	mov    %rcx,%r12
  100892:	b8 01 00 00 00       	mov    $0x1,%eax
  100897:	eb 16                	jmp    1008af <printer::vprintf(int, char const*, __va_list_tag*)+0x503>
  100899:	49 89 cc             	mov    %rcx,%r12
  10089c:	b8 00 00 00 00       	mov    $0x0,%eax
  1008a1:	eb 0c                	jmp    1008af <printer::vprintf(int, char const*, __va_list_tag*)+0x503>
        switch (*format) {
  1008a3:	b8 00 00 00 00       	mov    $0x0,%eax
  1008a8:	eb 05                	jmp    1008af <printer::vprintf(int, char const*, __va_list_tag*)+0x503>
  1008aa:	b8 00 00 00 00       	mov    $0x0,%eax
            base = -16;
  1008af:	be f0 ff ff ff       	mov    $0xfffffff0,%esi
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
  1008b4:	85 c0                	test   %eax,%eax
  1008b6:	74 96                	je     10084e <printer::vprintf(int, char const*, __va_list_tag*)+0x4a2>
  1008b8:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1008bc:	8b 01                	mov    (%rcx),%eax
  1008be:	83 f8 2f             	cmp    $0x2f,%eax
  1008c1:	0f 87 72 ff ff ff    	ja     100839 <printer::vprintf(int, char const*, __va_list_tag*)+0x48d>
  1008c7:	89 c2                	mov    %eax,%edx
  1008c9:	48 03 51 10          	add    0x10(%rcx),%rdx
  1008cd:	83 c0 08             	add    $0x8,%eax
  1008d0:	89 01                	mov    %eax,(%rcx)
  1008d2:	4c 8b 02             	mov    (%rdx),%r8
            flags |= FLAG_NUMERIC;
  1008d5:	41 83 cd 20          	or     $0x20,%r13d
    if (base < 0) {
  1008d9:	85 f6                	test   %esi,%esi
  1008db:	79 9e                	jns    10087b <printer::vprintf(int, char const*, __va_list_tag*)+0x4cf>
        base = -base;
  1008dd:	41 89 f1             	mov    %esi,%r9d
  1008e0:	f7 de                	neg    %esi
  1008e2:	c7 45 9c 20 00 00 00 	movl   $0x20,-0x64(%rbp)
        digits = lower_digits;
  1008e9:	bf 80 16 10 00       	mov    $0x101680,%edi
  1008ee:	e9 5c 01 00 00       	jmpq   100a4f <printer::vprintf(int, char const*, __va_list_tag*)+0x6a3>
        switch (*format) {
  1008f3:	49 89 cc             	mov    %rcx,%r12
  1008f6:	b8 01 00 00 00       	mov    $0x1,%eax
  1008fb:	eb 16                	jmp    100913 <printer::vprintf(int, char const*, __va_list_tag*)+0x567>
  1008fd:	49 89 cc             	mov    %rcx,%r12
  100900:	b8 00 00 00 00       	mov    $0x0,%eax
  100905:	eb 0c                	jmp    100913 <printer::vprintf(int, char const*, __va_list_tag*)+0x567>
        switch (*format) {
  100907:	b8 00 00 00 00       	mov    $0x0,%eax
  10090c:	eb 05                	jmp    100913 <printer::vprintf(int, char const*, __va_list_tag*)+0x567>
  10090e:	b8 00 00 00 00       	mov    $0x0,%eax
            base = 16;
  100913:	be 10 00 00 00       	mov    $0x10,%esi
            goto format_unsigned;
  100918:	eb 9a                	jmp    1008b4 <printer::vprintf(int, char const*, __va_list_tag*)+0x508>
        switch (*format) {
  10091a:	49 89 cc             	mov    %rcx,%r12
            num = (uintptr_t) va_arg(val, void*);
  10091d:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  100921:	8b 01                	mov    (%rcx),%eax
  100923:	83 f8 2f             	cmp    $0x2f,%eax
  100926:	77 21                	ja     100949 <printer::vprintf(int, char const*, __va_list_tag*)+0x59d>
  100928:	89 c2                	mov    %eax,%edx
  10092a:	48 03 51 10          	add    0x10(%rcx),%rdx
  10092e:	83 c0 08             	add    $0x8,%eax
  100931:	89 01                	mov    %eax,(%rcx)
  100933:	4c 8b 02             	mov    (%rdx),%r8
            flags |= FLAG_ALT | FLAG_ALT2 | FLAG_NUMERIC;
  100936:	41 81 cd 21 01 00 00 	or     $0x121,%r13d
            base = -16;
  10093d:	be f0 ff ff ff       	mov    $0xfffffff0,%esi
  100942:	eb 99                	jmp    1008dd <printer::vprintf(int, char const*, __va_list_tag*)+0x531>
        switch (*format) {
  100944:	49 89 cc             	mov    %rcx,%r12
  100947:	eb d4                	jmp    10091d <printer::vprintf(int, char const*, __va_list_tag*)+0x571>
            num = (uintptr_t) va_arg(val, void*);
  100949:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  10094d:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  100951:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100955:	48 89 47 08          	mov    %rax,0x8(%rdi)
  100959:	eb d8                	jmp    100933 <printer::vprintf(int, char const*, __va_list_tag*)+0x587>
        switch (*format) {
  10095b:	49 89 cc             	mov    %rcx,%r12
            data = va_arg(val, char*);
  10095e:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  100962:	8b 07                	mov    (%rdi),%eax
  100964:	83 f8 2f             	cmp    $0x2f,%eax
  100967:	77 1e                	ja     100987 <printer::vprintf(int, char const*, __va_list_tag*)+0x5db>
  100969:	89 c2                	mov    %eax,%edx
  10096b:	48 03 57 10          	add    0x10(%rdi),%rdx
  10096f:	83 c0 08             	add    $0x8,%eax
  100972:	89 07                	mov    %eax,(%rdi)
  100974:	48 8b 1a             	mov    (%rdx),%rbx
        unsigned long num = 0;
  100977:	41 b8 00 00 00 00    	mov    $0x0,%r8d
            break;
  10097d:	e9 9a fc ff ff       	jmpq   10061c <printer::vprintf(int, char const*, __va_list_tag*)+0x270>
        switch (*format) {
  100982:	49 89 cc             	mov    %rcx,%r12
  100985:	eb d7                	jmp    10095e <printer::vprintf(int, char const*, __va_list_tag*)+0x5b2>
            data = va_arg(val, char*);
  100987:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  10098b:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  10098f:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100993:	48 89 41 08          	mov    %rax,0x8(%rcx)
  100997:	eb db                	jmp    100974 <printer::vprintf(int, char const*, __va_list_tag*)+0x5c8>
        switch (*format) {
  100999:	49 89 cc             	mov    %rcx,%r12
            color = va_arg(val, int);
  10099c:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1009a0:	8b 01                	mov    (%rcx),%eax
  1009a2:	83 f8 2f             	cmp    $0x2f,%eax
  1009a5:	77 18                	ja     1009bf <printer::vprintf(int, char const*, __va_list_tag*)+0x613>
  1009a7:	89 c2                	mov    %eax,%edx
  1009a9:	48 03 51 10          	add    0x10(%rcx),%rdx
  1009ad:	83 c0 08             	add    $0x8,%eax
  1009b0:	89 01                	mov    %eax,(%rcx)
  1009b2:	44 8b 3a             	mov    (%rdx),%r15d
            continue;
  1009b5:	e9 ca fd ff ff       	jmpq   100784 <printer::vprintf(int, char const*, __va_list_tag*)+0x3d8>
        switch (*format) {
  1009ba:	49 89 cc             	mov    %rcx,%r12
  1009bd:	eb dd                	jmp    10099c <printer::vprintf(int, char const*, __va_list_tag*)+0x5f0>
            color = va_arg(val, int);
  1009bf:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1009c3:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  1009c7:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1009cb:	48 89 47 08          	mov    %rax,0x8(%rdi)
  1009cf:	eb e1                	jmp    1009b2 <printer::vprintf(int, char const*, __va_list_tag*)+0x606>
        switch (*format) {
  1009d1:	49 89 cc             	mov    %rcx,%r12
            numbuf[0] = va_arg(val, int);
  1009d4:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1009d8:	8b 07                	mov    (%rdi),%eax
  1009da:	83 f8 2f             	cmp    $0x2f,%eax
  1009dd:	77 28                	ja     100a07 <printer::vprintf(int, char const*, __va_list_tag*)+0x65b>
  1009df:	89 c2                	mov    %eax,%edx
  1009e1:	48 03 57 10          	add    0x10(%rdi),%rdx
  1009e5:	83 c0 08             	add    $0x8,%eax
  1009e8:	89 07                	mov    %eax,(%rdi)
  1009ea:	8b 02                	mov    (%rdx),%eax
  1009ec:	88 45 b8             	mov    %al,-0x48(%rbp)
            numbuf[1] = '\0';
  1009ef:	c6 45 b9 00          	movb   $0x0,-0x47(%rbp)
            data = numbuf;
  1009f3:	48 8d 5d b8          	lea    -0x48(%rbp),%rbx
        unsigned long num = 0;
  1009f7:	41 b8 00 00 00 00    	mov    $0x0,%r8d
            break;
  1009fd:	e9 1a fc ff ff       	jmpq   10061c <printer::vprintf(int, char const*, __va_list_tag*)+0x270>
        switch (*format) {
  100a02:	49 89 cc             	mov    %rcx,%r12
  100a05:	eb cd                	jmp    1009d4 <printer::vprintf(int, char const*, __va_list_tag*)+0x628>
            numbuf[0] = va_arg(val, int);
  100a07:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  100a0b:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  100a0f:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100a13:	48 89 41 08          	mov    %rax,0x8(%rcx)
  100a17:	eb d1                	jmp    1009ea <printer::vprintf(int, char const*, __va_list_tag*)+0x63e>
        switch (*format) {
  100a19:	4c 89 e1             	mov    %r12,%rcx
            numbuf[0] = (*format ? *format : '%');
  100a1c:	84 c0                	test   %al,%al
  100a1e:	0f 85 3b 01 00 00    	jne    100b5f <printer::vprintf(int, char const*, __va_list_tag*)+0x7b3>
  100a24:	c6 45 b8 25          	movb   $0x25,-0x48(%rbp)
            numbuf[1] = '\0';
  100a28:	c6 45 b9 00          	movb   $0x0,-0x47(%rbp)
                format--;
  100a2c:	4c 8d 61 ff          	lea    -0x1(%rcx),%r12
            data = numbuf;
  100a30:	48 8d 5d b8          	lea    -0x48(%rbp),%rbx
        unsigned long num = 0;
  100a34:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  100a3a:	e9 dd fb ff ff       	jmpq   10061c <printer::vprintf(int, char const*, __va_list_tag*)+0x270>
        if (flags & FLAG_NUMERIC) {
  100a3f:	41 b9 0a 00 00 00    	mov    $0xa,%r9d
    const char* digits = upper_digits;
  100a45:	bf a0 16 10 00       	mov    $0x1016a0,%edi
        if (flags & FLAG_NUMERIC) {
  100a4a:	be 0a 00 00 00       	mov    $0xa,%esi
    *--numbuf_end = '\0';
  100a4f:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
  100a53:	4c 89 c1             	mov    %r8,%rcx
  100a56:	48 8d 5d cf          	lea    -0x31(%rbp),%rbx
        *--numbuf_end = digits[val % base];
  100a5a:	48 63 f6             	movslq %esi,%rsi
  100a5d:	48 83 eb 01          	sub    $0x1,%rbx
  100a61:	48 89 c8             	mov    %rcx,%rax
  100a64:	ba 00 00 00 00       	mov    $0x0,%edx
  100a69:	48 f7 f6             	div    %rsi
  100a6c:	0f b6 14 17          	movzbl (%rdi,%rdx,1),%edx
  100a70:	88 13                	mov    %dl,(%rbx)
        val /= base;
  100a72:	48 89 ca             	mov    %rcx,%rdx
  100a75:	48 89 c1             	mov    %rax,%rcx
    } while (val != 0);
  100a78:	48 39 d6             	cmp    %rdx,%rsi
  100a7b:	76 e0                	jbe    100a5d <printer::vprintf(int, char const*, __va_list_tag*)+0x6b1>
  100a7d:	e9 af fb ff ff       	jmpq   100631 <printer::vprintf(int, char const*, __va_list_tag*)+0x285>
                prefix = "-";
  100a82:	48 c7 45 a8 a1 0f 10 	movq   $0x100fa1,-0x58(%rbp)
  100a89:	00 
            if (flags & FLAG_NEGATIVE) {
  100a8a:	41 f6 c5 80          	test   $0x80,%r13b
  100a8e:	0f 85 c7 fb ff ff    	jne    10065b <printer::vprintf(int, char const*, __va_list_tag*)+0x2af>
                prefix = "+";
  100a94:	48 c7 45 a8 9f 0f 10 	movq   $0x100f9f,-0x58(%rbp)
  100a9b:	00 
            } else if (flags & FLAG_PLUSPOSITIVE) {
  100a9c:	41 f6 c5 10          	test   $0x10,%r13b
  100aa0:	0f 85 b5 fb ff ff    	jne    10065b <printer::vprintf(int, char const*, __va_list_tag*)+0x2af>
                prefix = " ";
  100aa6:	41 f6 c5 08          	test   $0x8,%r13b
  100aaa:	ba 45 17 10 00       	mov    $0x101745,%edx
  100aaf:	b8 36 17 10 00       	mov    $0x101736,%eax
  100ab4:	48 0f 44 c2          	cmove  %rdx,%rax
  100ab8:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
  100abc:	e9 9a fb ff ff       	jmpq   10065b <printer::vprintf(int, char const*, __va_list_tag*)+0x2af>
                   && (base == 16 || base == -16)
  100ac1:	41 8d 41 10          	lea    0x10(%r9),%eax
  100ac5:	a9 df ff ff ff       	test   $0xffffffdf,%eax
  100aca:	0f 85 8b fb ff ff    	jne    10065b <printer::vprintf(int, char const*, __va_list_tag*)+0x2af>
                   && (num || (flags & FLAG_ALT2))) {
  100ad0:	4d 85 c0             	test   %r8,%r8
  100ad3:	75 0d                	jne    100ae2 <printer::vprintf(int, char const*, __va_list_tag*)+0x736>
  100ad5:	41 f7 c5 00 01 00 00 	test   $0x100,%r13d
  100adc:	0f 84 79 fb ff ff    	je     10065b <printer::vprintf(int, char const*, __va_list_tag*)+0x2af>
            prefix = (base == -16 ? "0x" : "0X");
  100ae2:	41 83 f9 f0          	cmp    $0xfffffff0,%r9d
  100ae6:	ba 9c 0f 10 00       	mov    $0x100f9c,%edx
  100aeb:	b8 a3 0f 10 00       	mov    $0x100fa3,%eax
  100af0:	48 0f 44 c2          	cmove  %rdx,%rax
  100af4:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
  100af8:	e9 5e fb ff ff       	jmpq   10065b <printer::vprintf(int, char const*, __va_list_tag*)+0x2af>
            datalen = strlen(data);
  100afd:	48 89 df             	mov    %rbx,%rdi
  100b00:	e8 7a f7 ff ff       	callq  10027f <strlen>
  100b05:	89 45 a0             	mov    %eax,-0x60(%rbp)
            && precision >= 0) {
  100b08:	83 7d 9c 00          	cmpl   $0x0,-0x64(%rbp)
  100b0c:	0f 84 76 fb ff ff    	je     100688 <printer::vprintf(int, char const*, __va_list_tag*)+0x2dc>
  100b12:	80 7d 88 00          	cmpb   $0x0,-0x78(%rbp)
  100b16:	0f 84 6c fb ff ff    	je     100688 <printer::vprintf(int, char const*, __va_list_tag*)+0x2dc>
            zeros = precision > datalen ? precision - datalen : 0;
  100b1c:	8b 4d a4             	mov    -0x5c(%rbp),%ecx
  100b1f:	89 ca                	mov    %ecx,%edx
  100b21:	29 c2                	sub    %eax,%edx
  100b23:	39 c1                	cmp    %eax,%ecx
  100b25:	b8 00 00 00 00       	mov    $0x0,%eax
  100b2a:	0f 4f c2             	cmovg  %edx,%eax
  100b2d:	89 45 a4             	mov    %eax,-0x5c(%rbp)
  100b30:	e9 69 fb ff ff       	jmpq   10069e <printer::vprintf(int, char const*, __va_list_tag*)+0x2f2>
                   && datalen + (int) strlen(prefix) < width) {
  100b35:	48 8b 7d a8          	mov    -0x58(%rbp),%rdi
  100b39:	e8 41 f7 ff ff       	callq  10027f <strlen>
  100b3e:	8b 75 a0             	mov    -0x60(%rbp),%esi
  100b41:	8d 14 06             	lea    (%rsi,%rax,1),%edx
            zeros = width - datalen - strlen(prefix);
  100b44:	8b 7d 98             	mov    -0x68(%rbp),%edi
  100b47:	89 f9                	mov    %edi,%ecx
  100b49:	29 f1                	sub    %esi,%ecx
  100b4b:	29 c1                	sub    %eax,%ecx
  100b4d:	39 fa                	cmp    %edi,%edx
  100b4f:	b8 00 00 00 00       	mov    $0x0,%eax
  100b54:	0f 4c c1             	cmovl  %ecx,%eax
  100b57:	89 45 a4             	mov    %eax,-0x5c(%rbp)
  100b5a:	e9 3f fb ff ff       	jmpq   10069e <printer::vprintf(int, char const*, __va_list_tag*)+0x2f2>
  100b5f:	49 89 cc             	mov    %rcx,%r12
            numbuf[0] = (*format ? *format : '%');
  100b62:	88 45 b8             	mov    %al,-0x48(%rbp)
            numbuf[1] = '\0';
  100b65:	c6 45 b9 00          	movb   $0x0,-0x47(%rbp)
            data = numbuf;
  100b69:	48 8d 5d b8          	lea    -0x48(%rbp),%rbx
        unsigned long num = 0;
  100b6d:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  100b73:	e9 a4 fa ff ff       	jmpq   10061c <printer::vprintf(int, char const*, __va_list_tag*)+0x270>
        int flags = 0;
  100b78:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  100b7e:	e9 a4 f8 ff ff       	jmpq   100427 <printer::vprintf(int, char const*, __va_list_tag*)+0x7b>
        switch (*format) {
  100b83:	8d 50 bd             	lea    -0x43(%rax),%edx
  100b86:	80 fa 35             	cmp    $0x35,%dl
  100b89:	77 d7                	ja     100b62 <printer::vprintf(int, char const*, __va_list_tag*)+0x7b6>
  100b8b:	0f b6 d2             	movzbl %dl,%edx
  100b8e:	3e ff 24 d5 c0 14 10 	notrack jmpq *0x1014c0(,%rdx,8)
  100b95:	00 
        }
    }
}
  100b96:	48 83 c4 58          	add    $0x58,%rsp
  100b9a:	5b                   	pop    %rbx
  100b9b:	41 5c                	pop    %r12
  100b9d:	41 5d                	pop    %r13
  100b9f:	41 5e                	pop    %r14
  100ba1:	41 5f                	pop    %r15
  100ba3:	5d                   	pop    %rbp
  100ba4:	c3                   	retq   
  100ba5:	90                   	nop

0000000000100ba6 <console_printer::console_printer(int, bool)>:
    void scroll();
    void move_cursor();
};

__noinline
console_printer::console_printer(int cpos, bool scroll)
  100ba6:	f3 0f 1e fa          	endbr64 
    : cell_(console), scroll_(scroll) {
  100baa:	48 c7 07 28 17 10 00 	movq   $0x101728,(%rdi)
  100bb1:	48 c7 47 08 00 80 0b 	movq   $0xb8000,0x8(%rdi)
  100bb8:	00 
  100bb9:	88 57 10             	mov    %dl,0x10(%rdi)
    if (cpos < 0) {
  100bbc:	85 f6                	test   %esi,%esi
  100bbe:	78 18                	js     100bd8 <console_printer::console_printer(int, bool)+0x32>
        cell_ += cursorpos;
    } else if (cpos <= CONSOLE_ROWS * CONSOLE_COLUMNS) {
  100bc0:	81 fe d0 07 00 00    	cmp    $0x7d0,%esi
  100bc6:	7f 0f                	jg     100bd7 <console_printer::console_printer(int, bool)+0x31>
        cell_ += cpos;
  100bc8:	48 63 f6             	movslq %esi,%rsi
  100bcb:	48 8d 84 36 00 80 0b 	lea    0xb8000(%rsi,%rsi,1),%rax
  100bd2:	00 
  100bd3:	48 89 47 08          	mov    %rax,0x8(%rdi)
    }
}
  100bd7:	c3                   	retq   
        cell_ += cursorpos;
  100bd8:	8b 05 1e 84 fb ff    	mov    -0x47be2(%rip),%eax        # b8ffc <cursorpos>
  100bde:	48 98                	cltq   
  100be0:	48 8d 84 00 00 80 0b 	lea    0xb8000(%rax,%rax,1),%rax
  100be7:	00 
  100be8:	48 89 47 08          	mov    %rax,0x8(%rdi)
  100bec:	c3                   	retq   
  100bed:	90                   	nop

0000000000100bee <console_printer::scroll()>:

__noinline
void console_printer::scroll() {
  100bee:	f3 0f 1e fa          	endbr64 
  100bf2:	55                   	push   %rbp
  100bf3:	48 89 e5             	mov    %rsp,%rbp
  100bf6:	53                   	push   %rbx
  100bf7:	48 83 ec 08          	sub    $0x8,%rsp
    assert(cell_ >= console + CONSOLE_ROWS * CONSOLE_COLUMNS);
  100bfb:	48 81 7f 08 a0 8f 0b 	cmpq   $0xb8fa0,0x8(%rdi)
  100c02:	00 
  100c03:	72 18                	jb     100c1d <console_printer::scroll()+0x2f>
  100c05:	48 89 fb             	mov    %rdi,%rbx
    if (scroll_) {
  100c08:	80 7f 10 00          	cmpb   $0x0,0x10(%rdi)
  100c0c:	75 28                	jne    100c36 <console_printer::scroll()+0x48>
                (CONSOLE_ROWS - 1) * CONSOLE_COLUMNS * sizeof(*console));
        memset(console + (CONSOLE_ROWS - 1) * CONSOLE_COLUMNS,
               0, CONSOLE_COLUMNS * sizeof(*console));
        cell_ -= CONSOLE_COLUMNS;
    } else {
        cell_ = console;
  100c0e:	48 c7 47 08 00 80 0b 	movq   $0xb8000,0x8(%rdi)
  100c15:	00 
    }
}
  100c16:	48 83 c4 08          	add    $0x8,%rsp
  100c1a:	5b                   	pop    %rbx
  100c1b:	5d                   	pop    %rbp
  100c1c:	c3                   	retq   
    assert(cell_ >= console + CONSOLE_ROWS * CONSOLE_COLUMNS);
  100c1d:	b9 00 00 00 00       	mov    $0x0,%ecx
  100c22:	ba b8 16 10 00       	mov    $0x1016b8,%edx
  100c27:	be 2c 02 00 00       	mov    $0x22c,%esi
  100c2c:	bf 95 0f 10 00       	mov    $0x100f95,%edi
  100c31:	e8 c9 01 00 00       	callq  100dff <assert_fail(char const*, int, char const*, char const*)>
        memmove(console, console + CONSOLE_COLUMNS,
  100c36:	ba 00 0f 00 00       	mov    $0xf00,%edx
  100c3b:	be a0 80 0b 00       	mov    $0xb80a0,%esi
  100c40:	bf 00 80 0b 00       	mov    $0xb8000,%edi
  100c45:	e8 c8 f5 ff ff       	callq  100212 <memmove>
        memset(console + (CONSOLE_ROWS - 1) * CONSOLE_COLUMNS,
  100c4a:	ba a0 00 00 00       	mov    $0xa0,%edx
  100c4f:	be 00 00 00 00       	mov    $0x0,%esi
  100c54:	bf 00 8f 0b 00       	mov    $0xb8f00,%edi
  100c59:	e8 01 f6 ff ff       	callq  10025f <memset>
        cell_ -= CONSOLE_COLUMNS;
  100c5e:	48 81 6b 08 a0 00 00 	subq   $0xa0,0x8(%rbx)
  100c65:	00 
  100c66:	eb ae                	jmp    100c16 <console_printer::scroll()+0x28>

0000000000100c68 <console_printer::putc(unsigned char, int)>:
    extern void console_show_cursor(int);
    console_show_cursor(cursorpos);
#endif
}

inline void console_printer::putc(unsigned char c, int color) {
  100c68:	f3 0f 1e fa          	endbr64 
  100c6c:	55                   	push   %rbp
  100c6d:	48 89 e5             	mov    %rsp,%rbp
  100c70:	41 55                	push   %r13
  100c72:	41 54                	push   %r12
  100c74:	53                   	push   %rbx
  100c75:	48 83 ec 08          	sub    $0x8,%rsp
  100c79:	48 89 fb             	mov    %rdi,%rbx
  100c7c:	41 89 f5             	mov    %esi,%r13d
  100c7f:	41 89 d4             	mov    %edx,%r12d
    while (cell_ >= console + CONSOLE_ROWS * CONSOLE_COLUMNS) {
  100c82:	48 8b 47 08          	mov    0x8(%rdi),%rax
  100c86:	48 3d a0 8f 0b 00    	cmp    $0xb8fa0,%rax
  100c8c:	72 14                	jb     100ca2 <console_printer::putc(unsigned char, int)+0x3a>
        scroll();
  100c8e:	48 89 df             	mov    %rbx,%rdi
  100c91:	e8 58 ff ff ff       	callq  100bee <console_printer::scroll()>
    while (cell_ >= console + CONSOLE_ROWS * CONSOLE_COLUMNS) {
  100c96:	48 8b 43 08          	mov    0x8(%rbx),%rax
  100c9a:	48 3d a0 8f 0b 00    	cmp    $0xb8fa0,%rax
  100ca0:	73 ec                	jae    100c8e <console_printer::putc(unsigned char, int)+0x26>
    }
    if (c == '\n') {
  100ca2:	41 80 fd 0a          	cmp    $0xa,%r13b
  100ca6:	74 1e                	je     100cc6 <console_printer::putc(unsigned char, int)+0x5e>
        while (pos != 80) {
            *cell_++ = ' ' | color;
            ++pos;
        }
    } else {
        *cell_++ = c | color;
  100ca8:	48 8d 50 02          	lea    0x2(%rax),%rdx
  100cac:	48 89 53 08          	mov    %rdx,0x8(%rbx)
  100cb0:	45 0f b6 ed          	movzbl %r13b,%r13d
  100cb4:	45 09 ec             	or     %r13d,%r12d
  100cb7:	66 44 89 20          	mov    %r12w,(%rax)
    }
}
  100cbb:	48 83 c4 08          	add    $0x8,%rsp
  100cbf:	5b                   	pop    %rbx
  100cc0:	41 5c                	pop    %r12
  100cc2:	41 5d                	pop    %r13
  100cc4:	5d                   	pop    %rbp
  100cc5:	c3                   	retq   
        int pos = (cell_ - console) % 80;
  100cc6:	48 2d 00 80 0b 00    	sub    $0xb8000,%rax
  100ccc:	48 89 c1             	mov    %rax,%rcx
  100ccf:	48 89 c6             	mov    %rax,%rsi
  100cd2:	48 d1 fe             	sar    %rsi
  100cd5:	48 ba 67 66 66 66 66 	movabs $0x6666666666666667,%rdx
  100cdc:	66 66 66 
  100cdf:	48 89 f0             	mov    %rsi,%rax
  100ce2:	48 f7 ea             	imul   %rdx
  100ce5:	48 c1 fa 05          	sar    $0x5,%rdx
  100ce9:	48 89 c8             	mov    %rcx,%rax
  100cec:	48 c1 f8 3f          	sar    $0x3f,%rax
  100cf0:	48 29 c2             	sub    %rax,%rdx
  100cf3:	48 8d 04 92          	lea    (%rdx,%rdx,4),%rax
  100cf7:	48 c1 e0 04          	shl    $0x4,%rax
  100cfb:	89 f2                	mov    %esi,%edx
  100cfd:	29 c2                	sub    %eax,%edx
  100cff:	89 d0                	mov    %edx,%eax
            *cell_++ = ' ' | color;
  100d01:	41 83 cc 20          	or     $0x20,%r12d
  100d05:	48 8b 4b 08          	mov    0x8(%rbx),%rcx
  100d09:	48 8d 71 02          	lea    0x2(%rcx),%rsi
  100d0d:	48 89 73 08          	mov    %rsi,0x8(%rbx)
  100d11:	66 44 89 21          	mov    %r12w,(%rcx)
            ++pos;
  100d15:	83 c0 01             	add    $0x1,%eax
        while (pos != 80) {
  100d18:	83 f8 50             	cmp    $0x50,%eax
  100d1b:	75 e8                	jne    100d05 <console_printer::putc(unsigned char, int)+0x9d>
  100d1d:	eb 9c                	jmp    100cbb <console_printer::putc(unsigned char, int)+0x53>
  100d1f:	90                   	nop

0000000000100d20 <console_printer::move_cursor()>:
void console_printer::move_cursor() {
  100d20:	f3 0f 1e fa          	endbr64 
    cursorpos = cell_ - console;
  100d24:	48 8b 47 08          	mov    0x8(%rdi),%rax
  100d28:	48 2d 00 80 0b 00    	sub    $0xb8000,%rax
  100d2e:	48 d1 f8             	sar    %rax
  100d31:	89 05 c5 82 fb ff    	mov    %eax,-0x47d3b(%rip)        # b8ffc <cursorpos>
}
  100d37:	c3                   	retq   

0000000000100d38 <console_vprintf(int, int, char const*, __va_list_tag*)>:

// console_vprintf, console_printf
//    Print a message onto the console, starting at the given cursor position.

__noinline
int console_vprintf(int cpos, int color, const char* format, va_list val) {
  100d38:	f3 0f 1e fa          	endbr64 
  100d3c:	55                   	push   %rbp
  100d3d:	48 89 e5             	mov    %rsp,%rbp
  100d40:	41 56                	push   %r14
  100d42:	41 55                	push   %r13
  100d44:	41 54                	push   %r12
  100d46:	53                   	push   %rbx
  100d47:	48 83 ec 20          	sub    $0x20,%rsp
  100d4b:	89 fb                	mov    %edi,%ebx
  100d4d:	41 89 f4             	mov    %esi,%r12d
  100d50:	49 89 d5             	mov    %rdx,%r13
  100d53:	49 89 ce             	mov    %rcx,%r14
    console_printer cp(cpos, cpos < 0);
  100d56:	89 fa                	mov    %edi,%edx
  100d58:	c1 ea 1f             	shr    $0x1f,%edx
  100d5b:	89 fe                	mov    %edi,%esi
  100d5d:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
  100d61:	e8 40 fe ff ff       	callq  100ba6 <console_printer::console_printer(int, bool)>
    cp.vprintf(color, format, val);
  100d66:	4c 89 f1             	mov    %r14,%rcx
  100d69:	4c 89 ea             	mov    %r13,%rdx
  100d6c:	44 89 e6             	mov    %r12d,%esi
  100d6f:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
  100d73:	e8 34 f6 ff ff       	callq  1003ac <printer::vprintf(int, char const*, __va_list_tag*)>
    if (cpos < 0) {
  100d78:	85 db                	test   %ebx,%ebx
  100d7a:	78 1a                	js     100d96 <console_vprintf(int, int, char const*, __va_list_tag*)+0x5e>
        cp.move_cursor();
    }
    return cp.cell_ - console;
  100d7c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  100d80:	48 2d 00 80 0b 00    	sub    $0xb8000,%rax
  100d86:	48 d1 f8             	sar    %rax
}
  100d89:	48 83 c4 20          	add    $0x20,%rsp
  100d8d:	5b                   	pop    %rbx
  100d8e:	41 5c                	pop    %r12
  100d90:	41 5d                	pop    %r13
  100d92:	41 5e                	pop    %r14
  100d94:	5d                   	pop    %rbp
  100d95:	c3                   	retq   
        cp.move_cursor();
  100d96:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
  100d9a:	e8 81 ff ff ff       	callq  100d20 <console_printer::move_cursor()>
  100d9f:	eb db                	jmp    100d7c <console_vprintf(int, int, char const*, __va_list_tag*)+0x44>

0000000000100da1 <error_printf(char const*, ...)>:
    error_vprintf(-1, color, format, val);
    va_end(val);
}

__noinline
void error_printf(const char* format, ...) {
  100da1:	f3 0f 1e fa          	endbr64 
  100da5:	55                   	push   %rbp
  100da6:	48 89 e5             	mov    %rsp,%rbp
  100da9:	48 83 ec 50          	sub    $0x50,%rsp
  100dad:	48 89 75 d8          	mov    %rsi,-0x28(%rbp)
  100db1:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  100db5:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  100db9:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
  100dbd:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
  100dc1:	c7 45 b8 08 00 00 00 	movl   $0x8,-0x48(%rbp)
  100dc8:	48 8d 45 10          	lea    0x10(%rbp),%rax
  100dcc:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  100dd0:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  100dd4:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    error_vprintf(-1, COLOR_ERROR, format, val);
  100dd8:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
  100ddc:	48 89 fa             	mov    %rdi,%rdx
  100ddf:	be 00 c0 00 00       	mov    $0xc000,%esi
  100de4:	bf ff ff ff ff       	mov    $0xffffffff,%edi
  100de9:	e8 02 00 00 00       	callq  100df0 <error_vprintf(int, int, char const*, __va_list_tag*)>
    va_end(val);
}
  100dee:	c9                   	leaveq 
  100def:	c3                   	retq   

0000000000100df0 <error_vprintf(int, int, char const*, __va_list_tag*)>:
    }
    (void) console_printf(CPOS(23, 0), 0xC000, "%s", buf);
    sys_panic(nullptr);
}

int error_vprintf(int cpos, int color, const char* format, va_list val) {
  100df0:	f3 0f 1e fa          	endbr64 
  100df4:	55                   	push   %rbp
  100df5:	48 89 e5             	mov    %rsp,%rbp
    return console_vprintf(cpos, color, format, val);
  100df8:	e8 3b ff ff ff       	callq  100d38 <console_vprintf(int, int, char const*, __va_list_tag*)>
}
  100dfd:	5d                   	pop    %rbp
  100dfe:	c3                   	retq   

0000000000100dff <assert_fail(char const*, int, char const*, char const*)>:

void assert_fail(const char* file, int line, const char* msg,
                 const char* description) {
  100dff:	f3 0f 1e fa          	endbr64 
  100e03:	55                   	push   %rbp
  100e04:	48 89 e5             	mov    %rsp,%rbp
  100e07:	41 55                	push   %r13
  100e09:	41 54                	push   %r12
  100e0b:	53                   	push   %rbx
  100e0c:	48 83 ec 08          	sub    $0x8,%rsp
  100e10:	48 89 fb             	mov    %rdi,%rbx
  100e13:	41 89 f4             	mov    %esi,%r12d
  100e16:	49 89 d5             	mov    %rdx,%r13
    cursorpos = CPOS(23, 0);
  100e19:	c7 05 d9 81 fb ff 30 	movl   $0x730,-0x47e27(%rip)        # b8ffc <cursorpos>
  100e20:	07 00 00 
    if (description) {
  100e23:	48 85 c9             	test   %rcx,%rcx
  100e26:	74 11                	je     100e39 <assert_fail(char const*, int, char const*, char const*)+0x3a>
        error_printf("%s:%d: %s\n", file, line, description);
  100e28:	89 f2                	mov    %esi,%edx
  100e2a:	48 89 fe             	mov    %rdi,%rsi
  100e2d:	bf 3b 17 10 00       	mov    $0x10173b,%edi
  100e32:	b0 00                	mov    $0x0,%al
  100e34:	e8 68 ff ff ff       	callq  100da1 <error_printf(char const*, ...)>
    }
    error_printf("%s:%d: user assertion '%s' failed\n", file, line, msg);
  100e39:	4c 89 e9             	mov    %r13,%rcx
  100e3c:	44 89 e2             	mov    %r12d,%edx
  100e3f:	48 89 de             	mov    %rbx,%rsi
  100e42:	bf 48 17 10 00       	mov    $0x101748,%edi
  100e47:	b0 00                	mov    $0x0,%al
  100e49:	e8 53 ff ff ff       	callq  100da1 <error_printf(char const*, ...)>
    register uintptr_t rax asm("rax") = syscallno;
  100e4e:	b8 03 00 00 00       	mov    $0x3,%eax
            : "cc", "memory", "rcx", "rdx", "rsi", "r8", "r9", "r10", "r11");
  100e53:	bf 00 00 00 00       	mov    $0x0,%edi
  100e58:	0f 05                	syscall 
//    Panic.
[[noreturn]] inline void sys_panic(const char* msg) {
    make_syscall(SYSCALL_PANIC, (uintptr_t) msg);

    // should never get here
    while (true) {
  100e5a:	eb fe                	jmp    100e5a <assert_fail(char const*, int, char const*, char const*)+0x5b>

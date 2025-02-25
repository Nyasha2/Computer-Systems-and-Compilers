
obj/p-forkexit.full:     file format elf64-x86-64


Disassembly of section .text:

0000000000100000 <sys_exit()>:
    return make_syscall(SYSCALL_FORK);
}

// sys_exit()
//    Exit this process. Does not return.
[[noreturn]] inline void sys_exit() {
  100000:	f3 0f 1e fa          	endbr64 
    register uintptr_t rax asm("rax") = syscallno;
  100004:	b8 06 00 00 00       	mov    $0x6,%eax
              "r10", "r11");
  100009:	0f 05                	syscall 
    register uintptr_t rax asm("rax") = syscallno;
  10000b:	b8 03 00 00 00       	mov    $0x3,%eax
            : "cc", "memory", "rcx", "rdx", "rsi", "r8", "r9", "r10", "r11");
  100010:	bf 60 0e 10 00       	mov    $0x100e60,%edi
  100015:	0f 05                	syscall 
    make_syscall(SYSCALL_EXIT);
    make_syscall(SYSCALL_PANIC, (uintptr_t) "sys_exit should not return!");

    // should never get here
    while (true) {
  100017:	eb fe                	jmp    100017 <sys_exit()+0x17>

0000000000100019 <process_main()>:

// These global variables go on the data page.
uint8_t* heap_top;
uint8_t* stack_bottom;

void process_main() {
  100019:	f3 0f 1e fa          	endbr64 
  10001d:	55                   	push   %rbp
  10001e:	48 89 e5             	mov    %rsp,%rbp
  100021:	41 56                	push   %r14
  100023:	41 55                	push   %r13
  100025:	41 54                	push   %r12
  100027:	53                   	push   %rbx
  100028:	eb 13                	jmp    10003d <process_main()+0x24>
        if (x == 0) {
            // fork, then either exit or start allocating
            pid_t p = sys_fork();
            int choice = rand(0, 2);
            if (choice == 0 && p > 0) {
                sys_exit();
  10002a:	e8 d1 ff ff ff       	callq  100000 <sys_exit()>
            } else if (choice != 2 ? p > 0 : p == 0) {
  10002f:	85 db                	test   %ebx,%ebx
  100031:	0f 94 c2             	sete   %dl
  100034:	eb 45                	jmp    10007b <process_main()+0x62>
    register uintptr_t rax asm("rax") = syscallno;
  100036:	b8 02 00 00 00       	mov    $0x2,%eax
              "r10", "r11");
  10003b:	0f 05                	syscall 
        int x = rand(0, ALLOC_SLOWDOWN);
  10003d:	be 12 00 00 00       	mov    $0x12,%esi
  100042:	bf 00 00 00 00       	mov    $0x0,%edi
  100047:	e8 d6 02 00 00       	callq  100322 <rand(int, int)>
        if (x == 0) {
  10004c:	85 c0                	test   %eax,%eax
  10004e:	75 e6                	jne    100036 <process_main()+0x1d>
    register uintptr_t rax asm("rax") = syscallno;
  100050:	b8 05 00 00 00       	mov    $0x5,%eax
              "r10", "r11");
  100055:	0f 05                	syscall 
    return rax;
  100057:	48 89 c3             	mov    %rax,%rbx
            int choice = rand(0, 2);
  10005a:	be 02 00 00 00       	mov    $0x2,%esi
  10005f:	bf 00 00 00 00       	mov    $0x0,%edi
  100064:	e8 b9 02 00 00       	callq  100322 <rand(int, int)>
            if (choice == 0 && p > 0) {
  100069:	85 db                	test   %ebx,%ebx
  10006b:	0f 9f c2             	setg   %dl
  10006e:	85 c0                	test   %eax,%eax
  100070:	75 04                	jne    100076 <process_main()+0x5d>
  100072:	84 d2                	test   %dl,%dl
  100074:	75 b4                	jne    10002a <process_main()+0x11>
            } else if (choice != 2 ? p > 0 : p == 0) {
  100076:	83 f8 02             	cmp    $0x2,%eax
  100079:	74 b4                	je     10002f <process_main()+0x16>
  10007b:	84 d2                	test   %dl,%dl
  10007d:	74 be                	je     10003d <process_main()+0x24>
        } else {
            sys_yield();
        }
    }

    int speed = rand(1, 16);
  10007f:	be 10 00 00 00       	mov    $0x10,%esi
  100084:	bf 01 00 00 00       	mov    $0x1,%edi
  100089:	e8 94 02 00 00       	callq  100322 <rand(int, int)>
  10008e:	41 89 c4             	mov    %eax,%r12d
//    Return the smallest multiple of `m` greater than or equal to `x`.
//    Equivalently, round `x` up to the nearest multiple of `m`.
template <typename T>
inline constexpr T round_up(T x, unsigned m) {
    static_assert(std::is_unsigned<T>::value, "T must be unsigned");
    return round_down(x + m - 1, m);
  100091:	41 be 1b 30 10 00    	mov    $0x10301b,%r14d

    uint8_t* data_top = (uint8_t*) round_up((uintptr_t) end, PAGESIZE);
  100097:	49 81 e6 00 f0 ff ff 	and    $0xfffffffffffff000,%r14
    heap_top = data_top;
  10009e:	4c 89 35 63 1f 00 00 	mov    %r14,0x1f63(%rip)        # 102008 <heap_top>
    return x;
}

__always_inline uintptr_t rdrsp() {
    uintptr_t x;
    asm volatile("movq %%rsp, %0" : "=r" (x));
  1000a5:	48 89 e0             	mov    %rsp,%rax
    stack_bottom = (uint8_t*) round_down((uintptr_t) rdrsp() - 1, PAGESIZE);
  1000a8:	48 83 e8 01          	sub    $0x1,%rax
  1000ac:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  1000b2:	48 89 05 47 1f 00 00 	mov    %rax,0x1f47(%rip)        # 102000 <stack_bottom>
    unsigned nalloc = 0;

    // Allocate heap pages until out of address space,
    // forking along the way.
    while (heap_top != stack_bottom) {
  1000b9:	4c 39 f0             	cmp    %r14,%rax
  1000bc:	0f 84 14 01 00 00    	je     1001d6 <process_main()+0x1bd>
    unsigned nalloc = 0;
  1000c2:	bb 00 00 00 00       	mov    $0x0,%ebx
        if (rand(0, 6 * ALLOC_SLOWDOWN) >= 8 * speed) {
            sys_yield();
            continue;
        }

        int x = rand(0, 7 + min(nalloc / 4, 10U));
  1000c7:	41 bd 0a 00 00 00    	mov    $0xa,%r13d
  1000cd:	e9 86 00 00 00       	jmpq   100158 <process_main()+0x13f>
  1000d2:	89 de                	mov    %ebx,%esi
  1000d4:	c1 ee 02             	shr    $0x2,%esi
  1000d7:	83 fb 2b             	cmp    $0x2b,%ebx
  1000da:	41 0f 47 f5          	cmova  %r13d,%esi
  1000de:	83 c6 07             	add    $0x7,%esi
  1000e1:	bf 00 00 00 00       	mov    $0x0,%edi
  1000e6:	e8 37 02 00 00       	callq  100322 <rand(int, int)>
        if (x < 2) {
  1000eb:	83 f8 01             	cmp    $0x1,%eax
  1000ee:	0f 8e 8e 00 00 00    	jle    100182 <process_main()+0x169>
            if (sys_fork() == 0) {
                speed = rand(1, 16);
            }
        } else if (x < 3) {
  1000f4:	83 f8 02             	cmp    $0x2,%eax
  1000f7:	0f 8e a4 00 00 00    	jle    1001a1 <process_main()+0x188>
    register uintptr_t rax asm("rax") = syscallno;
  1000fd:	b8 04 00 00 00       	mov    $0x4,%eax
            : "cc", "memory", "rcx", "rdx", "rsi", "r8", "r9", "r10", "r11");
  100102:	48 8b 3d ff 1e 00 00 	mov    0x1eff(%rip),%rdi        # 102008 <heap_top>
  100109:	0f 05                	syscall 
            sys_exit();
        } else if (sys_page_alloc(heap_top) >= 0) {
  10010b:	85 c0                	test   %eax,%eax
  10010d:	0f 88 b1 00 00 00    	js     1001c4 <process_main()+0x1ab>
            *heap_top = speed;
  100113:	48 8b 05 ee 1e 00 00 	mov    0x1eee(%rip),%rax        # 102008 <heap_top>
  10011a:	44 88 20             	mov    %r12b,(%rax)
            console[CPOS(24, 79)] = speed;
  10011d:	66 44 89 25 79 8e fb 	mov    %r12w,-0x47187(%rip)        # b8f9e <console+0xf9e>
  100124:	ff 
            heap_top += PAGESIZE;
  100125:	48 81 05 d8 1e 00 00 	addq   $0x1000,0x1ed8(%rip)        # 102008 <heap_top>
  10012c:	00 10 00 00 
            if (console[CPOS(24, 0)]) {
  100130:	66 83 3d c8 8d fb ff 	cmpw   $0x0,-0x47238(%rip)        # b8f00 <console+0xf00>
  100137:	00 
  100138:	75 6c                	jne    1001a6 <process_main()+0x18d>
                // clear "Out of physical memory" msg
                console_printf(CPOS(24, 0), 0, "\n");
            }
            nalloc = (heap_top - data_top) / PAGESIZE;
  10013a:	48 8b 1d c7 1e 00 00 	mov    0x1ec7(%rip),%rbx        # 102008 <heap_top>
  100141:	4c 29 f3             	sub    %r14,%rbx
  100144:	48 c1 eb 0c          	shr    $0xc,%rbx
    while (heap_top != stack_bottom) {
  100148:	48 8b 05 b1 1e 00 00 	mov    0x1eb1(%rip),%rax        # 102000 <stack_bottom>
  10014f:	48 39 05 b2 1e 00 00 	cmp    %rax,0x1eb2(%rip)        # 102008 <heap_top>
  100156:	74 7e                	je     1001d6 <process_main()+0x1bd>
        if (rand(0, 6 * ALLOC_SLOWDOWN) >= 8 * speed) {
  100158:	be 6c 00 00 00       	mov    $0x6c,%esi
  10015d:	bf 00 00 00 00       	mov    $0x0,%edi
  100162:	e8 bb 01 00 00       	callq  100322 <rand(int, int)>
  100167:	89 c2                	mov    %eax,%edx
  100169:	42 8d 04 e5 00 00 00 	lea    0x0(,%r12,8),%eax
  100170:	00 
  100171:	39 c2                	cmp    %eax,%edx
  100173:	0f 8c 59 ff ff ff    	jl     1000d2 <process_main()+0xb9>
    register uintptr_t rax asm("rax") = syscallno;
  100179:	b8 02 00 00 00       	mov    $0x2,%eax
              "r10", "r11");
  10017e:	0f 05                	syscall 
            continue;
  100180:	eb c6                	jmp    100148 <process_main()+0x12f>
    register uintptr_t rax asm("rax") = syscallno;
  100182:	b8 05 00 00 00       	mov    $0x5,%eax
              "r10", "r11");
  100187:	0f 05                	syscall 
            if (sys_fork() == 0) {
  100189:	85 c0                	test   %eax,%eax
  10018b:	75 bb                	jne    100148 <process_main()+0x12f>
                speed = rand(1, 16);
  10018d:	be 10 00 00 00       	mov    $0x10,%esi
  100192:	bf 01 00 00 00       	mov    $0x1,%edi
  100197:	e8 86 01 00 00       	callq  100322 <rand(int, int)>
  10019c:	41 89 c4             	mov    %eax,%r12d
  10019f:	eb a7                	jmp    100148 <process_main()+0x12f>
            sys_exit();
  1001a1:	e8 5a fe ff ff       	callq  100000 <sys_exit()>
                console_printf(CPOS(24, 0), 0, "\n");
  1001a6:	ba 34 16 10 00       	mov    $0x101634,%edx
  1001ab:	be 00 00 00 00       	mov    $0x0,%esi
  1001b0:	bf 80 07 00 00       	mov    $0x780,%edi
  1001b5:	b8 00 00 00 00       	mov    $0x0,%eax
  1001ba:	e8 a8 0b 00 00       	callq  100d67 <console_printf(int, int, char const*, ...)>
  1001bf:	e9 76 ff ff ff       	jmpq   10013a <process_main()+0x121>
        } else if (nalloc < 4) {
  1001c4:	83 fb 03             	cmp    $0x3,%ebx
  1001c7:	76 08                	jbe    1001d1 <process_main()+0x1b8>
            sys_exit();
        } else {
            nalloc -= 4;
  1001c9:	83 eb 04             	sub    $0x4,%ebx
  1001cc:	e9 77 ff ff ff       	jmpq   100148 <process_main()+0x12f>
            sys_exit();
  1001d1:	e8 2a fe ff ff       	callq  100000 <sys_exit()>
        }
    }

    // After running out of memory
    while (true) {
        if (rand(0, 2 * ALLOC_SLOWDOWN - 1) == 0) {
  1001d6:	be 23 00 00 00       	mov    $0x23,%esi
  1001db:	bf 00 00 00 00       	mov    $0x0,%edi
  1001e0:	e8 3d 01 00 00       	callq  100322 <rand(int, int)>
  1001e5:	85 c0                	test   %eax,%eax
  1001e7:	74 09                	je     1001f2 <process_main()+0x1d9>
    register uintptr_t rax asm("rax") = syscallno;
  1001e9:	b8 02 00 00 00       	mov    $0x2,%eax
              "r10", "r11");
  1001ee:	0f 05                	syscall 
}
  1001f0:	eb e4                	jmp    1001d6 <process_main()+0x1bd>
            sys_exit();
  1001f2:	e8 09 fe ff ff       	callq  100000 <sys_exit()>

00000000001001f7 <memmove>:
        *d = *s;
    }
    return dst;
}

void* memmove(void* dst, const void* src, size_t n) {
  1001f7:	f3 0f 1e fa          	endbr64 
  1001fb:	48 89 f8             	mov    %rdi,%rax
    const char* s = (const char*) src;
    char* d = (char*) dst;
    if (s < d && s + n > d) {
  1001fe:	48 39 fe             	cmp    %rdi,%rsi
  100201:	73 09                	jae    10020c <memmove+0x15>
  100203:	48 8d 0c 16          	lea    (%rsi,%rdx,1),%rcx
  100207:	48 39 cf             	cmp    %rcx,%rdi
  10020a:	72 1d                	jb     100229 <memmove+0x32>
        s += n, d += n;
        while (n-- > 0) {
            *--d = *--s;
        }
    } else {
        while (n-- > 0) {
  10020c:	b9 00 00 00 00       	mov    $0x0,%ecx
  100211:	48 85 d2             	test   %rdx,%rdx
  100214:	74 12                	je     100228 <memmove+0x31>
            *d++ = *s++;
  100216:	0f b6 3c 0e          	movzbl (%rsi,%rcx,1),%edi
  10021a:	40 88 3c 08          	mov    %dil,(%rax,%rcx,1)
        while (n-- > 0) {
  10021e:	48 83 c1 01          	add    $0x1,%rcx
  100222:	48 39 d1             	cmp    %rdx,%rcx
  100225:	75 ef                	jne    100216 <memmove+0x1f>
        }
    }
    return dst;
}
  100227:	c3                   	retq   
  100228:	c3                   	retq   
        while (n-- > 0) {
  100229:	48 8d 4a ff          	lea    -0x1(%rdx),%rcx
  10022d:	48 85 d2             	test   %rdx,%rdx
  100230:	74 f5                	je     100227 <memmove+0x30>
            *--d = *--s;
  100232:	0f b6 14 0e          	movzbl (%rsi,%rcx,1),%edx
  100236:	88 14 08             	mov    %dl,(%rax,%rcx,1)
        while (n-- > 0) {
  100239:	48 83 e9 01          	sub    $0x1,%rcx
  10023d:	48 83 f9 ff          	cmp    $0xffffffffffffffff,%rcx
  100241:	75 ef                	jne    100232 <memmove+0x3b>
  100243:	c3                   	retq   

0000000000100244 <memset>:

void* memset(void* v, int c, size_t n) {
  100244:	f3 0f 1e fa          	endbr64 
  100248:	48 89 f8             	mov    %rdi,%rax
    for (char* p = (char*) v; n > 0; ++p, --n) {
  10024b:	48 85 d2             	test   %rdx,%rdx
  10024e:	74 13                	je     100263 <memset+0x1f>
  100250:	48 8d 0c 17          	lea    (%rdi,%rdx,1),%rcx
  100254:	48 89 fa             	mov    %rdi,%rdx
        *p = c;
  100257:	40 88 32             	mov    %sil,(%rdx)
    for (char* p = (char*) v; n > 0; ++p, --n) {
  10025a:	48 83 c2 01          	add    $0x1,%rdx
  10025e:	48 39 d1             	cmp    %rdx,%rcx
  100261:	75 f4                	jne    100257 <memset+0x13>
    }
    return v;
}
  100263:	c3                   	retq   

0000000000100264 <strlen>:
        }
    }
    return nullptr;
}

size_t strlen(const char* s) {
  100264:	f3 0f 1e fa          	endbr64 
    size_t n;
    for (n = 0; *s != '\0'; ++s) {
  100268:	80 3f 00             	cmpb   $0x0,(%rdi)
  10026b:	74 10                	je     10027d <strlen+0x19>
  10026d:	b8 00 00 00 00       	mov    $0x0,%eax
        ++n;
  100272:	48 83 c0 01          	add    $0x1,%rax
    for (n = 0; *s != '\0'; ++s) {
  100276:	80 3c 07 00          	cmpb   $0x0,(%rdi,%rax,1)
  10027a:	75 f6                	jne    100272 <strlen+0xe>
  10027c:	c3                   	retq   
  10027d:	b8 00 00 00 00       	mov    $0x0,%eax
    }
    return n;
}
  100282:	c3                   	retq   

0000000000100283 <strnlen>:

size_t strnlen(const char* s, size_t maxlen) {
  100283:	f3 0f 1e fa          	endbr64 
    size_t n;
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
  100287:	48 85 f6             	test   %rsi,%rsi
  10028a:	74 15                	je     1002a1 <strnlen+0x1e>
  10028c:	b8 00 00 00 00       	mov    $0x0,%eax
  100291:	80 3c 07 00          	cmpb   $0x0,(%rdi,%rax,1)
  100295:	74 0d                	je     1002a4 <strnlen+0x21>
        ++n;
  100297:	48 83 c0 01          	add    $0x1,%rax
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
  10029b:	48 39 c6             	cmp    %rax,%rsi
  10029e:	75 f1                	jne    100291 <strnlen+0xe>
  1002a0:	c3                   	retq   
  1002a1:	48 89 f0             	mov    %rsi,%rax
    }
    return n;
}
  1002a4:	c3                   	retq   

00000000001002a5 <strchr>:
        }
        ++a, ++b, --n;
    }
}

char* strchr(const char* s, int c) {
  1002a5:	f3 0f 1e fa          	endbr64 
    while (*s && *s != (char) c) {
  1002a9:	0f b6 07             	movzbl (%rdi),%eax
  1002ac:	84 c0                	test   %al,%al
  1002ae:	74 10                	je     1002c0 <strchr+0x1b>
  1002b0:	40 38 f0             	cmp    %sil,%al
  1002b3:	74 18                	je     1002cd <strchr+0x28>
        ++s;
  1002b5:	48 83 c7 01          	add    $0x1,%rdi
    while (*s && *s != (char) c) {
  1002b9:	0f b6 07             	movzbl (%rdi),%eax
  1002bc:	84 c0                	test   %al,%al
  1002be:	75 f0                	jne    1002b0 <strchr+0xb>
    }
    if (*s == (char) c) {
        return (char*) s;
    } else {
        return nullptr;
  1002c0:	40 84 f6             	test   %sil,%sil
  1002c3:	b8 00 00 00 00       	mov    $0x0,%eax
  1002c8:	48 0f 44 c7          	cmove  %rdi,%rax
  1002cc:	c3                   	retq   
  1002cd:	48 89 f8             	mov    %rdi,%rax
    }
}
  1002d0:	c3                   	retq   

00000000001002d1 <rand()>:
// rand, srand

static int rand_seed_set;
static unsigned long rand_seed;

int rand() {
  1002d1:	f3 0f 1e fa          	endbr64 
    if (!rand_seed_set) {
  1002d5:	83 3d 3c 1d 00 00 00 	cmpl   $0x0,0x1d3c(%rip)        # 102018 <rand_seed_set>
  1002dc:	74 27                	je     100305 <rand()+0x34>
        srand(819234718U);
    }
    rand_seed = rand_seed * 6364136223846793005UL + 1;
  1002de:	48 b8 2d 7f 95 4c 2d 	movabs $0x5851f42d4c957f2d,%rax
  1002e5:	f4 51 58 
  1002e8:	48 0f af 05 20 1d 00 	imul   0x1d20(%rip),%rax        # 102010 <rand_seed>
  1002ef:	00 
  1002f0:	48 83 c0 01          	add    $0x1,%rax
  1002f4:	48 89 05 15 1d 00 00 	mov    %rax,0x1d15(%rip)        # 102010 <rand_seed>
    return (rand_seed >> 32) & RAND_MAX;
  1002fb:	48 c1 e8 20          	shr    $0x20,%rax
  1002ff:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
}
  100304:	c3                   	retq   

void srand(unsigned seed) {
    rand_seed = ((unsigned long) seed << 32) | seed;
  100305:	48 b8 9e 87 d4 30 9e 	movabs $0x30d4879e30d4879e,%rax
  10030c:	87 d4 30 
  10030f:	48 89 05 fa 1c 00 00 	mov    %rax,0x1cfa(%rip)        # 102010 <rand_seed>
    rand_seed_set = 1;
  100316:	c7 05 f8 1c 00 00 01 	movl   $0x1,0x1cf8(%rip)        # 102018 <rand_seed_set>
  10031d:	00 00 00 
}
  100320:	eb bc                	jmp    1002de <rand()+0xd>

0000000000100322 <rand(int, int)>:

// rand(min, max)
//    Return a pseudorandom number roughly evenly distributed between
//    `min` and `max`, inclusive. Requires `min <= max` and
//    `max - min <= RAND_MAX`.
int rand(int min, int max) {
  100322:	f3 0f 1e fa          	endbr64 
  100326:	55                   	push   %rbp
  100327:	48 89 e5             	mov    %rsp,%rbp
  10032a:	41 54                	push   %r12
  10032c:	53                   	push   %rbx
    assert(min <= max);
  10032d:	39 f7                	cmp    %esi,%edi
  10032f:	7f 27                	jg     100358 <rand(int, int)+0x36>
  100331:	41 89 fc             	mov    %edi,%r12d
  100334:	89 f3                	mov    %esi,%ebx
    assert(max - min <= RAND_MAX);

    unsigned long r = rand();
  100336:	e8 96 ff ff ff       	callq  1002d1 <rand()>
  10033b:	89 c2                	mov    %eax,%edx
    return min + (r * (max - min + 1)) / ((unsigned long) RAND_MAX + 1);
  10033d:	44 29 e3             	sub    %r12d,%ebx
  100340:	8d 43 01             	lea    0x1(%rbx),%eax
  100343:	48 98                	cltq   
    unsigned long r = rand();
  100345:	48 63 da             	movslq %edx,%rbx
    return min + (r * (max - min + 1)) / ((unsigned long) RAND_MAX + 1);
  100348:	48 0f af c3          	imul   %rbx,%rax
  10034c:	48 c1 e8 1f          	shr    $0x1f,%rax
  100350:	44 01 e0             	add    %r12d,%eax
}
  100353:	5b                   	pop    %rbx
  100354:	41 5c                	pop    %r12
  100356:	5d                   	pop    %rbp
  100357:	c3                   	retq   
    assert(min <= max);
  100358:	b9 00 00 00 00       	mov    $0x0,%ecx
  10035d:	ba 7c 0e 10 00       	mov    $0x100e7c,%edx
  100362:	be ff 00 00 00       	mov    $0xff,%esi
  100367:	bf 87 0e 10 00       	mov    $0x100e87,%edi
  10036c:	e8 8e 0a 00 00       	callq  100dff <assert_fail(char const*, int, char const*, char const*)>
  100371:	90                   	nop

0000000000100372 <printer::vprintf(int, char const*, __va_list_tag*)>:
#define FLAG_NUMERIC            (1<<5)
#define FLAG_SIGNED             (1<<6)
#define FLAG_NEGATIVE           (1<<7)
#define FLAG_ALT2               (1<<8)

void printer::vprintf(int color, const char* format, va_list val) {
  100372:	f3 0f 1e fa          	endbr64 
  100376:	55                   	push   %rbp
  100377:	48 89 e5             	mov    %rsp,%rbp
  10037a:	41 57                	push   %r15
  10037c:	41 56                	push   %r14
  10037e:	41 55                	push   %r13
  100380:	41 54                	push   %r12
  100382:	53                   	push   %rbx
  100383:	48 83 ec 58          	sub    $0x58,%rsp
  100387:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
#define NUMBUFSIZ 24
    char numbuf[NUMBUFSIZ];

    for (; *format; ++format) {
  10038b:	0f b6 02             	movzbl (%rdx),%eax
  10038e:	84 c0                	test   %al,%al
  100390:	0f 84 c6 07 00 00    	je     100b5c <printer::vprintf(int, char const*, __va_list_tag*)+0x7ea>
  100396:	49 89 fe             	mov    %rdi,%r14
  100399:	41 89 f7             	mov    %esi,%r15d
  10039c:	48 89 d3             	mov    %rdx,%rbx
  10039f:	e9 b9 03 00 00       	jmpq   10075d <printer::vprintf(int, char const*, __va_list_tag*)+0x3eb>
            continue;
        }

        // process flags
        int flags = 0;
        for (++format; *format; ++format) {
  1003a4:	4c 8d 63 01          	lea    0x1(%rbx),%r12
  1003a8:	0f b6 5b 01          	movzbl 0x1(%rbx),%ebx
  1003ac:	84 db                	test   %bl,%bl
  1003ae:	0f 84 8a 07 00 00    	je     100b3e <printer::vprintf(int, char const*, __va_list_tag*)+0x7cc>
        int flags = 0;
  1003b4:	41 bd 00 00 00 00    	mov    $0x0,%r13d
            const char* flagc = strchr(flag_chars, *format);
  1003ba:	0f be f3             	movsbl %bl,%esi
  1003bd:	bf 60 15 10 00       	mov    $0x101560,%edi
  1003c2:	e8 de fe ff ff       	callq  1002a5 <strchr>
  1003c7:	48 89 c1             	mov    %rax,%rcx
            if (flagc) {
  1003ca:	48 85 c0             	test   %rax,%rax
  1003cd:	74 74                	je     100443 <printer::vprintf(int, char const*, __va_list_tag*)+0xd1>
                flags |= 1 << (flagc - flag_chars);
  1003cf:	48 81 e9 60 15 10 00 	sub    $0x101560,%rcx
  1003d6:	b8 01 00 00 00       	mov    $0x1,%eax
  1003db:	d3 e0                	shl    %cl,%eax
  1003dd:	41 09 c5             	or     %eax,%r13d
        for (++format; *format; ++format) {
  1003e0:	49 83 c4 01          	add    $0x1,%r12
  1003e4:	41 0f b6 1c 24       	movzbl (%r12),%ebx
  1003e9:	84 db                	test   %bl,%bl
  1003eb:	75 cd                	jne    1003ba <printer::vprintf(int, char const*, __va_list_tag*)+0x48>
                break;
            }
        }

        // process width
        int width = -1;
  1003ed:	c7 45 98 ff ff ff ff 	movl   $0xffffffff,-0x68(%rbp)
            width = va_arg(val, int);
            ++format;
        }

        // process precision
        int precision = -1;
  1003f4:	c7 45 a4 ff ff ff ff 	movl   $0xffffffff,-0x5c(%rbp)
        if (*format == '.') {
  1003fb:	41 80 3c 24 2e       	cmpb   $0x2e,(%r12)
  100400:	0f 84 cc 00 00 00    	je     1004d2 <printer::vprintf(int, char const*, __va_list_tag*)+0x160>
            }
        }

        // process length
        int length = 0;
        switch (*format) {
  100406:	41 0f b6 04 24       	movzbl (%r12),%eax
  10040b:	3c 6c                	cmp    $0x6c,%al
  10040d:	0f 84 54 01 00 00    	je     100567 <printer::vprintf(int, char const*, __va_list_tag*)+0x1f5>
  100413:	0f 8f 42 01 00 00    	jg     10055b <printer::vprintf(int, char const*, __va_list_tag*)+0x1e9>
  100419:	3c 68                	cmp    $0x68,%al
  10041b:	0f 85 68 01 00 00    	jne    100589 <printer::vprintf(int, char const*, __va_list_tag*)+0x217>
        case 'z': // size_t, ssize_t
            length = 1;
            ++format;
            break;
        case 'h':
            ++format;
  100421:	49 8d 4c 24 01       	lea    0x1(%r12),%rcx
        // process main conversion character
        int base = 10;
        unsigned long num = 0;
        const char* data = "";

        switch (*format) {
  100426:	41 0f b6 44 24 01    	movzbl 0x1(%r12),%eax
  10042c:	8d 50 bd             	lea    -0x43(%rax),%edx
  10042f:	80 fa 35             	cmp    $0x35,%dl
  100432:	0f 87 aa 05 00 00    	ja     1009e2 <printer::vprintf(int, char const*, __va_list_tag*)+0x670>
  100438:	0f b6 d2             	movzbl %dl,%edx
  10043b:	3e ff 24 d5 a0 0e 10 	notrack jmpq *0x100ea0(,%rdx,8)
  100442:	00 
        if (*format >= '1' && *format <= '9') {
  100443:	8d 43 cf             	lea    -0x31(%rbx),%eax
  100446:	3c 08                	cmp    $0x8,%al
  100448:	77 35                	ja     10047f <printer::vprintf(int, char const*, __va_list_tag*)+0x10d>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  10044a:	41 0f b6 04 24       	movzbl (%r12),%eax
  10044f:	8d 50 d0             	lea    -0x30(%rax),%edx
  100452:	80 fa 09             	cmp    $0x9,%dl
  100455:	77 63                	ja     1004ba <printer::vprintf(int, char const*, __va_list_tag*)+0x148>
  100457:	ba 00 00 00 00       	mov    $0x0,%edx
                width = 10 * width + *format++ - '0';
  10045c:	49 83 c4 01          	add    $0x1,%r12
  100460:	8d 14 92             	lea    (%rdx,%rdx,4),%edx
  100463:	0f be c0             	movsbl %al,%eax
  100466:	8d 54 50 d0          	lea    -0x30(%rax,%rdx,2),%edx
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  10046a:	41 0f b6 04 24       	movzbl (%r12),%eax
  10046f:	8d 48 d0             	lea    -0x30(%rax),%ecx
  100472:	80 f9 09             	cmp    $0x9,%cl
  100475:	76 e5                	jbe    10045c <printer::vprintf(int, char const*, __va_list_tag*)+0xea>
  100477:	89 55 98             	mov    %edx,-0x68(%rbp)
  10047a:	e9 75 ff ff ff       	jmpq   1003f4 <printer::vprintf(int, char const*, __va_list_tag*)+0x82>
        } else if (*format == '*') {
  10047f:	80 fb 2a             	cmp    $0x2a,%bl
  100482:	75 42                	jne    1004c6 <printer::vprintf(int, char const*, __va_list_tag*)+0x154>
            width = va_arg(val, int);
  100484:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  100488:	8b 07                	mov    (%rdi),%eax
  10048a:	83 f8 2f             	cmp    $0x2f,%eax
  10048d:	77 19                	ja     1004a8 <printer::vprintf(int, char const*, __va_list_tag*)+0x136>
  10048f:	89 c2                	mov    %eax,%edx
  100491:	48 03 57 10          	add    0x10(%rdi),%rdx
  100495:	83 c0 08             	add    $0x8,%eax
  100498:	89 07                	mov    %eax,(%rdi)
  10049a:	8b 02                	mov    (%rdx),%eax
  10049c:	89 45 98             	mov    %eax,-0x68(%rbp)
            ++format;
  10049f:	49 83 c4 01          	add    $0x1,%r12
  1004a3:	e9 4c ff ff ff       	jmpq   1003f4 <printer::vprintf(int, char const*, __va_list_tag*)+0x82>
            width = va_arg(val, int);
  1004a8:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1004ac:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  1004b0:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1004b4:	48 89 47 08          	mov    %rax,0x8(%rdi)
  1004b8:	eb e0                	jmp    10049a <printer::vprintf(int, char const*, __va_list_tag*)+0x128>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  1004ba:	c7 45 98 00 00 00 00 	movl   $0x0,-0x68(%rbp)
  1004c1:	e9 2e ff ff ff       	jmpq   1003f4 <printer::vprintf(int, char const*, __va_list_tag*)+0x82>
        int width = -1;
  1004c6:	c7 45 98 ff ff ff ff 	movl   $0xffffffff,-0x68(%rbp)
  1004cd:	e9 22 ff ff ff       	jmpq   1003f4 <printer::vprintf(int, char const*, __va_list_tag*)+0x82>
            ++format;
  1004d2:	49 8d 54 24 01       	lea    0x1(%r12),%rdx
            if (*format >= '0' && *format <= '9') {
  1004d7:	41 0f b6 44 24 01    	movzbl 0x1(%r12),%eax
  1004dd:	8d 48 d0             	lea    -0x30(%rax),%ecx
  1004e0:	80 f9 09             	cmp    $0x9,%cl
  1004e3:	76 13                	jbe    1004f8 <printer::vprintf(int, char const*, __va_list_tag*)+0x186>
            } else if (*format == '*') {
  1004e5:	3c 2a                	cmp    $0x2a,%al
  1004e7:	74 32                	je     10051b <printer::vprintf(int, char const*, __va_list_tag*)+0x1a9>
            ++format;
  1004e9:	49 89 d4             	mov    %rdx,%r12
                precision = 0;
  1004ec:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%rbp)
  1004f3:	e9 0e ff ff ff       	jmpq   100406 <printer::vprintf(int, char const*, __va_list_tag*)+0x94>
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
  1004f8:	be 00 00 00 00       	mov    $0x0,%esi
                    precision = 10 * precision + *format++ - '0';
  1004fd:	48 83 c2 01          	add    $0x1,%rdx
  100501:	8d 0c b6             	lea    (%rsi,%rsi,4),%ecx
  100504:	0f be c0             	movsbl %al,%eax
  100507:	8d 74 48 d0          	lea    -0x30(%rax,%rcx,2),%esi
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
  10050b:	0f b6 02             	movzbl (%rdx),%eax
  10050e:	8d 48 d0             	lea    -0x30(%rax),%ecx
  100511:	80 f9 09             	cmp    $0x9,%cl
  100514:	76 e7                	jbe    1004fd <printer::vprintf(int, char const*, __va_list_tag*)+0x18b>
                    precision = 10 * precision + *format++ - '0';
  100516:	49 89 d4             	mov    %rdx,%r12
  100519:	eb 1c                	jmp    100537 <printer::vprintf(int, char const*, __va_list_tag*)+0x1c5>
                precision = va_arg(val, int);
  10051b:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  10051f:	8b 01                	mov    (%rcx),%eax
  100521:	83 f8 2f             	cmp    $0x2f,%eax
  100524:	77 23                	ja     100549 <printer::vprintf(int, char const*, __va_list_tag*)+0x1d7>
  100526:	89 c2                	mov    %eax,%edx
  100528:	48 03 51 10          	add    0x10(%rcx),%rdx
  10052c:	83 c0 08             	add    $0x8,%eax
  10052f:	89 01                	mov    %eax,(%rcx)
  100531:	8b 32                	mov    (%rdx),%esi
                ++format;
  100533:	49 83 c4 02          	add    $0x2,%r12
            if (precision < 0) {
  100537:	85 f6                	test   %esi,%esi
  100539:	b8 00 00 00 00       	mov    $0x0,%eax
  10053e:	0f 49 c6             	cmovns %esi,%eax
  100541:	89 45 a4             	mov    %eax,-0x5c(%rbp)
  100544:	e9 bd fe ff ff       	jmpq   100406 <printer::vprintf(int, char const*, __va_list_tag*)+0x94>
                precision = va_arg(val, int);
  100549:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  10054d:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  100551:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100555:	48 89 47 08          	mov    %rax,0x8(%rdi)
  100559:	eb d6                	jmp    100531 <printer::vprintf(int, char const*, __va_list_tag*)+0x1bf>
        switch (*format) {
  10055b:	3c 74                	cmp    $0x74,%al
  10055d:	74 08                	je     100567 <printer::vprintf(int, char const*, __va_list_tag*)+0x1f5>
  10055f:	3c 7a                	cmp    $0x7a,%al
  100561:	0f 85 e2 05 00 00    	jne    100b49 <printer::vprintf(int, char const*, __va_list_tag*)+0x7d7>
            ++format;
  100567:	49 8d 4c 24 01       	lea    0x1(%r12),%rcx
        switch (*format) {
  10056c:	41 0f b6 44 24 01    	movzbl 0x1(%r12),%eax
  100572:	8d 50 bd             	lea    -0x43(%rax),%edx
  100575:	80 fa 35             	cmp    $0x35,%dl
  100578:	0f 87 64 04 00 00    	ja     1009e2 <printer::vprintf(int, char const*, __va_list_tag*)+0x670>
  10057e:	0f b6 d2             	movzbl %dl,%edx
  100581:	3e ff 24 d5 50 10 10 	notrack jmpq *0x101050(,%rdx,8)
  100588:	00 
  100589:	8d 50 bd             	lea    -0x43(%rax),%edx
  10058c:	80 fa 35             	cmp    $0x35,%dl
  10058f:	0f 87 4a 04 00 00    	ja     1009df <printer::vprintf(int, char const*, __va_list_tag*)+0x66d>
  100595:	0f b6 d2             	movzbl %dl,%edx
  100598:	3e ff 24 d5 00 12 10 	notrack jmpq *0x101200(,%rdx,8)
  10059f:	00 
        case 'd':
        case 'i': {
            long x = length ? va_arg(val, long) : va_arg(val, int);
  1005a0:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1005a4:	8b 07                	mov    (%rdi),%eax
  1005a6:	83 f8 2f             	cmp    $0x2f,%eax
  1005a9:	0f 87 c9 01 00 00    	ja     100778 <printer::vprintf(int, char const*, __va_list_tag*)+0x406>
  1005af:	89 c2                	mov    %eax,%edx
  1005b1:	48 03 57 10          	add    0x10(%rdi),%rdx
  1005b5:	83 c0 08             	add    $0x8,%eax
  1005b8:	89 07                	mov    %eax,(%rdi)
  1005ba:	48 8b 12             	mov    (%rdx),%rdx
  1005bd:	49 89 cc             	mov    %rcx,%r12
            int negative = x < 0 ? FLAG_NEGATIVE : 0;
  1005c0:	48 89 d0             	mov    %rdx,%rax
  1005c3:	48 c1 f8 38          	sar    $0x38,%rax
            num = negative ? -x : x;
  1005c7:	49 89 d0             	mov    %rdx,%r8
  1005ca:	49 f7 d8             	neg    %r8
  1005cd:	25 80 00 00 00       	and    $0x80,%eax
  1005d2:	4c 0f 44 c2          	cmove  %rdx,%r8
            flags |= FLAG_NUMERIC | FLAG_SIGNED | negative;
  1005d6:	41 09 c5             	or     %eax,%r13d
  1005d9:	41 83 cd 60          	or     $0x60,%r13d
        const char* data = "";
  1005dd:	bb 35 16 10 00       	mov    $0x101635,%ebx
                format--;
            }
            break;
        }

        if (flags & FLAG_NUMERIC) {
  1005e2:	44 89 e8             	mov    %r13d,%eax
  1005e5:	83 e0 20             	and    $0x20,%eax
  1005e8:	89 45 9c             	mov    %eax,-0x64(%rbp)
  1005eb:	41 b9 0a 00 00 00    	mov    $0xa,%r9d
  1005f1:	0f 85 0e 04 00 00    	jne    100a05 <printer::vprintf(int, char const*, __va_list_tag*)+0x693>
            data = fill_numbuf(numbuf + NUMBUFSIZ, num, base);
        }

        const char* prefix = "";
        if ((flags & FLAG_NUMERIC) && (flags & FLAG_SIGNED)) {
  1005f7:	44 89 6d 8c          	mov    %r13d,-0x74(%rbp)
  1005fb:	44 89 e8             	mov    %r13d,%eax
  1005fe:	83 e0 60             	and    $0x60,%eax
  100601:	83 f8 60             	cmp    $0x60,%eax
  100604:	0f 84 3e 04 00 00    	je     100a48 <printer::vprintf(int, char const*, __va_list_tag*)+0x6d6>
            } else if (flags & FLAG_PLUSPOSITIVE) {
                prefix = "+";
            } else if (flags & FLAG_SPACEPOSITIVE) {
                prefix = " ";
            }
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
  10060a:	44 89 e8             	mov    %r13d,%eax
  10060d:	83 e0 21             	and    $0x21,%eax
        const char* prefix = "";
  100610:	48 c7 45 a8 35 16 10 	movq   $0x101635,-0x58(%rbp)
  100617:	00 
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
  100618:	83 f8 21             	cmp    $0x21,%eax
  10061b:	0f 84 66 04 00 00    	je     100a87 <printer::vprintf(int, char const*, __va_list_tag*)+0x715>
                   && (num || (flags & FLAG_ALT2))) {
            prefix = (base == -16 ? "0x" : "0X");
        }

        int datalen;
        if (precision >= 0 && !(flags & FLAG_NUMERIC)) {
  100621:	8b 4d a4             	mov    -0x5c(%rbp),%ecx
  100624:	89 c8                	mov    %ecx,%eax
  100626:	f7 d0                	not    %eax
  100628:	c1 e8 1f             	shr    $0x1f,%eax
  10062b:	89 45 88             	mov    %eax,-0x78(%rbp)
  10062e:	83 7d 9c 00          	cmpl   $0x0,-0x64(%rbp)
  100632:	0f 85 8b 04 00 00    	jne    100ac3 <printer::vprintf(int, char const*, __va_list_tag*)+0x751>
  100638:	84 c0                	test   %al,%al
  10063a:	0f 84 83 04 00 00    	je     100ac3 <printer::vprintf(int, char const*, __va_list_tag*)+0x751>
            datalen = strnlen(data, precision);
  100640:	48 63 f1             	movslq %ecx,%rsi
  100643:	48 89 df             	mov    %rbx,%rdi
  100646:	e8 38 fc ff ff       	callq  100283 <strnlen>
  10064b:	89 45 a0             	mov    %eax,-0x60(%rbp)
        if ((flags & FLAG_NUMERIC)
            && precision >= 0) {
            zeros = precision > datalen ? precision - datalen : 0;
        } else if ((flags & FLAG_NUMERIC)
                   && (flags & FLAG_ZERO)
                   && !(flags & FLAG_LEFTJUSTIFY)
  10064e:	8b 45 8c             	mov    -0x74(%rbp),%eax
  100651:	83 e0 26             	and    $0x26,%eax
                   && datalen + (int) strlen(prefix) < width) {
            zeros = width - datalen - strlen(prefix);
        } else {
            zeros = 0;
  100654:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%rbp)
                   && datalen + (int) strlen(prefix) < width) {
  10065b:	83 f8 22             	cmp    $0x22,%eax
  10065e:	0f 84 97 04 00 00    	je     100afb <printer::vprintf(int, char const*, __va_list_tag*)+0x789>
        }

        width -= datalen + zeros + strlen(prefix);
  100664:	48 8b 7d a8          	mov    -0x58(%rbp),%rdi
  100668:	e8 f7 fb ff ff       	callq  100264 <strlen>
  10066d:	8b 55 a4             	mov    -0x5c(%rbp),%edx
  100670:	03 55 a0             	add    -0x60(%rbp),%edx
  100673:	8b 7d 98             	mov    -0x68(%rbp),%edi
  100676:	29 d7                	sub    %edx,%edi
  100678:	89 fa                	mov    %edi,%edx
  10067a:	29 c2                	sub    %eax,%edx
  10067c:	89 55 98             	mov    %edx,-0x68(%rbp)
  10067f:	89 55 9c             	mov    %edx,-0x64(%rbp)
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
  100682:	41 f6 c5 04          	test   $0x4,%r13b
  100686:	75 32                	jne    1006ba <printer::vprintf(int, char const*, __va_list_tag*)+0x348>
        width -= datalen + zeros + strlen(prefix);
  100688:	41 89 d5             	mov    %edx,%r13d
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
  10068b:	85 d2                	test   %edx,%edx
  10068d:	7e 2b                	jle    1006ba <printer::vprintf(int, char const*, __va_list_tag*)+0x348>
            putc(' ', color);
  10068f:	49 8b 06             	mov    (%r14),%rax
  100692:	44 89 fa             	mov    %r15d,%edx
  100695:	be 20 00 00 00       	mov    $0x20,%esi
  10069a:	4c 89 f7             	mov    %r14,%rdi
  10069d:	ff 10                	callq  *(%rax)
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
  10069f:	41 83 ed 01          	sub    $0x1,%r13d
  1006a3:	45 85 ed             	test   %r13d,%r13d
  1006a6:	7f e7                	jg     10068f <printer::vprintf(int, char const*, __va_list_tag*)+0x31d>
  1006a8:	8b 7d 98             	mov    -0x68(%rbp),%edi
  1006ab:	85 ff                	test   %edi,%edi
  1006ad:	b8 01 00 00 00       	mov    $0x1,%eax
  1006b2:	0f 4f c7             	cmovg  %edi,%eax
  1006b5:	29 c7                	sub    %eax,%edi
  1006b7:	89 7d 9c             	mov    %edi,-0x64(%rbp)
        }
        for (; *prefix; ++prefix) {
  1006ba:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  1006be:	0f b6 00             	movzbl (%rax),%eax
  1006c1:	4c 8b 6d a8          	mov    -0x58(%rbp),%r13
  1006c5:	84 c0                	test   %al,%al
  1006c7:	74 1b                	je     1006e4 <printer::vprintf(int, char const*, __va_list_tag*)+0x372>
            putc(*prefix, color);
  1006c9:	0f b6 f0             	movzbl %al,%esi
  1006cc:	49 8b 06             	mov    (%r14),%rax
  1006cf:	44 89 fa             	mov    %r15d,%edx
  1006d2:	4c 89 f7             	mov    %r14,%rdi
  1006d5:	ff 10                	callq  *(%rax)
        for (; *prefix; ++prefix) {
  1006d7:	49 83 c5 01          	add    $0x1,%r13
  1006db:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
  1006e0:	84 c0                	test   %al,%al
  1006e2:	75 e5                	jne    1006c9 <printer::vprintf(int, char const*, __va_list_tag*)+0x357>
        }
        for (; zeros > 0; --zeros) {
  1006e4:	44 8b 6d a4          	mov    -0x5c(%rbp),%r13d
  1006e8:	83 7d a4 00          	cmpl   $0x0,-0x5c(%rbp)
  1006ec:	7e 16                	jle    100704 <printer::vprintf(int, char const*, __va_list_tag*)+0x392>
            putc('0', color);
  1006ee:	49 8b 06             	mov    (%r14),%rax
  1006f1:	44 89 fa             	mov    %r15d,%edx
  1006f4:	be 30 00 00 00       	mov    $0x30,%esi
  1006f9:	4c 89 f7             	mov    %r14,%rdi
  1006fc:	ff 10                	callq  *(%rax)
        for (; zeros > 0; --zeros) {
  1006fe:	41 83 ed 01          	sub    $0x1,%r13d
  100702:	75 ea                	jne    1006ee <printer::vprintf(int, char const*, __va_list_tag*)+0x37c>
        }
        for (; datalen > 0; ++data, --datalen) {
  100704:	83 7d a0 00          	cmpl   $0x0,-0x60(%rbp)
  100708:	7e 22                	jle    10072c <printer::vprintf(int, char const*, __va_list_tag*)+0x3ba>
  10070a:	8b 45 a0             	mov    -0x60(%rbp),%eax
  10070d:	8d 40 ff             	lea    -0x1(%rax),%eax
  100710:	4c 8d 6c 03 01       	lea    0x1(%rbx,%rax,1),%r13
            putc(*data, color);
  100715:	0f b6 33             	movzbl (%rbx),%esi
  100718:	49 8b 06             	mov    (%r14),%rax
  10071b:	44 89 fa             	mov    %r15d,%edx
  10071e:	4c 89 f7             	mov    %r14,%rdi
  100721:	ff 10                	callq  *(%rax)
        for (; datalen > 0; ++data, --datalen) {
  100723:	48 83 c3 01          	add    $0x1,%rbx
  100727:	4c 39 eb             	cmp    %r13,%rbx
  10072a:	75 e9                	jne    100715 <printer::vprintf(int, char const*, __va_list_tag*)+0x3a3>
        }
        for (; width > 0; --width) {
  10072c:	8b 5d 9c             	mov    -0x64(%rbp),%ebx
  10072f:	83 7d 9c 00          	cmpl   $0x0,-0x64(%rbp)
  100733:	7e 15                	jle    10074a <printer::vprintf(int, char const*, __va_list_tag*)+0x3d8>
            putc(' ', color);
  100735:	49 8b 06             	mov    (%r14),%rax
  100738:	44 89 fa             	mov    %r15d,%edx
  10073b:	be 20 00 00 00       	mov    $0x20,%esi
  100740:	4c 89 f7             	mov    %r14,%rdi
  100743:	ff 10                	callq  *(%rax)
        for (; width > 0; --width) {
  100745:	83 eb 01             	sub    $0x1,%ebx
  100748:	75 eb                	jne    100735 <printer::vprintf(int, char const*, __va_list_tag*)+0x3c3>
    for (; *format; ++format) {
  10074a:	49 8d 5c 24 01       	lea    0x1(%r12),%rbx
  10074f:	41 0f b6 44 24 01    	movzbl 0x1(%r12),%eax
  100755:	84 c0                	test   %al,%al
  100757:	0f 84 ff 03 00 00    	je     100b5c <printer::vprintf(int, char const*, __va_list_tag*)+0x7ea>
        if (*format != '%') {
  10075d:	3c 25                	cmp    $0x25,%al
  10075f:	0f 84 3f fc ff ff    	je     1003a4 <printer::vprintf(int, char const*, __va_list_tag*)+0x32>
            putc(*format, color);
  100765:	0f b6 f0             	movzbl %al,%esi
  100768:	49 8b 06             	mov    (%r14),%rax
  10076b:	44 89 fa             	mov    %r15d,%edx
  10076e:	4c 89 f7             	mov    %r14,%rdi
  100771:	ff 10                	callq  *(%rax)
            continue;
  100773:	49 89 dc             	mov    %rbx,%r12
  100776:	eb d2                	jmp    10074a <printer::vprintf(int, char const*, __va_list_tag*)+0x3d8>
            long x = length ? va_arg(val, long) : va_arg(val, int);
  100778:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  10077c:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  100780:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100784:	48 89 47 08          	mov    %rax,0x8(%rdi)
  100788:	e9 2d fe ff ff       	jmpq   1005ba <printer::vprintf(int, char const*, __va_list_tag*)+0x248>
        switch (*format) {
  10078d:	49 89 cc             	mov    %rcx,%r12
            long x = length ? va_arg(val, long) : va_arg(val, int);
  100790:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  100794:	8b 01                	mov    (%rcx),%eax
  100796:	83 f8 2f             	cmp    $0x2f,%eax
  100799:	77 13                	ja     1007ae <printer::vprintf(int, char const*, __va_list_tag*)+0x43c>
  10079b:	89 c2                	mov    %eax,%edx
  10079d:	48 03 51 10          	add    0x10(%rcx),%rdx
  1007a1:	83 c0 08             	add    $0x8,%eax
  1007a4:	89 01                	mov    %eax,(%rcx)
  1007a6:	48 63 12             	movslq (%rdx),%rdx
  1007a9:	e9 12 fe ff ff       	jmpq   1005c0 <printer::vprintf(int, char const*, __va_list_tag*)+0x24e>
  1007ae:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1007b2:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  1007b6:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1007ba:	48 89 41 08          	mov    %rax,0x8(%rcx)
  1007be:	eb e6                	jmp    1007a6 <printer::vprintf(int, char const*, __va_list_tag*)+0x434>
        switch (*format) {
  1007c0:	49 89 cc             	mov    %rcx,%r12
  1007c3:	b8 01 00 00 00       	mov    $0x1,%eax
  1007c8:	be 0a 00 00 00       	mov    $0xa,%esi
  1007cd:	e9 a8 00 00 00       	jmpq   10087a <printer::vprintf(int, char const*, __va_list_tag*)+0x508>
  1007d2:	49 89 cc             	mov    %rcx,%r12
  1007d5:	b8 00 00 00 00       	mov    $0x0,%eax
  1007da:	be 0a 00 00 00       	mov    $0xa,%esi
  1007df:	e9 96 00 00 00       	jmpq   10087a <printer::vprintf(int, char const*, __va_list_tag*)+0x508>
        switch (*format) {
  1007e4:	b8 00 00 00 00       	mov    $0x0,%eax
  1007e9:	be 0a 00 00 00       	mov    $0xa,%esi
  1007ee:	e9 87 00 00 00       	jmpq   10087a <printer::vprintf(int, char const*, __va_list_tag*)+0x508>
  1007f3:	b8 00 00 00 00       	mov    $0x0,%eax
  1007f8:	be 0a 00 00 00       	mov    $0xa,%esi
  1007fd:	eb 7b                	jmp    10087a <printer::vprintf(int, char const*, __va_list_tag*)+0x508>
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
  1007ff:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  100803:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  100807:	48 8d 42 08          	lea    0x8(%rdx),%rax
  10080b:	48 89 47 08          	mov    %rax,0x8(%rdi)
  10080f:	e9 84 00 00 00       	jmpq   100898 <printer::vprintf(int, char const*, __va_list_tag*)+0x526>
  100814:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  100818:	8b 01                	mov    (%rcx),%eax
  10081a:	83 f8 2f             	cmp    $0x2f,%eax
  10081d:	77 10                	ja     10082f <printer::vprintf(int, char const*, __va_list_tag*)+0x4bd>
  10081f:	89 c2                	mov    %eax,%edx
  100821:	48 03 51 10          	add    0x10(%rcx),%rdx
  100825:	83 c0 08             	add    $0x8,%eax
  100828:	89 01                	mov    %eax,(%rcx)
  10082a:	44 8b 02             	mov    (%rdx),%r8d
  10082d:	eb 6c                	jmp    10089b <printer::vprintf(int, char const*, __va_list_tag*)+0x529>
  10082f:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  100833:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  100837:	48 8d 42 08          	lea    0x8(%rdx),%rax
  10083b:	48 89 41 08          	mov    %rax,0x8(%rcx)
  10083f:	eb e9                	jmp    10082a <printer::vprintf(int, char const*, __va_list_tag*)+0x4b8>
  100841:	41 89 f1             	mov    %esi,%r9d
        if (flags & FLAG_NUMERIC) {
  100844:	c7 45 9c 20 00 00 00 	movl   $0x20,-0x64(%rbp)
    const char* digits = upper_digits;
  10084b:	bf 90 15 10 00       	mov    $0x101590,%edi
  100850:	e9 c0 01 00 00       	jmpq   100a15 <printer::vprintf(int, char const*, __va_list_tag*)+0x6a3>
        switch (*format) {
  100855:	49 89 cc             	mov    %rcx,%r12
  100858:	b8 01 00 00 00       	mov    $0x1,%eax
  10085d:	eb 16                	jmp    100875 <printer::vprintf(int, char const*, __va_list_tag*)+0x503>
  10085f:	49 89 cc             	mov    %rcx,%r12
  100862:	b8 00 00 00 00       	mov    $0x0,%eax
  100867:	eb 0c                	jmp    100875 <printer::vprintf(int, char const*, __va_list_tag*)+0x503>
        switch (*format) {
  100869:	b8 00 00 00 00       	mov    $0x0,%eax
  10086e:	eb 05                	jmp    100875 <printer::vprintf(int, char const*, __va_list_tag*)+0x503>
  100870:	b8 00 00 00 00       	mov    $0x0,%eax
            base = -16;
  100875:	be f0 ff ff ff       	mov    $0xfffffff0,%esi
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
  10087a:	85 c0                	test   %eax,%eax
  10087c:	74 96                	je     100814 <printer::vprintf(int, char const*, __va_list_tag*)+0x4a2>
  10087e:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  100882:	8b 01                	mov    (%rcx),%eax
  100884:	83 f8 2f             	cmp    $0x2f,%eax
  100887:	0f 87 72 ff ff ff    	ja     1007ff <printer::vprintf(int, char const*, __va_list_tag*)+0x48d>
  10088d:	89 c2                	mov    %eax,%edx
  10088f:	48 03 51 10          	add    0x10(%rcx),%rdx
  100893:	83 c0 08             	add    $0x8,%eax
  100896:	89 01                	mov    %eax,(%rcx)
  100898:	4c 8b 02             	mov    (%rdx),%r8
            flags |= FLAG_NUMERIC;
  10089b:	41 83 cd 20          	or     $0x20,%r13d
    if (base < 0) {
  10089f:	85 f6                	test   %esi,%esi
  1008a1:	79 9e                	jns    100841 <printer::vprintf(int, char const*, __va_list_tag*)+0x4cf>
        base = -base;
  1008a3:	41 89 f1             	mov    %esi,%r9d
  1008a6:	f7 de                	neg    %esi
  1008a8:	c7 45 9c 20 00 00 00 	movl   $0x20,-0x64(%rbp)
        digits = lower_digits;
  1008af:	bf 70 15 10 00       	mov    $0x101570,%edi
  1008b4:	e9 5c 01 00 00       	jmpq   100a15 <printer::vprintf(int, char const*, __va_list_tag*)+0x6a3>
        switch (*format) {
  1008b9:	49 89 cc             	mov    %rcx,%r12
  1008bc:	b8 01 00 00 00       	mov    $0x1,%eax
  1008c1:	eb 16                	jmp    1008d9 <printer::vprintf(int, char const*, __va_list_tag*)+0x567>
  1008c3:	49 89 cc             	mov    %rcx,%r12
  1008c6:	b8 00 00 00 00       	mov    $0x0,%eax
  1008cb:	eb 0c                	jmp    1008d9 <printer::vprintf(int, char const*, __va_list_tag*)+0x567>
        switch (*format) {
  1008cd:	b8 00 00 00 00       	mov    $0x0,%eax
  1008d2:	eb 05                	jmp    1008d9 <printer::vprintf(int, char const*, __va_list_tag*)+0x567>
  1008d4:	b8 00 00 00 00       	mov    $0x0,%eax
            base = 16;
  1008d9:	be 10 00 00 00       	mov    $0x10,%esi
            goto format_unsigned;
  1008de:	eb 9a                	jmp    10087a <printer::vprintf(int, char const*, __va_list_tag*)+0x508>
        switch (*format) {
  1008e0:	49 89 cc             	mov    %rcx,%r12
            num = (uintptr_t) va_arg(val, void*);
  1008e3:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1008e7:	8b 01                	mov    (%rcx),%eax
  1008e9:	83 f8 2f             	cmp    $0x2f,%eax
  1008ec:	77 21                	ja     10090f <printer::vprintf(int, char const*, __va_list_tag*)+0x59d>
  1008ee:	89 c2                	mov    %eax,%edx
  1008f0:	48 03 51 10          	add    0x10(%rcx),%rdx
  1008f4:	83 c0 08             	add    $0x8,%eax
  1008f7:	89 01                	mov    %eax,(%rcx)
  1008f9:	4c 8b 02             	mov    (%rdx),%r8
            flags |= FLAG_ALT | FLAG_ALT2 | FLAG_NUMERIC;
  1008fc:	41 81 cd 21 01 00 00 	or     $0x121,%r13d
            base = -16;
  100903:	be f0 ff ff ff       	mov    $0xfffffff0,%esi
  100908:	eb 99                	jmp    1008a3 <printer::vprintf(int, char const*, __va_list_tag*)+0x531>
        switch (*format) {
  10090a:	49 89 cc             	mov    %rcx,%r12
  10090d:	eb d4                	jmp    1008e3 <printer::vprintf(int, char const*, __va_list_tag*)+0x571>
            num = (uintptr_t) va_arg(val, void*);
  10090f:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  100913:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  100917:	48 8d 42 08          	lea    0x8(%rdx),%rax
  10091b:	48 89 47 08          	mov    %rax,0x8(%rdi)
  10091f:	eb d8                	jmp    1008f9 <printer::vprintf(int, char const*, __va_list_tag*)+0x587>
        switch (*format) {
  100921:	49 89 cc             	mov    %rcx,%r12
            data = va_arg(val, char*);
  100924:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  100928:	8b 07                	mov    (%rdi),%eax
  10092a:	83 f8 2f             	cmp    $0x2f,%eax
  10092d:	77 1e                	ja     10094d <printer::vprintf(int, char const*, __va_list_tag*)+0x5db>
  10092f:	89 c2                	mov    %eax,%edx
  100931:	48 03 57 10          	add    0x10(%rdi),%rdx
  100935:	83 c0 08             	add    $0x8,%eax
  100938:	89 07                	mov    %eax,(%rdi)
  10093a:	48 8b 1a             	mov    (%rdx),%rbx
        unsigned long num = 0;
  10093d:	41 b8 00 00 00 00    	mov    $0x0,%r8d
            break;
  100943:	e9 9a fc ff ff       	jmpq   1005e2 <printer::vprintf(int, char const*, __va_list_tag*)+0x270>
        switch (*format) {
  100948:	49 89 cc             	mov    %rcx,%r12
  10094b:	eb d7                	jmp    100924 <printer::vprintf(int, char const*, __va_list_tag*)+0x5b2>
            data = va_arg(val, char*);
  10094d:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  100951:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  100955:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100959:	48 89 41 08          	mov    %rax,0x8(%rcx)
  10095d:	eb db                	jmp    10093a <printer::vprintf(int, char const*, __va_list_tag*)+0x5c8>
        switch (*format) {
  10095f:	49 89 cc             	mov    %rcx,%r12
            color = va_arg(val, int);
  100962:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  100966:	8b 01                	mov    (%rcx),%eax
  100968:	83 f8 2f             	cmp    $0x2f,%eax
  10096b:	77 18                	ja     100985 <printer::vprintf(int, char const*, __va_list_tag*)+0x613>
  10096d:	89 c2                	mov    %eax,%edx
  10096f:	48 03 51 10          	add    0x10(%rcx),%rdx
  100973:	83 c0 08             	add    $0x8,%eax
  100976:	89 01                	mov    %eax,(%rcx)
  100978:	44 8b 3a             	mov    (%rdx),%r15d
            continue;
  10097b:	e9 ca fd ff ff       	jmpq   10074a <printer::vprintf(int, char const*, __va_list_tag*)+0x3d8>
        switch (*format) {
  100980:	49 89 cc             	mov    %rcx,%r12
  100983:	eb dd                	jmp    100962 <printer::vprintf(int, char const*, __va_list_tag*)+0x5f0>
            color = va_arg(val, int);
  100985:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  100989:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  10098d:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100991:	48 89 47 08          	mov    %rax,0x8(%rdi)
  100995:	eb e1                	jmp    100978 <printer::vprintf(int, char const*, __va_list_tag*)+0x606>
        switch (*format) {
  100997:	49 89 cc             	mov    %rcx,%r12
            numbuf[0] = va_arg(val, int);
  10099a:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  10099e:	8b 07                	mov    (%rdi),%eax
  1009a0:	83 f8 2f             	cmp    $0x2f,%eax
  1009a3:	77 28                	ja     1009cd <printer::vprintf(int, char const*, __va_list_tag*)+0x65b>
  1009a5:	89 c2                	mov    %eax,%edx
  1009a7:	48 03 57 10          	add    0x10(%rdi),%rdx
  1009ab:	83 c0 08             	add    $0x8,%eax
  1009ae:	89 07                	mov    %eax,(%rdi)
  1009b0:	8b 02                	mov    (%rdx),%eax
  1009b2:	88 45 b8             	mov    %al,-0x48(%rbp)
            numbuf[1] = '\0';
  1009b5:	c6 45 b9 00          	movb   $0x0,-0x47(%rbp)
            data = numbuf;
  1009b9:	48 8d 5d b8          	lea    -0x48(%rbp),%rbx
        unsigned long num = 0;
  1009bd:	41 b8 00 00 00 00    	mov    $0x0,%r8d
            break;
  1009c3:	e9 1a fc ff ff       	jmpq   1005e2 <printer::vprintf(int, char const*, __va_list_tag*)+0x270>
        switch (*format) {
  1009c8:	49 89 cc             	mov    %rcx,%r12
  1009cb:	eb cd                	jmp    10099a <printer::vprintf(int, char const*, __va_list_tag*)+0x628>
            numbuf[0] = va_arg(val, int);
  1009cd:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1009d1:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  1009d5:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1009d9:	48 89 41 08          	mov    %rax,0x8(%rcx)
  1009dd:	eb d1                	jmp    1009b0 <printer::vprintf(int, char const*, __va_list_tag*)+0x63e>
        switch (*format) {
  1009df:	4c 89 e1             	mov    %r12,%rcx
            numbuf[0] = (*format ? *format : '%');
  1009e2:	84 c0                	test   %al,%al
  1009e4:	0f 85 3b 01 00 00    	jne    100b25 <printer::vprintf(int, char const*, __va_list_tag*)+0x7b3>
  1009ea:	c6 45 b8 25          	movb   $0x25,-0x48(%rbp)
            numbuf[1] = '\0';
  1009ee:	c6 45 b9 00          	movb   $0x0,-0x47(%rbp)
                format--;
  1009f2:	4c 8d 61 ff          	lea    -0x1(%rcx),%r12
            data = numbuf;
  1009f6:	48 8d 5d b8          	lea    -0x48(%rbp),%rbx
        unsigned long num = 0;
  1009fa:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  100a00:	e9 dd fb ff ff       	jmpq   1005e2 <printer::vprintf(int, char const*, __va_list_tag*)+0x270>
        if (flags & FLAG_NUMERIC) {
  100a05:	41 b9 0a 00 00 00    	mov    $0xa,%r9d
    const char* digits = upper_digits;
  100a0b:	bf 90 15 10 00       	mov    $0x101590,%edi
        if (flags & FLAG_NUMERIC) {
  100a10:	be 0a 00 00 00       	mov    $0xa,%esi
    *--numbuf_end = '\0';
  100a15:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
  100a19:	4c 89 c1             	mov    %r8,%rcx
  100a1c:	48 8d 5d cf          	lea    -0x31(%rbp),%rbx
        *--numbuf_end = digits[val % base];
  100a20:	48 63 f6             	movslq %esi,%rsi
  100a23:	48 83 eb 01          	sub    $0x1,%rbx
  100a27:	48 89 c8             	mov    %rcx,%rax
  100a2a:	ba 00 00 00 00       	mov    $0x0,%edx
  100a2f:	48 f7 f6             	div    %rsi
  100a32:	0f b6 14 17          	movzbl (%rdi,%rdx,1),%edx
  100a36:	88 13                	mov    %dl,(%rbx)
        val /= base;
  100a38:	48 89 ca             	mov    %rcx,%rdx
  100a3b:	48 89 c1             	mov    %rax,%rcx
    } while (val != 0);
  100a3e:	48 39 d6             	cmp    %rdx,%rsi
  100a41:	76 e0                	jbe    100a23 <printer::vprintf(int, char const*, __va_list_tag*)+0x6b1>
  100a43:	e9 af fb ff ff       	jmpq   1005f7 <printer::vprintf(int, char const*, __va_list_tag*)+0x285>
                prefix = "-";
  100a48:	48 c7 45 a8 93 0e 10 	movq   $0x100e93,-0x58(%rbp)
  100a4f:	00 
            if (flags & FLAG_NEGATIVE) {
  100a50:	41 f6 c5 80          	test   $0x80,%r13b
  100a54:	0f 85 c7 fb ff ff    	jne    100621 <printer::vprintf(int, char const*, __va_list_tag*)+0x2af>
                prefix = "+";
  100a5a:	48 c7 45 a8 91 0e 10 	movq   $0x100e91,-0x58(%rbp)
  100a61:	00 
            } else if (flags & FLAG_PLUSPOSITIVE) {
  100a62:	41 f6 c5 10          	test   $0x10,%r13b
  100a66:	0f 85 b5 fb ff ff    	jne    100621 <printer::vprintf(int, char const*, __va_list_tag*)+0x2af>
                prefix = " ";
  100a6c:	41 f6 c5 08          	test   $0x8,%r13b
  100a70:	ba 35 16 10 00       	mov    $0x101635,%edx
  100a75:	b8 26 16 10 00       	mov    $0x101626,%eax
  100a7a:	48 0f 44 c2          	cmove  %rdx,%rax
  100a7e:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
  100a82:	e9 9a fb ff ff       	jmpq   100621 <printer::vprintf(int, char const*, __va_list_tag*)+0x2af>
                   && (base == 16 || base == -16)
  100a87:	41 8d 41 10          	lea    0x10(%r9),%eax
  100a8b:	a9 df ff ff ff       	test   $0xffffffdf,%eax
  100a90:	0f 85 8b fb ff ff    	jne    100621 <printer::vprintf(int, char const*, __va_list_tag*)+0x2af>
                   && (num || (flags & FLAG_ALT2))) {
  100a96:	4d 85 c0             	test   %r8,%r8
  100a99:	75 0d                	jne    100aa8 <printer::vprintf(int, char const*, __va_list_tag*)+0x736>
  100a9b:	41 f7 c5 00 01 00 00 	test   $0x100,%r13d
  100aa2:	0f 84 79 fb ff ff    	je     100621 <printer::vprintf(int, char const*, __va_list_tag*)+0x2af>
            prefix = (base == -16 ? "0x" : "0X");
  100aa8:	41 83 f9 f0          	cmp    $0xfffffff0,%r9d
  100aac:	ba 8e 0e 10 00       	mov    $0x100e8e,%edx
  100ab1:	b8 95 0e 10 00       	mov    $0x100e95,%eax
  100ab6:	48 0f 44 c2          	cmove  %rdx,%rax
  100aba:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
  100abe:	e9 5e fb ff ff       	jmpq   100621 <printer::vprintf(int, char const*, __va_list_tag*)+0x2af>
            datalen = strlen(data);
  100ac3:	48 89 df             	mov    %rbx,%rdi
  100ac6:	e8 99 f7 ff ff       	callq  100264 <strlen>
  100acb:	89 45 a0             	mov    %eax,-0x60(%rbp)
            && precision >= 0) {
  100ace:	83 7d 9c 00          	cmpl   $0x0,-0x64(%rbp)
  100ad2:	0f 84 76 fb ff ff    	je     10064e <printer::vprintf(int, char const*, __va_list_tag*)+0x2dc>
  100ad8:	80 7d 88 00          	cmpb   $0x0,-0x78(%rbp)
  100adc:	0f 84 6c fb ff ff    	je     10064e <printer::vprintf(int, char const*, __va_list_tag*)+0x2dc>
            zeros = precision > datalen ? precision - datalen : 0;
  100ae2:	8b 4d a4             	mov    -0x5c(%rbp),%ecx
  100ae5:	89 ca                	mov    %ecx,%edx
  100ae7:	29 c2                	sub    %eax,%edx
  100ae9:	39 c1                	cmp    %eax,%ecx
  100aeb:	b8 00 00 00 00       	mov    $0x0,%eax
  100af0:	0f 4f c2             	cmovg  %edx,%eax
  100af3:	89 45 a4             	mov    %eax,-0x5c(%rbp)
  100af6:	e9 69 fb ff ff       	jmpq   100664 <printer::vprintf(int, char const*, __va_list_tag*)+0x2f2>
                   && datalen + (int) strlen(prefix) < width) {
  100afb:	48 8b 7d a8          	mov    -0x58(%rbp),%rdi
  100aff:	e8 60 f7 ff ff       	callq  100264 <strlen>
  100b04:	8b 75 a0             	mov    -0x60(%rbp),%esi
  100b07:	8d 14 06             	lea    (%rsi,%rax,1),%edx
            zeros = width - datalen - strlen(prefix);
  100b0a:	8b 7d 98             	mov    -0x68(%rbp),%edi
  100b0d:	89 f9                	mov    %edi,%ecx
  100b0f:	29 f1                	sub    %esi,%ecx
  100b11:	29 c1                	sub    %eax,%ecx
  100b13:	39 fa                	cmp    %edi,%edx
  100b15:	b8 00 00 00 00       	mov    $0x0,%eax
  100b1a:	0f 4c c1             	cmovl  %ecx,%eax
  100b1d:	89 45 a4             	mov    %eax,-0x5c(%rbp)
  100b20:	e9 3f fb ff ff       	jmpq   100664 <printer::vprintf(int, char const*, __va_list_tag*)+0x2f2>
  100b25:	49 89 cc             	mov    %rcx,%r12
            numbuf[0] = (*format ? *format : '%');
  100b28:	88 45 b8             	mov    %al,-0x48(%rbp)
            numbuf[1] = '\0';
  100b2b:	c6 45 b9 00          	movb   $0x0,-0x47(%rbp)
            data = numbuf;
  100b2f:	48 8d 5d b8          	lea    -0x48(%rbp),%rbx
        unsigned long num = 0;
  100b33:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  100b39:	e9 a4 fa ff ff       	jmpq   1005e2 <printer::vprintf(int, char const*, __va_list_tag*)+0x270>
        int flags = 0;
  100b3e:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  100b44:	e9 a4 f8 ff ff       	jmpq   1003ed <printer::vprintf(int, char const*, __va_list_tag*)+0x7b>
        switch (*format) {
  100b49:	8d 50 bd             	lea    -0x43(%rax),%edx
  100b4c:	80 fa 35             	cmp    $0x35,%dl
  100b4f:	77 d7                	ja     100b28 <printer::vprintf(int, char const*, __va_list_tag*)+0x7b6>
  100b51:	0f b6 d2             	movzbl %dl,%edx
  100b54:	3e ff 24 d5 b0 13 10 	notrack jmpq *0x1013b0(,%rdx,8)
  100b5b:	00 
        }
    }
}
  100b5c:	48 83 c4 58          	add    $0x58,%rsp
  100b60:	5b                   	pop    %rbx
  100b61:	41 5c                	pop    %r12
  100b63:	41 5d                	pop    %r13
  100b65:	41 5e                	pop    %r14
  100b67:	41 5f                	pop    %r15
  100b69:	5d                   	pop    %rbp
  100b6a:	c3                   	retq   
  100b6b:	90                   	nop

0000000000100b6c <console_printer::console_printer(int, bool)>:
    void scroll();
    void move_cursor();
};

__noinline
console_printer::console_printer(int cpos, bool scroll)
  100b6c:	f3 0f 1e fa          	endbr64 
    : cell_(console), scroll_(scroll) {
  100b70:	48 c7 07 18 16 10 00 	movq   $0x101618,(%rdi)
  100b77:	48 c7 47 08 00 80 0b 	movq   $0xb8000,0x8(%rdi)
  100b7e:	00 
  100b7f:	88 57 10             	mov    %dl,0x10(%rdi)
    if (cpos < 0) {
  100b82:	85 f6                	test   %esi,%esi
  100b84:	78 18                	js     100b9e <console_printer::console_printer(int, bool)+0x32>
        cell_ += cursorpos;
    } else if (cpos <= CONSOLE_ROWS * CONSOLE_COLUMNS) {
  100b86:	81 fe d0 07 00 00    	cmp    $0x7d0,%esi
  100b8c:	7f 0f                	jg     100b9d <console_printer::console_printer(int, bool)+0x31>
        cell_ += cpos;
  100b8e:	48 63 f6             	movslq %esi,%rsi
  100b91:	48 8d 84 36 00 80 0b 	lea    0xb8000(%rsi,%rsi,1),%rax
  100b98:	00 
  100b99:	48 89 47 08          	mov    %rax,0x8(%rdi)
    }
}
  100b9d:	c3                   	retq   
        cell_ += cursorpos;
  100b9e:	8b 05 58 84 fb ff    	mov    -0x47ba8(%rip),%eax        # b8ffc <cursorpos>
  100ba4:	48 98                	cltq   
  100ba6:	48 8d 84 00 00 80 0b 	lea    0xb8000(%rax,%rax,1),%rax
  100bad:	00 
  100bae:	48 89 47 08          	mov    %rax,0x8(%rdi)
  100bb2:	c3                   	retq   
  100bb3:	90                   	nop

0000000000100bb4 <console_printer::scroll()>:

__noinline
void console_printer::scroll() {
  100bb4:	f3 0f 1e fa          	endbr64 
  100bb8:	55                   	push   %rbp
  100bb9:	48 89 e5             	mov    %rsp,%rbp
  100bbc:	53                   	push   %rbx
  100bbd:	48 83 ec 08          	sub    $0x8,%rsp
    assert(cell_ >= console + CONSOLE_ROWS * CONSOLE_COLUMNS);
  100bc1:	48 81 7f 08 a0 8f 0b 	cmpq   $0xb8fa0,0x8(%rdi)
  100bc8:	00 
  100bc9:	72 18                	jb     100be3 <console_printer::scroll()+0x2f>
  100bcb:	48 89 fb             	mov    %rdi,%rbx
    if (scroll_) {
  100bce:	80 7f 10 00          	cmpb   $0x0,0x10(%rdi)
  100bd2:	75 28                	jne    100bfc <console_printer::scroll()+0x48>
                (CONSOLE_ROWS - 1) * CONSOLE_COLUMNS * sizeof(*console));
        memset(console + (CONSOLE_ROWS - 1) * CONSOLE_COLUMNS,
               0, CONSOLE_COLUMNS * sizeof(*console));
        cell_ -= CONSOLE_COLUMNS;
    } else {
        cell_ = console;
  100bd4:	48 c7 47 08 00 80 0b 	movq   $0xb8000,0x8(%rdi)
  100bdb:	00 
    }
}
  100bdc:	48 83 c4 08          	add    $0x8,%rsp
  100be0:	5b                   	pop    %rbx
  100be1:	5d                   	pop    %rbp
  100be2:	c3                   	retq   
    assert(cell_ >= console + CONSOLE_ROWS * CONSOLE_COLUMNS);
  100be3:	b9 00 00 00 00       	mov    $0x0,%ecx
  100be8:	ba a8 15 10 00       	mov    $0x1015a8,%edx
  100bed:	be 2c 02 00 00       	mov    $0x22c,%esi
  100bf2:	bf 87 0e 10 00       	mov    $0x100e87,%edi
  100bf7:	e8 03 02 00 00       	callq  100dff <assert_fail(char const*, int, char const*, char const*)>
        memmove(console, console + CONSOLE_COLUMNS,
  100bfc:	ba 00 0f 00 00       	mov    $0xf00,%edx
  100c01:	be a0 80 0b 00       	mov    $0xb80a0,%esi
  100c06:	bf 00 80 0b 00       	mov    $0xb8000,%edi
  100c0b:	e8 e7 f5 ff ff       	callq  1001f7 <memmove>
        memset(console + (CONSOLE_ROWS - 1) * CONSOLE_COLUMNS,
  100c10:	ba a0 00 00 00       	mov    $0xa0,%edx
  100c15:	be 00 00 00 00       	mov    $0x0,%esi
  100c1a:	bf 00 8f 0b 00       	mov    $0xb8f00,%edi
  100c1f:	e8 20 f6 ff ff       	callq  100244 <memset>
        cell_ -= CONSOLE_COLUMNS;
  100c24:	48 81 6b 08 a0 00 00 	subq   $0xa0,0x8(%rbx)
  100c2b:	00 
  100c2c:	eb ae                	jmp    100bdc <console_printer::scroll()+0x28>

0000000000100c2e <console_printer::putc(unsigned char, int)>:
    extern void console_show_cursor(int);
    console_show_cursor(cursorpos);
#endif
}

inline void console_printer::putc(unsigned char c, int color) {
  100c2e:	f3 0f 1e fa          	endbr64 
  100c32:	55                   	push   %rbp
  100c33:	48 89 e5             	mov    %rsp,%rbp
  100c36:	41 55                	push   %r13
  100c38:	41 54                	push   %r12
  100c3a:	53                   	push   %rbx
  100c3b:	48 83 ec 08          	sub    $0x8,%rsp
  100c3f:	48 89 fb             	mov    %rdi,%rbx
  100c42:	41 89 f5             	mov    %esi,%r13d
  100c45:	41 89 d4             	mov    %edx,%r12d
    while (cell_ >= console + CONSOLE_ROWS * CONSOLE_COLUMNS) {
  100c48:	48 8b 47 08          	mov    0x8(%rdi),%rax
  100c4c:	48 3d a0 8f 0b 00    	cmp    $0xb8fa0,%rax
  100c52:	72 14                	jb     100c68 <console_printer::putc(unsigned char, int)+0x3a>
        scroll();
  100c54:	48 89 df             	mov    %rbx,%rdi
  100c57:	e8 58 ff ff ff       	callq  100bb4 <console_printer::scroll()>
    while (cell_ >= console + CONSOLE_ROWS * CONSOLE_COLUMNS) {
  100c5c:	48 8b 43 08          	mov    0x8(%rbx),%rax
  100c60:	48 3d a0 8f 0b 00    	cmp    $0xb8fa0,%rax
  100c66:	73 ec                	jae    100c54 <console_printer::putc(unsigned char, int)+0x26>
    }
    if (c == '\n') {
  100c68:	41 80 fd 0a          	cmp    $0xa,%r13b
  100c6c:	74 1e                	je     100c8c <console_printer::putc(unsigned char, int)+0x5e>
        while (pos != 80) {
            *cell_++ = ' ' | color;
            ++pos;
        }
    } else {
        *cell_++ = c | color;
  100c6e:	48 8d 50 02          	lea    0x2(%rax),%rdx
  100c72:	48 89 53 08          	mov    %rdx,0x8(%rbx)
  100c76:	45 0f b6 ed          	movzbl %r13b,%r13d
  100c7a:	45 09 ec             	or     %r13d,%r12d
  100c7d:	66 44 89 20          	mov    %r12w,(%rax)
    }
}
  100c81:	48 83 c4 08          	add    $0x8,%rsp
  100c85:	5b                   	pop    %rbx
  100c86:	41 5c                	pop    %r12
  100c88:	41 5d                	pop    %r13
  100c8a:	5d                   	pop    %rbp
  100c8b:	c3                   	retq   
        int pos = (cell_ - console) % 80;
  100c8c:	48 2d 00 80 0b 00    	sub    $0xb8000,%rax
  100c92:	48 89 c1             	mov    %rax,%rcx
  100c95:	48 89 c6             	mov    %rax,%rsi
  100c98:	48 d1 fe             	sar    %rsi
  100c9b:	48 ba 67 66 66 66 66 	movabs $0x6666666666666667,%rdx
  100ca2:	66 66 66 
  100ca5:	48 89 f0             	mov    %rsi,%rax
  100ca8:	48 f7 ea             	imul   %rdx
  100cab:	48 c1 fa 05          	sar    $0x5,%rdx
  100caf:	48 89 c8             	mov    %rcx,%rax
  100cb2:	48 c1 f8 3f          	sar    $0x3f,%rax
  100cb6:	48 29 c2             	sub    %rax,%rdx
  100cb9:	48 8d 04 92          	lea    (%rdx,%rdx,4),%rax
  100cbd:	48 c1 e0 04          	shl    $0x4,%rax
  100cc1:	89 f2                	mov    %esi,%edx
  100cc3:	29 c2                	sub    %eax,%edx
  100cc5:	89 d0                	mov    %edx,%eax
            *cell_++ = ' ' | color;
  100cc7:	41 83 cc 20          	or     $0x20,%r12d
  100ccb:	48 8b 4b 08          	mov    0x8(%rbx),%rcx
  100ccf:	48 8d 71 02          	lea    0x2(%rcx),%rsi
  100cd3:	48 89 73 08          	mov    %rsi,0x8(%rbx)
  100cd7:	66 44 89 21          	mov    %r12w,(%rcx)
            ++pos;
  100cdb:	83 c0 01             	add    $0x1,%eax
        while (pos != 80) {
  100cde:	83 f8 50             	cmp    $0x50,%eax
  100ce1:	75 e8                	jne    100ccb <console_printer::putc(unsigned char, int)+0x9d>
  100ce3:	eb 9c                	jmp    100c81 <console_printer::putc(unsigned char, int)+0x53>
  100ce5:	90                   	nop

0000000000100ce6 <console_printer::move_cursor()>:
void console_printer::move_cursor() {
  100ce6:	f3 0f 1e fa          	endbr64 
    cursorpos = cell_ - console;
  100cea:	48 8b 47 08          	mov    0x8(%rdi),%rax
  100cee:	48 2d 00 80 0b 00    	sub    $0xb8000,%rax
  100cf4:	48 d1 f8             	sar    %rax
  100cf7:	89 05 ff 82 fb ff    	mov    %eax,-0x47d01(%rip)        # b8ffc <cursorpos>
}
  100cfd:	c3                   	retq   

0000000000100cfe <console_vprintf(int, int, char const*, __va_list_tag*)>:

// console_vprintf, console_printf
//    Print a message onto the console, starting at the given cursor position.

__noinline
int console_vprintf(int cpos, int color, const char* format, va_list val) {
  100cfe:	f3 0f 1e fa          	endbr64 
  100d02:	55                   	push   %rbp
  100d03:	48 89 e5             	mov    %rsp,%rbp
  100d06:	41 56                	push   %r14
  100d08:	41 55                	push   %r13
  100d0a:	41 54                	push   %r12
  100d0c:	53                   	push   %rbx
  100d0d:	48 83 ec 20          	sub    $0x20,%rsp
  100d11:	89 fb                	mov    %edi,%ebx
  100d13:	41 89 f4             	mov    %esi,%r12d
  100d16:	49 89 d5             	mov    %rdx,%r13
  100d19:	49 89 ce             	mov    %rcx,%r14
    console_printer cp(cpos, cpos < 0);
  100d1c:	89 fa                	mov    %edi,%edx
  100d1e:	c1 ea 1f             	shr    $0x1f,%edx
  100d21:	89 fe                	mov    %edi,%esi
  100d23:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
  100d27:	e8 40 fe ff ff       	callq  100b6c <console_printer::console_printer(int, bool)>
    cp.vprintf(color, format, val);
  100d2c:	4c 89 f1             	mov    %r14,%rcx
  100d2f:	4c 89 ea             	mov    %r13,%rdx
  100d32:	44 89 e6             	mov    %r12d,%esi
  100d35:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
  100d39:	e8 34 f6 ff ff       	callq  100372 <printer::vprintf(int, char const*, __va_list_tag*)>
    if (cpos < 0) {
  100d3e:	85 db                	test   %ebx,%ebx
  100d40:	78 1a                	js     100d5c <console_vprintf(int, int, char const*, __va_list_tag*)+0x5e>
        cp.move_cursor();
    }
    return cp.cell_ - console;
  100d42:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  100d46:	48 2d 00 80 0b 00    	sub    $0xb8000,%rax
  100d4c:	48 d1 f8             	sar    %rax
}
  100d4f:	48 83 c4 20          	add    $0x20,%rsp
  100d53:	5b                   	pop    %rbx
  100d54:	41 5c                	pop    %r12
  100d56:	41 5d                	pop    %r13
  100d58:	41 5e                	pop    %r14
  100d5a:	5d                   	pop    %rbp
  100d5b:	c3                   	retq   
        cp.move_cursor();
  100d5c:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
  100d60:	e8 81 ff ff ff       	callq  100ce6 <console_printer::move_cursor()>
  100d65:	eb db                	jmp    100d42 <console_vprintf(int, int, char const*, __va_list_tag*)+0x44>

0000000000100d67 <console_printf(int, int, char const*, ...)>:

__noinline
int console_printf(int cpos, int color, const char* format, ...) {
  100d67:	f3 0f 1e fa          	endbr64 
  100d6b:	55                   	push   %rbp
  100d6c:	48 89 e5             	mov    %rsp,%rbp
  100d6f:	48 83 ec 50          	sub    $0x50,%rsp
  100d73:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  100d77:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
  100d7b:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
  100d7f:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
  100d86:	48 8d 45 10          	lea    0x10(%rbp),%rax
  100d8a:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  100d8e:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  100d92:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    cpos = console_vprintf(cpos, color, format, val);
  100d96:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
  100d9a:	e8 5f ff ff ff       	callq  100cfe <console_vprintf(int, int, char const*, __va_list_tag*)>
    va_end(val);
    return cpos;
}
  100d9f:	c9                   	leaveq 
  100da0:	c3                   	retq   

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
  100df8:	e8 01 ff ff ff       	callq  100cfe <console_vprintf(int, int, char const*, __va_list_tag*)>
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
  100e2d:	bf 2b 16 10 00       	mov    $0x10162b,%edi
  100e32:	b0 00                	mov    $0x0,%al
  100e34:	e8 68 ff ff ff       	callq  100da1 <error_printf(char const*, ...)>
    }
    error_printf("%s:%d: user assertion '%s' failed\n", file, line, msg);
  100e39:	4c 89 e9             	mov    %r13,%rcx
  100e3c:	44 89 e2             	mov    %r12d,%edx
  100e3f:	48 89 de             	mov    %rbx,%rsi
  100e42:	bf 38 16 10 00       	mov    $0x101638,%edi
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

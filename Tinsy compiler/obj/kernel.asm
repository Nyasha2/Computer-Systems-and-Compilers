
obj/kernel.full:     file format elf64-x86-64


Disassembly of section .text:

0000000000040000 <_kernel_start>:
   40000:	48 c7 c4 00 00 08 00 	mov    $0x80000,%rsp
   40007:	48 89 e5             	mov    %rsp,%rbp
   4000a:	6a 00                	pushq  $0x0
   4000c:	9d                   	popfq  
   4000d:	3d 02 b0 ad 2b       	cmp    $0x2badb002,%eax
   40012:	75 0d                	jne    40021 <_kernel_start+0x21>
   40014:	f7 03 04 00 00 00    	testl  $0x4,(%rbx)
   4001a:	74 05                	je     40021 <_kernel_start+0x21>
   4001c:	8b 7b 10             	mov    0x10(%rbx),%edi
   4001f:	eb 07                	jmp    40028 <_kernel_start+0x28>
   40021:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
   40028:	e9 fc 0e 00 00       	jmpq   40f29 <kernel_start(char const*)>

000000000004002d <exception_entry_0>:
   4002d:	6a 00                	pushq  $0x0
   4002f:	6a 00                	pushq  $0x0
   40031:	e9 3c 0a 00 00       	jmpq   40a72 <exception_entry>

0000000000040036 <exception_entry_1>:
   40036:	6a 00                	pushq  $0x0
   40038:	6a 01                	pushq  $0x1
   4003a:	e9 33 0a 00 00       	jmpq   40a72 <exception_entry>

000000000004003f <exception_entry_2>:
   4003f:	6a 00                	pushq  $0x0
   40041:	6a 02                	pushq  $0x2
   40043:	e9 2a 0a 00 00       	jmpq   40a72 <exception_entry>

0000000000040048 <exception_entry_3>:
   40048:	6a 00                	pushq  $0x0
   4004a:	6a 03                	pushq  $0x3
   4004c:	e9 21 0a 00 00       	jmpq   40a72 <exception_entry>

0000000000040051 <exception_entry_4>:
   40051:	6a 00                	pushq  $0x0
   40053:	6a 04                	pushq  $0x4
   40055:	e9 18 0a 00 00       	jmpq   40a72 <exception_entry>

000000000004005a <exception_entry_5>:
   4005a:	6a 00                	pushq  $0x0
   4005c:	6a 05                	pushq  $0x5
   4005e:	e9 0f 0a 00 00       	jmpq   40a72 <exception_entry>

0000000000040063 <exception_entry_6>:
   40063:	6a 00                	pushq  $0x0
   40065:	6a 06                	pushq  $0x6
   40067:	e9 06 0a 00 00       	jmpq   40a72 <exception_entry>

000000000004006c <exception_entry_7>:
   4006c:	6a 00                	pushq  $0x0
   4006e:	6a 07                	pushq  $0x7
   40070:	e9 fd 09 00 00       	jmpq   40a72 <exception_entry>

0000000000040075 <exception_entry_8>:
   40075:	6a 08                	pushq  $0x8
   40077:	e9 f6 09 00 00       	jmpq   40a72 <exception_entry>

000000000004007c <exception_entry_9>:
   4007c:	6a 00                	pushq  $0x0
   4007e:	6a 09                	pushq  $0x9
   40080:	e9 ed 09 00 00       	jmpq   40a72 <exception_entry>

0000000000040085 <exception_entry_10>:
   40085:	6a 0a                	pushq  $0xa
   40087:	e9 e6 09 00 00       	jmpq   40a72 <exception_entry>

000000000004008c <exception_entry_11>:
   4008c:	6a 0b                	pushq  $0xb
   4008e:	e9 df 09 00 00       	jmpq   40a72 <exception_entry>

0000000000040093 <exception_entry_12>:
   40093:	6a 0c                	pushq  $0xc
   40095:	e9 d8 09 00 00       	jmpq   40a72 <exception_entry>

000000000004009a <exception_entry_13>:
   4009a:	6a 0d                	pushq  $0xd
   4009c:	e9 d1 09 00 00       	jmpq   40a72 <exception_entry>

00000000000400a1 <exception_entry_14>:
   400a1:	6a 0e                	pushq  $0xe
   400a3:	e9 ca 09 00 00       	jmpq   40a72 <exception_entry>

00000000000400a8 <exception_entry_15>:
   400a8:	6a 00                	pushq  $0x0
   400aa:	6a 0f                	pushq  $0xf
   400ac:	e9 c1 09 00 00       	jmpq   40a72 <exception_entry>

00000000000400b1 <exception_entry_16>:
   400b1:	6a 00                	pushq  $0x0
   400b3:	6a 10                	pushq  $0x10
   400b5:	e9 b8 09 00 00       	jmpq   40a72 <exception_entry>

00000000000400ba <exception_entry_17>:
   400ba:	6a 11                	pushq  $0x11
   400bc:	e9 b1 09 00 00       	jmpq   40a72 <exception_entry>

00000000000400c1 <exception_entry_18>:
   400c1:	6a 00                	pushq  $0x0
   400c3:	6a 12                	pushq  $0x12
   400c5:	e9 a8 09 00 00       	jmpq   40a72 <exception_entry>

00000000000400ca <exception_entry_19>:
   400ca:	6a 00                	pushq  $0x0
   400cc:	6a 13                	pushq  $0x13
   400ce:	e9 9f 09 00 00       	jmpq   40a72 <exception_entry>

00000000000400d3 <exception_entry_20>:
   400d3:	6a 00                	pushq  $0x0
   400d5:	6a 14                	pushq  $0x14
   400d7:	e9 96 09 00 00       	jmpq   40a72 <exception_entry>

00000000000400dc <exception_entry_21>:
   400dc:	6a 00                	pushq  $0x0
   400de:	6a 15                	pushq  $0x15
   400e0:	e9 8d 09 00 00       	jmpq   40a72 <exception_entry>

00000000000400e5 <exception_entry_22>:
   400e5:	6a 00                	pushq  $0x0
   400e7:	6a 16                	pushq  $0x16
   400e9:	e9 84 09 00 00       	jmpq   40a72 <exception_entry>

00000000000400ee <exception_entry_23>:
   400ee:	6a 00                	pushq  $0x0
   400f0:	6a 17                	pushq  $0x17
   400f2:	e9 7b 09 00 00       	jmpq   40a72 <exception_entry>

00000000000400f7 <exception_entry_24>:
   400f7:	6a 00                	pushq  $0x0
   400f9:	6a 18                	pushq  $0x18
   400fb:	e9 72 09 00 00       	jmpq   40a72 <exception_entry>

0000000000040100 <exception_entry_25>:
   40100:	6a 00                	pushq  $0x0
   40102:	6a 19                	pushq  $0x19
   40104:	e9 69 09 00 00       	jmpq   40a72 <exception_entry>

0000000000040109 <exception_entry_26>:
   40109:	6a 00                	pushq  $0x0
   4010b:	6a 1a                	pushq  $0x1a
   4010d:	e9 60 09 00 00       	jmpq   40a72 <exception_entry>

0000000000040112 <exception_entry_27>:
   40112:	6a 00                	pushq  $0x0
   40114:	6a 1b                	pushq  $0x1b
   40116:	e9 57 09 00 00       	jmpq   40a72 <exception_entry>

000000000004011b <exception_entry_28>:
   4011b:	6a 00                	pushq  $0x0
   4011d:	6a 1c                	pushq  $0x1c
   4011f:	e9 4e 09 00 00       	jmpq   40a72 <exception_entry>

0000000000040124 <exception_entry_29>:
   40124:	6a 00                	pushq  $0x0
   40126:	6a 1d                	pushq  $0x1d
   40128:	e9 45 09 00 00       	jmpq   40a72 <exception_entry>

000000000004012d <exception_entry_30>:
   4012d:	6a 00                	pushq  $0x0
   4012f:	6a 1e                	pushq  $0x1e
   40131:	e9 3c 09 00 00       	jmpq   40a72 <exception_entry>

0000000000040136 <exception_entry_31>:
   40136:	6a 00                	pushq  $0x0
   40138:	6a 1f                	pushq  $0x1f
   4013a:	e9 33 09 00 00       	jmpq   40a72 <exception_entry>

000000000004013f <exception_entry_32>:
   4013f:	6a 00                	pushq  $0x0
   40141:	6a 20                	pushq  $0x20
   40143:	e9 2a 09 00 00       	jmpq   40a72 <exception_entry>

0000000000040148 <exception_entry_33>:
   40148:	6a 00                	pushq  $0x0
   4014a:	6a 21                	pushq  $0x21
   4014c:	e9 21 09 00 00       	jmpq   40a72 <exception_entry>

0000000000040151 <exception_entry_34>:
   40151:	6a 00                	pushq  $0x0
   40153:	6a 22                	pushq  $0x22
   40155:	e9 18 09 00 00       	jmpq   40a72 <exception_entry>

000000000004015a <exception_entry_35>:
   4015a:	6a 00                	pushq  $0x0
   4015c:	6a 23                	pushq  $0x23
   4015e:	e9 0f 09 00 00       	jmpq   40a72 <exception_entry>

0000000000040163 <exception_entry_36>:
   40163:	6a 00                	pushq  $0x0
   40165:	6a 24                	pushq  $0x24
   40167:	e9 06 09 00 00       	jmpq   40a72 <exception_entry>

000000000004016c <exception_entry_37>:
   4016c:	6a 00                	pushq  $0x0
   4016e:	6a 25                	pushq  $0x25
   40170:	e9 fd 08 00 00       	jmpq   40a72 <exception_entry>

0000000000040175 <exception_entry_38>:
   40175:	6a 00                	pushq  $0x0
   40177:	6a 26                	pushq  $0x26
   40179:	e9 f4 08 00 00       	jmpq   40a72 <exception_entry>

000000000004017e <exception_entry_39>:
   4017e:	6a 00                	pushq  $0x0
   40180:	6a 27                	pushq  $0x27
   40182:	e9 eb 08 00 00       	jmpq   40a72 <exception_entry>

0000000000040187 <exception_entry_40>:
   40187:	6a 00                	pushq  $0x0
   40189:	6a 28                	pushq  $0x28
   4018b:	e9 e2 08 00 00       	jmpq   40a72 <exception_entry>

0000000000040190 <exception_entry_41>:
   40190:	6a 00                	pushq  $0x0
   40192:	6a 29                	pushq  $0x29
   40194:	e9 d9 08 00 00       	jmpq   40a72 <exception_entry>

0000000000040199 <exception_entry_42>:
   40199:	6a 00                	pushq  $0x0
   4019b:	6a 2a                	pushq  $0x2a
   4019d:	e9 d0 08 00 00       	jmpq   40a72 <exception_entry>

00000000000401a2 <exception_entry_43>:
   401a2:	6a 00                	pushq  $0x0
   401a4:	6a 2b                	pushq  $0x2b
   401a6:	e9 c7 08 00 00       	jmpq   40a72 <exception_entry>

00000000000401ab <exception_entry_44>:
   401ab:	6a 00                	pushq  $0x0
   401ad:	6a 2c                	pushq  $0x2c
   401af:	e9 be 08 00 00       	jmpq   40a72 <exception_entry>

00000000000401b4 <exception_entry_45>:
   401b4:	6a 00                	pushq  $0x0
   401b6:	6a 2d                	pushq  $0x2d
   401b8:	e9 b5 08 00 00       	jmpq   40a72 <exception_entry>

00000000000401bd <exception_entry_46>:
   401bd:	6a 00                	pushq  $0x0
   401bf:	6a 2e                	pushq  $0x2e
   401c1:	e9 ac 08 00 00       	jmpq   40a72 <exception_entry>

00000000000401c6 <exception_entry_47>:
   401c6:	6a 00                	pushq  $0x0
   401c8:	6a 2f                	pushq  $0x2f
   401ca:	e9 a3 08 00 00       	jmpq   40a72 <exception_entry>

00000000000401cf <exception_entry_48>:
   401cf:	6a 00                	pushq  $0x0
   401d1:	6a 30                	pushq  $0x30
   401d3:	e9 9a 08 00 00       	jmpq   40a72 <exception_entry>

00000000000401d8 <exception_entry_49>:
   401d8:	6a 00                	pushq  $0x0
   401da:	6a 31                	pushq  $0x31
   401dc:	e9 91 08 00 00       	jmpq   40a72 <exception_entry>

00000000000401e1 <exception_entry_50>:
   401e1:	6a 00                	pushq  $0x0
   401e3:	6a 32                	pushq  $0x32
   401e5:	e9 88 08 00 00       	jmpq   40a72 <exception_entry>

00000000000401ea <exception_entry_51>:
   401ea:	6a 00                	pushq  $0x0
   401ec:	6a 33                	pushq  $0x33
   401ee:	e9 7f 08 00 00       	jmpq   40a72 <exception_entry>

00000000000401f3 <exception_entry_52>:
   401f3:	6a 00                	pushq  $0x0
   401f5:	6a 34                	pushq  $0x34
   401f7:	e9 76 08 00 00       	jmpq   40a72 <exception_entry>

00000000000401fc <exception_entry_53>:
   401fc:	6a 00                	pushq  $0x0
   401fe:	6a 35                	pushq  $0x35
   40200:	e9 6d 08 00 00       	jmpq   40a72 <exception_entry>

0000000000040205 <exception_entry_54>:
   40205:	6a 00                	pushq  $0x0
   40207:	6a 36                	pushq  $0x36
   40209:	e9 64 08 00 00       	jmpq   40a72 <exception_entry>

000000000004020e <exception_entry_55>:
   4020e:	6a 00                	pushq  $0x0
   40210:	6a 37                	pushq  $0x37
   40212:	e9 5b 08 00 00       	jmpq   40a72 <exception_entry>

0000000000040217 <exception_entry_56>:
   40217:	6a 00                	pushq  $0x0
   40219:	6a 38                	pushq  $0x38
   4021b:	e9 52 08 00 00       	jmpq   40a72 <exception_entry>

0000000000040220 <exception_entry_57>:
   40220:	6a 00                	pushq  $0x0
   40222:	6a 39                	pushq  $0x39
   40224:	e9 49 08 00 00       	jmpq   40a72 <exception_entry>

0000000000040229 <exception_entry_58>:
   40229:	6a 00                	pushq  $0x0
   4022b:	6a 3a                	pushq  $0x3a
   4022d:	e9 40 08 00 00       	jmpq   40a72 <exception_entry>

0000000000040232 <exception_entry_59>:
   40232:	6a 00                	pushq  $0x0
   40234:	6a 3b                	pushq  $0x3b
   40236:	e9 37 08 00 00       	jmpq   40a72 <exception_entry>

000000000004023b <exception_entry_60>:
   4023b:	6a 00                	pushq  $0x0
   4023d:	6a 3c                	pushq  $0x3c
   4023f:	e9 2e 08 00 00       	jmpq   40a72 <exception_entry>

0000000000040244 <exception_entry_61>:
   40244:	6a 00                	pushq  $0x0
   40246:	6a 3d                	pushq  $0x3d
   40248:	e9 25 08 00 00       	jmpq   40a72 <exception_entry>

000000000004024d <exception_entry_62>:
   4024d:	6a 00                	pushq  $0x0
   4024f:	6a 3e                	pushq  $0x3e
   40251:	e9 1c 08 00 00       	jmpq   40a72 <exception_entry>

0000000000040256 <exception_entry_63>:
   40256:	6a 00                	pushq  $0x0
   40258:	6a 3f                	pushq  $0x3f
   4025a:	e9 13 08 00 00       	jmpq   40a72 <exception_entry>

000000000004025f <exception_entry_64>:
   4025f:	6a 00                	pushq  $0x0
   40261:	6a 40                	pushq  $0x40
   40263:	e9 0a 08 00 00       	jmpq   40a72 <exception_entry>

0000000000040268 <exception_entry_65>:
   40268:	6a 00                	pushq  $0x0
   4026a:	6a 41                	pushq  $0x41
   4026c:	e9 01 08 00 00       	jmpq   40a72 <exception_entry>

0000000000040271 <exception_entry_66>:
   40271:	6a 00                	pushq  $0x0
   40273:	6a 42                	pushq  $0x42
   40275:	e9 f8 07 00 00       	jmpq   40a72 <exception_entry>

000000000004027a <exception_entry_67>:
   4027a:	6a 00                	pushq  $0x0
   4027c:	6a 43                	pushq  $0x43
   4027e:	e9 ef 07 00 00       	jmpq   40a72 <exception_entry>

0000000000040283 <exception_entry_68>:
   40283:	6a 00                	pushq  $0x0
   40285:	6a 44                	pushq  $0x44
   40287:	e9 e6 07 00 00       	jmpq   40a72 <exception_entry>

000000000004028c <exception_entry_69>:
   4028c:	6a 00                	pushq  $0x0
   4028e:	6a 45                	pushq  $0x45
   40290:	e9 dd 07 00 00       	jmpq   40a72 <exception_entry>

0000000000040295 <exception_entry_70>:
   40295:	6a 00                	pushq  $0x0
   40297:	6a 46                	pushq  $0x46
   40299:	e9 d4 07 00 00       	jmpq   40a72 <exception_entry>

000000000004029e <exception_entry_71>:
   4029e:	6a 00                	pushq  $0x0
   402a0:	6a 47                	pushq  $0x47
   402a2:	e9 cb 07 00 00       	jmpq   40a72 <exception_entry>

00000000000402a7 <exception_entry_72>:
   402a7:	6a 00                	pushq  $0x0
   402a9:	6a 48                	pushq  $0x48
   402ab:	e9 c2 07 00 00       	jmpq   40a72 <exception_entry>

00000000000402b0 <exception_entry_73>:
   402b0:	6a 00                	pushq  $0x0
   402b2:	6a 49                	pushq  $0x49
   402b4:	e9 b9 07 00 00       	jmpq   40a72 <exception_entry>

00000000000402b9 <exception_entry_74>:
   402b9:	6a 00                	pushq  $0x0
   402bb:	6a 4a                	pushq  $0x4a
   402bd:	e9 b0 07 00 00       	jmpq   40a72 <exception_entry>

00000000000402c2 <exception_entry_75>:
   402c2:	6a 00                	pushq  $0x0
   402c4:	6a 4b                	pushq  $0x4b
   402c6:	e9 a7 07 00 00       	jmpq   40a72 <exception_entry>

00000000000402cb <exception_entry_76>:
   402cb:	6a 00                	pushq  $0x0
   402cd:	6a 4c                	pushq  $0x4c
   402cf:	e9 9e 07 00 00       	jmpq   40a72 <exception_entry>

00000000000402d4 <exception_entry_77>:
   402d4:	6a 00                	pushq  $0x0
   402d6:	6a 4d                	pushq  $0x4d
   402d8:	e9 95 07 00 00       	jmpq   40a72 <exception_entry>

00000000000402dd <exception_entry_78>:
   402dd:	6a 00                	pushq  $0x0
   402df:	6a 4e                	pushq  $0x4e
   402e1:	e9 8c 07 00 00       	jmpq   40a72 <exception_entry>

00000000000402e6 <exception_entry_79>:
   402e6:	6a 00                	pushq  $0x0
   402e8:	6a 4f                	pushq  $0x4f
   402ea:	e9 83 07 00 00       	jmpq   40a72 <exception_entry>

00000000000402ef <exception_entry_80>:
   402ef:	6a 00                	pushq  $0x0
   402f1:	6a 50                	pushq  $0x50
   402f3:	e9 7a 07 00 00       	jmpq   40a72 <exception_entry>

00000000000402f8 <exception_entry_81>:
   402f8:	6a 00                	pushq  $0x0
   402fa:	6a 51                	pushq  $0x51
   402fc:	e9 71 07 00 00       	jmpq   40a72 <exception_entry>

0000000000040301 <exception_entry_82>:
   40301:	6a 00                	pushq  $0x0
   40303:	6a 52                	pushq  $0x52
   40305:	e9 68 07 00 00       	jmpq   40a72 <exception_entry>

000000000004030a <exception_entry_83>:
   4030a:	6a 00                	pushq  $0x0
   4030c:	6a 53                	pushq  $0x53
   4030e:	e9 5f 07 00 00       	jmpq   40a72 <exception_entry>

0000000000040313 <exception_entry_84>:
   40313:	6a 00                	pushq  $0x0
   40315:	6a 54                	pushq  $0x54
   40317:	e9 56 07 00 00       	jmpq   40a72 <exception_entry>

000000000004031c <exception_entry_85>:
   4031c:	6a 00                	pushq  $0x0
   4031e:	6a 55                	pushq  $0x55
   40320:	e9 4d 07 00 00       	jmpq   40a72 <exception_entry>

0000000000040325 <exception_entry_86>:
   40325:	6a 00                	pushq  $0x0
   40327:	6a 56                	pushq  $0x56
   40329:	e9 44 07 00 00       	jmpq   40a72 <exception_entry>

000000000004032e <exception_entry_87>:
   4032e:	6a 00                	pushq  $0x0
   40330:	6a 57                	pushq  $0x57
   40332:	e9 3b 07 00 00       	jmpq   40a72 <exception_entry>

0000000000040337 <exception_entry_88>:
   40337:	6a 00                	pushq  $0x0
   40339:	6a 58                	pushq  $0x58
   4033b:	e9 32 07 00 00       	jmpq   40a72 <exception_entry>

0000000000040340 <exception_entry_89>:
   40340:	6a 00                	pushq  $0x0
   40342:	6a 59                	pushq  $0x59
   40344:	e9 29 07 00 00       	jmpq   40a72 <exception_entry>

0000000000040349 <exception_entry_90>:
   40349:	6a 00                	pushq  $0x0
   4034b:	6a 5a                	pushq  $0x5a
   4034d:	e9 20 07 00 00       	jmpq   40a72 <exception_entry>

0000000000040352 <exception_entry_91>:
   40352:	6a 00                	pushq  $0x0
   40354:	6a 5b                	pushq  $0x5b
   40356:	e9 17 07 00 00       	jmpq   40a72 <exception_entry>

000000000004035b <exception_entry_92>:
   4035b:	6a 00                	pushq  $0x0
   4035d:	6a 5c                	pushq  $0x5c
   4035f:	e9 0e 07 00 00       	jmpq   40a72 <exception_entry>

0000000000040364 <exception_entry_93>:
   40364:	6a 00                	pushq  $0x0
   40366:	6a 5d                	pushq  $0x5d
   40368:	e9 05 07 00 00       	jmpq   40a72 <exception_entry>

000000000004036d <exception_entry_94>:
   4036d:	6a 00                	pushq  $0x0
   4036f:	6a 5e                	pushq  $0x5e
   40371:	e9 fc 06 00 00       	jmpq   40a72 <exception_entry>

0000000000040376 <exception_entry_95>:
   40376:	6a 00                	pushq  $0x0
   40378:	6a 5f                	pushq  $0x5f
   4037a:	e9 f3 06 00 00       	jmpq   40a72 <exception_entry>

000000000004037f <exception_entry_96>:
   4037f:	6a 00                	pushq  $0x0
   40381:	6a 60                	pushq  $0x60
   40383:	e9 ea 06 00 00       	jmpq   40a72 <exception_entry>

0000000000040388 <exception_entry_97>:
   40388:	6a 00                	pushq  $0x0
   4038a:	6a 61                	pushq  $0x61
   4038c:	e9 e1 06 00 00       	jmpq   40a72 <exception_entry>

0000000000040391 <exception_entry_98>:
   40391:	6a 00                	pushq  $0x0
   40393:	6a 62                	pushq  $0x62
   40395:	e9 d8 06 00 00       	jmpq   40a72 <exception_entry>

000000000004039a <exception_entry_99>:
   4039a:	6a 00                	pushq  $0x0
   4039c:	6a 63                	pushq  $0x63
   4039e:	e9 cf 06 00 00       	jmpq   40a72 <exception_entry>

00000000000403a3 <exception_entry_100>:
   403a3:	6a 00                	pushq  $0x0
   403a5:	6a 64                	pushq  $0x64
   403a7:	e9 c6 06 00 00       	jmpq   40a72 <exception_entry>

00000000000403ac <exception_entry_101>:
   403ac:	6a 00                	pushq  $0x0
   403ae:	6a 65                	pushq  $0x65
   403b0:	e9 bd 06 00 00       	jmpq   40a72 <exception_entry>

00000000000403b5 <exception_entry_102>:
   403b5:	6a 00                	pushq  $0x0
   403b7:	6a 66                	pushq  $0x66
   403b9:	e9 b4 06 00 00       	jmpq   40a72 <exception_entry>

00000000000403be <exception_entry_103>:
   403be:	6a 00                	pushq  $0x0
   403c0:	6a 67                	pushq  $0x67
   403c2:	e9 ab 06 00 00       	jmpq   40a72 <exception_entry>

00000000000403c7 <exception_entry_104>:
   403c7:	6a 00                	pushq  $0x0
   403c9:	6a 68                	pushq  $0x68
   403cb:	e9 a2 06 00 00       	jmpq   40a72 <exception_entry>

00000000000403d0 <exception_entry_105>:
   403d0:	6a 00                	pushq  $0x0
   403d2:	6a 69                	pushq  $0x69
   403d4:	e9 99 06 00 00       	jmpq   40a72 <exception_entry>

00000000000403d9 <exception_entry_106>:
   403d9:	6a 00                	pushq  $0x0
   403db:	6a 6a                	pushq  $0x6a
   403dd:	e9 90 06 00 00       	jmpq   40a72 <exception_entry>

00000000000403e2 <exception_entry_107>:
   403e2:	6a 00                	pushq  $0x0
   403e4:	6a 6b                	pushq  $0x6b
   403e6:	e9 87 06 00 00       	jmpq   40a72 <exception_entry>

00000000000403eb <exception_entry_108>:
   403eb:	6a 00                	pushq  $0x0
   403ed:	6a 6c                	pushq  $0x6c
   403ef:	e9 7e 06 00 00       	jmpq   40a72 <exception_entry>

00000000000403f4 <exception_entry_109>:
   403f4:	6a 00                	pushq  $0x0
   403f6:	6a 6d                	pushq  $0x6d
   403f8:	e9 75 06 00 00       	jmpq   40a72 <exception_entry>

00000000000403fd <exception_entry_110>:
   403fd:	6a 00                	pushq  $0x0
   403ff:	6a 6e                	pushq  $0x6e
   40401:	e9 6c 06 00 00       	jmpq   40a72 <exception_entry>

0000000000040406 <exception_entry_111>:
   40406:	6a 00                	pushq  $0x0
   40408:	6a 6f                	pushq  $0x6f
   4040a:	e9 63 06 00 00       	jmpq   40a72 <exception_entry>

000000000004040f <exception_entry_112>:
   4040f:	6a 00                	pushq  $0x0
   40411:	6a 70                	pushq  $0x70
   40413:	e9 5a 06 00 00       	jmpq   40a72 <exception_entry>

0000000000040418 <exception_entry_113>:
   40418:	6a 00                	pushq  $0x0
   4041a:	6a 71                	pushq  $0x71
   4041c:	e9 51 06 00 00       	jmpq   40a72 <exception_entry>

0000000000040421 <exception_entry_114>:
   40421:	6a 00                	pushq  $0x0
   40423:	6a 72                	pushq  $0x72
   40425:	e9 48 06 00 00       	jmpq   40a72 <exception_entry>

000000000004042a <exception_entry_115>:
   4042a:	6a 00                	pushq  $0x0
   4042c:	6a 73                	pushq  $0x73
   4042e:	e9 3f 06 00 00       	jmpq   40a72 <exception_entry>

0000000000040433 <exception_entry_116>:
   40433:	6a 00                	pushq  $0x0
   40435:	6a 74                	pushq  $0x74
   40437:	e9 36 06 00 00       	jmpq   40a72 <exception_entry>

000000000004043c <exception_entry_117>:
   4043c:	6a 00                	pushq  $0x0
   4043e:	6a 75                	pushq  $0x75
   40440:	e9 2d 06 00 00       	jmpq   40a72 <exception_entry>

0000000000040445 <exception_entry_118>:
   40445:	6a 00                	pushq  $0x0
   40447:	6a 76                	pushq  $0x76
   40449:	e9 24 06 00 00       	jmpq   40a72 <exception_entry>

000000000004044e <exception_entry_119>:
   4044e:	6a 00                	pushq  $0x0
   40450:	6a 77                	pushq  $0x77
   40452:	e9 1b 06 00 00       	jmpq   40a72 <exception_entry>

0000000000040457 <exception_entry_120>:
   40457:	6a 00                	pushq  $0x0
   40459:	6a 78                	pushq  $0x78
   4045b:	e9 12 06 00 00       	jmpq   40a72 <exception_entry>

0000000000040460 <exception_entry_121>:
   40460:	6a 00                	pushq  $0x0
   40462:	6a 79                	pushq  $0x79
   40464:	e9 09 06 00 00       	jmpq   40a72 <exception_entry>

0000000000040469 <exception_entry_122>:
   40469:	6a 00                	pushq  $0x0
   4046b:	6a 7a                	pushq  $0x7a
   4046d:	e9 00 06 00 00       	jmpq   40a72 <exception_entry>

0000000000040472 <exception_entry_123>:
   40472:	6a 00                	pushq  $0x0
   40474:	6a 7b                	pushq  $0x7b
   40476:	e9 f7 05 00 00       	jmpq   40a72 <exception_entry>

000000000004047b <exception_entry_124>:
   4047b:	6a 00                	pushq  $0x0
   4047d:	6a 7c                	pushq  $0x7c
   4047f:	e9 ee 05 00 00       	jmpq   40a72 <exception_entry>

0000000000040484 <exception_entry_125>:
   40484:	6a 00                	pushq  $0x0
   40486:	6a 7d                	pushq  $0x7d
   40488:	e9 e5 05 00 00       	jmpq   40a72 <exception_entry>

000000000004048d <exception_entry_126>:
   4048d:	6a 00                	pushq  $0x0
   4048f:	6a 7e                	pushq  $0x7e
   40491:	e9 dc 05 00 00       	jmpq   40a72 <exception_entry>

0000000000040496 <exception_entry_127>:
   40496:	6a 00                	pushq  $0x0
   40498:	6a 7f                	pushq  $0x7f
   4049a:	e9 d3 05 00 00       	jmpq   40a72 <exception_entry>

000000000004049f <exception_entry_128>:
   4049f:	6a 00                	pushq  $0x0
   404a1:	68 80 00 00 00       	pushq  $0x80
   404a6:	e9 c7 05 00 00       	jmpq   40a72 <exception_entry>

00000000000404ab <exception_entry_129>:
   404ab:	6a 00                	pushq  $0x0
   404ad:	68 81 00 00 00       	pushq  $0x81
   404b2:	e9 bb 05 00 00       	jmpq   40a72 <exception_entry>

00000000000404b7 <exception_entry_130>:
   404b7:	6a 00                	pushq  $0x0
   404b9:	68 82 00 00 00       	pushq  $0x82
   404be:	e9 af 05 00 00       	jmpq   40a72 <exception_entry>

00000000000404c3 <exception_entry_131>:
   404c3:	6a 00                	pushq  $0x0
   404c5:	68 83 00 00 00       	pushq  $0x83
   404ca:	e9 a3 05 00 00       	jmpq   40a72 <exception_entry>

00000000000404cf <exception_entry_132>:
   404cf:	6a 00                	pushq  $0x0
   404d1:	68 84 00 00 00       	pushq  $0x84
   404d6:	e9 97 05 00 00       	jmpq   40a72 <exception_entry>

00000000000404db <exception_entry_133>:
   404db:	6a 00                	pushq  $0x0
   404dd:	68 85 00 00 00       	pushq  $0x85
   404e2:	e9 8b 05 00 00       	jmpq   40a72 <exception_entry>

00000000000404e7 <exception_entry_134>:
   404e7:	6a 00                	pushq  $0x0
   404e9:	68 86 00 00 00       	pushq  $0x86
   404ee:	e9 7f 05 00 00       	jmpq   40a72 <exception_entry>

00000000000404f3 <exception_entry_135>:
   404f3:	6a 00                	pushq  $0x0
   404f5:	68 87 00 00 00       	pushq  $0x87
   404fa:	e9 73 05 00 00       	jmpq   40a72 <exception_entry>

00000000000404ff <exception_entry_136>:
   404ff:	6a 00                	pushq  $0x0
   40501:	68 88 00 00 00       	pushq  $0x88
   40506:	e9 67 05 00 00       	jmpq   40a72 <exception_entry>

000000000004050b <exception_entry_137>:
   4050b:	6a 00                	pushq  $0x0
   4050d:	68 89 00 00 00       	pushq  $0x89
   40512:	e9 5b 05 00 00       	jmpq   40a72 <exception_entry>

0000000000040517 <exception_entry_138>:
   40517:	6a 00                	pushq  $0x0
   40519:	68 8a 00 00 00       	pushq  $0x8a
   4051e:	e9 4f 05 00 00       	jmpq   40a72 <exception_entry>

0000000000040523 <exception_entry_139>:
   40523:	6a 00                	pushq  $0x0
   40525:	68 8b 00 00 00       	pushq  $0x8b
   4052a:	e9 43 05 00 00       	jmpq   40a72 <exception_entry>

000000000004052f <exception_entry_140>:
   4052f:	6a 00                	pushq  $0x0
   40531:	68 8c 00 00 00       	pushq  $0x8c
   40536:	e9 37 05 00 00       	jmpq   40a72 <exception_entry>

000000000004053b <exception_entry_141>:
   4053b:	6a 00                	pushq  $0x0
   4053d:	68 8d 00 00 00       	pushq  $0x8d
   40542:	e9 2b 05 00 00       	jmpq   40a72 <exception_entry>

0000000000040547 <exception_entry_142>:
   40547:	6a 00                	pushq  $0x0
   40549:	68 8e 00 00 00       	pushq  $0x8e
   4054e:	e9 1f 05 00 00       	jmpq   40a72 <exception_entry>

0000000000040553 <exception_entry_143>:
   40553:	6a 00                	pushq  $0x0
   40555:	68 8f 00 00 00       	pushq  $0x8f
   4055a:	e9 13 05 00 00       	jmpq   40a72 <exception_entry>

000000000004055f <exception_entry_144>:
   4055f:	6a 00                	pushq  $0x0
   40561:	68 90 00 00 00       	pushq  $0x90
   40566:	e9 07 05 00 00       	jmpq   40a72 <exception_entry>

000000000004056b <exception_entry_145>:
   4056b:	6a 00                	pushq  $0x0
   4056d:	68 91 00 00 00       	pushq  $0x91
   40572:	e9 fb 04 00 00       	jmpq   40a72 <exception_entry>

0000000000040577 <exception_entry_146>:
   40577:	6a 00                	pushq  $0x0
   40579:	68 92 00 00 00       	pushq  $0x92
   4057e:	e9 ef 04 00 00       	jmpq   40a72 <exception_entry>

0000000000040583 <exception_entry_147>:
   40583:	6a 00                	pushq  $0x0
   40585:	68 93 00 00 00       	pushq  $0x93
   4058a:	e9 e3 04 00 00       	jmpq   40a72 <exception_entry>

000000000004058f <exception_entry_148>:
   4058f:	6a 00                	pushq  $0x0
   40591:	68 94 00 00 00       	pushq  $0x94
   40596:	e9 d7 04 00 00       	jmpq   40a72 <exception_entry>

000000000004059b <exception_entry_149>:
   4059b:	6a 00                	pushq  $0x0
   4059d:	68 95 00 00 00       	pushq  $0x95
   405a2:	e9 cb 04 00 00       	jmpq   40a72 <exception_entry>

00000000000405a7 <exception_entry_150>:
   405a7:	6a 00                	pushq  $0x0
   405a9:	68 96 00 00 00       	pushq  $0x96
   405ae:	e9 bf 04 00 00       	jmpq   40a72 <exception_entry>

00000000000405b3 <exception_entry_151>:
   405b3:	6a 00                	pushq  $0x0
   405b5:	68 97 00 00 00       	pushq  $0x97
   405ba:	e9 b3 04 00 00       	jmpq   40a72 <exception_entry>

00000000000405bf <exception_entry_152>:
   405bf:	6a 00                	pushq  $0x0
   405c1:	68 98 00 00 00       	pushq  $0x98
   405c6:	e9 a7 04 00 00       	jmpq   40a72 <exception_entry>

00000000000405cb <exception_entry_153>:
   405cb:	6a 00                	pushq  $0x0
   405cd:	68 99 00 00 00       	pushq  $0x99
   405d2:	e9 9b 04 00 00       	jmpq   40a72 <exception_entry>

00000000000405d7 <exception_entry_154>:
   405d7:	6a 00                	pushq  $0x0
   405d9:	68 9a 00 00 00       	pushq  $0x9a
   405de:	e9 8f 04 00 00       	jmpq   40a72 <exception_entry>

00000000000405e3 <exception_entry_155>:
   405e3:	6a 00                	pushq  $0x0
   405e5:	68 9b 00 00 00       	pushq  $0x9b
   405ea:	e9 83 04 00 00       	jmpq   40a72 <exception_entry>

00000000000405ef <exception_entry_156>:
   405ef:	6a 00                	pushq  $0x0
   405f1:	68 9c 00 00 00       	pushq  $0x9c
   405f6:	e9 77 04 00 00       	jmpq   40a72 <exception_entry>

00000000000405fb <exception_entry_157>:
   405fb:	6a 00                	pushq  $0x0
   405fd:	68 9d 00 00 00       	pushq  $0x9d
   40602:	e9 6b 04 00 00       	jmpq   40a72 <exception_entry>

0000000000040607 <exception_entry_158>:
   40607:	6a 00                	pushq  $0x0
   40609:	68 9e 00 00 00       	pushq  $0x9e
   4060e:	e9 5f 04 00 00       	jmpq   40a72 <exception_entry>

0000000000040613 <exception_entry_159>:
   40613:	6a 00                	pushq  $0x0
   40615:	68 9f 00 00 00       	pushq  $0x9f
   4061a:	e9 53 04 00 00       	jmpq   40a72 <exception_entry>

000000000004061f <exception_entry_160>:
   4061f:	6a 00                	pushq  $0x0
   40621:	68 a0 00 00 00       	pushq  $0xa0
   40626:	e9 47 04 00 00       	jmpq   40a72 <exception_entry>

000000000004062b <exception_entry_161>:
   4062b:	6a 00                	pushq  $0x0
   4062d:	68 a1 00 00 00       	pushq  $0xa1
   40632:	e9 3b 04 00 00       	jmpq   40a72 <exception_entry>

0000000000040637 <exception_entry_162>:
   40637:	6a 00                	pushq  $0x0
   40639:	68 a2 00 00 00       	pushq  $0xa2
   4063e:	e9 2f 04 00 00       	jmpq   40a72 <exception_entry>

0000000000040643 <exception_entry_163>:
   40643:	6a 00                	pushq  $0x0
   40645:	68 a3 00 00 00       	pushq  $0xa3
   4064a:	e9 23 04 00 00       	jmpq   40a72 <exception_entry>

000000000004064f <exception_entry_164>:
   4064f:	6a 00                	pushq  $0x0
   40651:	68 a4 00 00 00       	pushq  $0xa4
   40656:	e9 17 04 00 00       	jmpq   40a72 <exception_entry>

000000000004065b <exception_entry_165>:
   4065b:	6a 00                	pushq  $0x0
   4065d:	68 a5 00 00 00       	pushq  $0xa5
   40662:	e9 0b 04 00 00       	jmpq   40a72 <exception_entry>

0000000000040667 <exception_entry_166>:
   40667:	6a 00                	pushq  $0x0
   40669:	68 a6 00 00 00       	pushq  $0xa6
   4066e:	e9 ff 03 00 00       	jmpq   40a72 <exception_entry>

0000000000040673 <exception_entry_167>:
   40673:	6a 00                	pushq  $0x0
   40675:	68 a7 00 00 00       	pushq  $0xa7
   4067a:	e9 f3 03 00 00       	jmpq   40a72 <exception_entry>

000000000004067f <exception_entry_168>:
   4067f:	6a 00                	pushq  $0x0
   40681:	68 a8 00 00 00       	pushq  $0xa8
   40686:	e9 e7 03 00 00       	jmpq   40a72 <exception_entry>

000000000004068b <exception_entry_169>:
   4068b:	6a 00                	pushq  $0x0
   4068d:	68 a9 00 00 00       	pushq  $0xa9
   40692:	e9 db 03 00 00       	jmpq   40a72 <exception_entry>

0000000000040697 <exception_entry_170>:
   40697:	6a 00                	pushq  $0x0
   40699:	68 aa 00 00 00       	pushq  $0xaa
   4069e:	e9 cf 03 00 00       	jmpq   40a72 <exception_entry>

00000000000406a3 <exception_entry_171>:
   406a3:	6a 00                	pushq  $0x0
   406a5:	68 ab 00 00 00       	pushq  $0xab
   406aa:	e9 c3 03 00 00       	jmpq   40a72 <exception_entry>

00000000000406af <exception_entry_172>:
   406af:	6a 00                	pushq  $0x0
   406b1:	68 ac 00 00 00       	pushq  $0xac
   406b6:	e9 b7 03 00 00       	jmpq   40a72 <exception_entry>

00000000000406bb <exception_entry_173>:
   406bb:	6a 00                	pushq  $0x0
   406bd:	68 ad 00 00 00       	pushq  $0xad
   406c2:	e9 ab 03 00 00       	jmpq   40a72 <exception_entry>

00000000000406c7 <exception_entry_174>:
   406c7:	6a 00                	pushq  $0x0
   406c9:	68 ae 00 00 00       	pushq  $0xae
   406ce:	e9 9f 03 00 00       	jmpq   40a72 <exception_entry>

00000000000406d3 <exception_entry_175>:
   406d3:	6a 00                	pushq  $0x0
   406d5:	68 af 00 00 00       	pushq  $0xaf
   406da:	e9 93 03 00 00       	jmpq   40a72 <exception_entry>

00000000000406df <exception_entry_176>:
   406df:	6a 00                	pushq  $0x0
   406e1:	68 b0 00 00 00       	pushq  $0xb0
   406e6:	e9 87 03 00 00       	jmpq   40a72 <exception_entry>

00000000000406eb <exception_entry_177>:
   406eb:	6a 00                	pushq  $0x0
   406ed:	68 b1 00 00 00       	pushq  $0xb1
   406f2:	e9 7b 03 00 00       	jmpq   40a72 <exception_entry>

00000000000406f7 <exception_entry_178>:
   406f7:	6a 00                	pushq  $0x0
   406f9:	68 b2 00 00 00       	pushq  $0xb2
   406fe:	e9 6f 03 00 00       	jmpq   40a72 <exception_entry>

0000000000040703 <exception_entry_179>:
   40703:	6a 00                	pushq  $0x0
   40705:	68 b3 00 00 00       	pushq  $0xb3
   4070a:	e9 63 03 00 00       	jmpq   40a72 <exception_entry>

000000000004070f <exception_entry_180>:
   4070f:	6a 00                	pushq  $0x0
   40711:	68 b4 00 00 00       	pushq  $0xb4
   40716:	e9 57 03 00 00       	jmpq   40a72 <exception_entry>

000000000004071b <exception_entry_181>:
   4071b:	6a 00                	pushq  $0x0
   4071d:	68 b5 00 00 00       	pushq  $0xb5
   40722:	e9 4b 03 00 00       	jmpq   40a72 <exception_entry>

0000000000040727 <exception_entry_182>:
   40727:	6a 00                	pushq  $0x0
   40729:	68 b6 00 00 00       	pushq  $0xb6
   4072e:	e9 3f 03 00 00       	jmpq   40a72 <exception_entry>

0000000000040733 <exception_entry_183>:
   40733:	6a 00                	pushq  $0x0
   40735:	68 b7 00 00 00       	pushq  $0xb7
   4073a:	e9 33 03 00 00       	jmpq   40a72 <exception_entry>

000000000004073f <exception_entry_184>:
   4073f:	6a 00                	pushq  $0x0
   40741:	68 b8 00 00 00       	pushq  $0xb8
   40746:	e9 27 03 00 00       	jmpq   40a72 <exception_entry>

000000000004074b <exception_entry_185>:
   4074b:	6a 00                	pushq  $0x0
   4074d:	68 b9 00 00 00       	pushq  $0xb9
   40752:	e9 1b 03 00 00       	jmpq   40a72 <exception_entry>

0000000000040757 <exception_entry_186>:
   40757:	6a 00                	pushq  $0x0
   40759:	68 ba 00 00 00       	pushq  $0xba
   4075e:	e9 0f 03 00 00       	jmpq   40a72 <exception_entry>

0000000000040763 <exception_entry_187>:
   40763:	6a 00                	pushq  $0x0
   40765:	68 bb 00 00 00       	pushq  $0xbb
   4076a:	e9 03 03 00 00       	jmpq   40a72 <exception_entry>

000000000004076f <exception_entry_188>:
   4076f:	6a 00                	pushq  $0x0
   40771:	68 bc 00 00 00       	pushq  $0xbc
   40776:	e9 f7 02 00 00       	jmpq   40a72 <exception_entry>

000000000004077b <exception_entry_189>:
   4077b:	6a 00                	pushq  $0x0
   4077d:	68 bd 00 00 00       	pushq  $0xbd
   40782:	e9 eb 02 00 00       	jmpq   40a72 <exception_entry>

0000000000040787 <exception_entry_190>:
   40787:	6a 00                	pushq  $0x0
   40789:	68 be 00 00 00       	pushq  $0xbe
   4078e:	e9 df 02 00 00       	jmpq   40a72 <exception_entry>

0000000000040793 <exception_entry_191>:
   40793:	6a 00                	pushq  $0x0
   40795:	68 bf 00 00 00       	pushq  $0xbf
   4079a:	e9 d3 02 00 00       	jmpq   40a72 <exception_entry>

000000000004079f <exception_entry_192>:
   4079f:	6a 00                	pushq  $0x0
   407a1:	68 c0 00 00 00       	pushq  $0xc0
   407a6:	e9 c7 02 00 00       	jmpq   40a72 <exception_entry>

00000000000407ab <exception_entry_193>:
   407ab:	6a 00                	pushq  $0x0
   407ad:	68 c1 00 00 00       	pushq  $0xc1
   407b2:	e9 bb 02 00 00       	jmpq   40a72 <exception_entry>

00000000000407b7 <exception_entry_194>:
   407b7:	6a 00                	pushq  $0x0
   407b9:	68 c2 00 00 00       	pushq  $0xc2
   407be:	e9 af 02 00 00       	jmpq   40a72 <exception_entry>

00000000000407c3 <exception_entry_195>:
   407c3:	6a 00                	pushq  $0x0
   407c5:	68 c3 00 00 00       	pushq  $0xc3
   407ca:	e9 a3 02 00 00       	jmpq   40a72 <exception_entry>

00000000000407cf <exception_entry_196>:
   407cf:	6a 00                	pushq  $0x0
   407d1:	68 c4 00 00 00       	pushq  $0xc4
   407d6:	e9 97 02 00 00       	jmpq   40a72 <exception_entry>

00000000000407db <exception_entry_197>:
   407db:	6a 00                	pushq  $0x0
   407dd:	68 c5 00 00 00       	pushq  $0xc5
   407e2:	e9 8b 02 00 00       	jmpq   40a72 <exception_entry>

00000000000407e7 <exception_entry_198>:
   407e7:	6a 00                	pushq  $0x0
   407e9:	68 c6 00 00 00       	pushq  $0xc6
   407ee:	e9 7f 02 00 00       	jmpq   40a72 <exception_entry>

00000000000407f3 <exception_entry_199>:
   407f3:	6a 00                	pushq  $0x0
   407f5:	68 c7 00 00 00       	pushq  $0xc7
   407fa:	e9 73 02 00 00       	jmpq   40a72 <exception_entry>

00000000000407ff <exception_entry_200>:
   407ff:	6a 00                	pushq  $0x0
   40801:	68 c8 00 00 00       	pushq  $0xc8
   40806:	e9 67 02 00 00       	jmpq   40a72 <exception_entry>

000000000004080b <exception_entry_201>:
   4080b:	6a 00                	pushq  $0x0
   4080d:	68 c9 00 00 00       	pushq  $0xc9
   40812:	e9 5b 02 00 00       	jmpq   40a72 <exception_entry>

0000000000040817 <exception_entry_202>:
   40817:	6a 00                	pushq  $0x0
   40819:	68 ca 00 00 00       	pushq  $0xca
   4081e:	e9 4f 02 00 00       	jmpq   40a72 <exception_entry>

0000000000040823 <exception_entry_203>:
   40823:	6a 00                	pushq  $0x0
   40825:	68 cb 00 00 00       	pushq  $0xcb
   4082a:	e9 43 02 00 00       	jmpq   40a72 <exception_entry>

000000000004082f <exception_entry_204>:
   4082f:	6a 00                	pushq  $0x0
   40831:	68 cc 00 00 00       	pushq  $0xcc
   40836:	e9 37 02 00 00       	jmpq   40a72 <exception_entry>

000000000004083b <exception_entry_205>:
   4083b:	6a 00                	pushq  $0x0
   4083d:	68 cd 00 00 00       	pushq  $0xcd
   40842:	e9 2b 02 00 00       	jmpq   40a72 <exception_entry>

0000000000040847 <exception_entry_206>:
   40847:	6a 00                	pushq  $0x0
   40849:	68 ce 00 00 00       	pushq  $0xce
   4084e:	e9 1f 02 00 00       	jmpq   40a72 <exception_entry>

0000000000040853 <exception_entry_207>:
   40853:	6a 00                	pushq  $0x0
   40855:	68 cf 00 00 00       	pushq  $0xcf
   4085a:	e9 13 02 00 00       	jmpq   40a72 <exception_entry>

000000000004085f <exception_entry_208>:
   4085f:	6a 00                	pushq  $0x0
   40861:	68 d0 00 00 00       	pushq  $0xd0
   40866:	e9 07 02 00 00       	jmpq   40a72 <exception_entry>

000000000004086b <exception_entry_209>:
   4086b:	6a 00                	pushq  $0x0
   4086d:	68 d1 00 00 00       	pushq  $0xd1
   40872:	e9 fb 01 00 00       	jmpq   40a72 <exception_entry>

0000000000040877 <exception_entry_210>:
   40877:	6a 00                	pushq  $0x0
   40879:	68 d2 00 00 00       	pushq  $0xd2
   4087e:	e9 ef 01 00 00       	jmpq   40a72 <exception_entry>

0000000000040883 <exception_entry_211>:
   40883:	6a 00                	pushq  $0x0
   40885:	68 d3 00 00 00       	pushq  $0xd3
   4088a:	e9 e3 01 00 00       	jmpq   40a72 <exception_entry>

000000000004088f <exception_entry_212>:
   4088f:	6a 00                	pushq  $0x0
   40891:	68 d4 00 00 00       	pushq  $0xd4
   40896:	e9 d7 01 00 00       	jmpq   40a72 <exception_entry>

000000000004089b <exception_entry_213>:
   4089b:	6a 00                	pushq  $0x0
   4089d:	68 d5 00 00 00       	pushq  $0xd5
   408a2:	e9 cb 01 00 00       	jmpq   40a72 <exception_entry>

00000000000408a7 <exception_entry_214>:
   408a7:	6a 00                	pushq  $0x0
   408a9:	68 d6 00 00 00       	pushq  $0xd6
   408ae:	e9 bf 01 00 00       	jmpq   40a72 <exception_entry>

00000000000408b3 <exception_entry_215>:
   408b3:	6a 00                	pushq  $0x0
   408b5:	68 d7 00 00 00       	pushq  $0xd7
   408ba:	e9 b3 01 00 00       	jmpq   40a72 <exception_entry>

00000000000408bf <exception_entry_216>:
   408bf:	6a 00                	pushq  $0x0
   408c1:	68 d8 00 00 00       	pushq  $0xd8
   408c6:	e9 a7 01 00 00       	jmpq   40a72 <exception_entry>

00000000000408cb <exception_entry_217>:
   408cb:	6a 00                	pushq  $0x0
   408cd:	68 d9 00 00 00       	pushq  $0xd9
   408d2:	e9 9b 01 00 00       	jmpq   40a72 <exception_entry>

00000000000408d7 <exception_entry_218>:
   408d7:	6a 00                	pushq  $0x0
   408d9:	68 da 00 00 00       	pushq  $0xda
   408de:	e9 8f 01 00 00       	jmpq   40a72 <exception_entry>

00000000000408e3 <exception_entry_219>:
   408e3:	6a 00                	pushq  $0x0
   408e5:	68 db 00 00 00       	pushq  $0xdb
   408ea:	e9 83 01 00 00       	jmpq   40a72 <exception_entry>

00000000000408ef <exception_entry_220>:
   408ef:	6a 00                	pushq  $0x0
   408f1:	68 dc 00 00 00       	pushq  $0xdc
   408f6:	e9 77 01 00 00       	jmpq   40a72 <exception_entry>

00000000000408fb <exception_entry_221>:
   408fb:	6a 00                	pushq  $0x0
   408fd:	68 dd 00 00 00       	pushq  $0xdd
   40902:	e9 6b 01 00 00       	jmpq   40a72 <exception_entry>

0000000000040907 <exception_entry_222>:
   40907:	6a 00                	pushq  $0x0
   40909:	68 de 00 00 00       	pushq  $0xde
   4090e:	e9 5f 01 00 00       	jmpq   40a72 <exception_entry>

0000000000040913 <exception_entry_223>:
   40913:	6a 00                	pushq  $0x0
   40915:	68 df 00 00 00       	pushq  $0xdf
   4091a:	e9 53 01 00 00       	jmpq   40a72 <exception_entry>

000000000004091f <exception_entry_224>:
   4091f:	6a 00                	pushq  $0x0
   40921:	68 e0 00 00 00       	pushq  $0xe0
   40926:	e9 47 01 00 00       	jmpq   40a72 <exception_entry>

000000000004092b <exception_entry_225>:
   4092b:	6a 00                	pushq  $0x0
   4092d:	68 e1 00 00 00       	pushq  $0xe1
   40932:	e9 3b 01 00 00       	jmpq   40a72 <exception_entry>

0000000000040937 <exception_entry_226>:
   40937:	6a 00                	pushq  $0x0
   40939:	68 e2 00 00 00       	pushq  $0xe2
   4093e:	e9 2f 01 00 00       	jmpq   40a72 <exception_entry>

0000000000040943 <exception_entry_227>:
   40943:	6a 00                	pushq  $0x0
   40945:	68 e3 00 00 00       	pushq  $0xe3
   4094a:	e9 23 01 00 00       	jmpq   40a72 <exception_entry>

000000000004094f <exception_entry_228>:
   4094f:	6a 00                	pushq  $0x0
   40951:	68 e4 00 00 00       	pushq  $0xe4
   40956:	e9 17 01 00 00       	jmpq   40a72 <exception_entry>

000000000004095b <exception_entry_229>:
   4095b:	6a 00                	pushq  $0x0
   4095d:	68 e5 00 00 00       	pushq  $0xe5
   40962:	e9 0b 01 00 00       	jmpq   40a72 <exception_entry>

0000000000040967 <exception_entry_230>:
   40967:	6a 00                	pushq  $0x0
   40969:	68 e6 00 00 00       	pushq  $0xe6
   4096e:	e9 ff 00 00 00       	jmpq   40a72 <exception_entry>

0000000000040973 <exception_entry_231>:
   40973:	6a 00                	pushq  $0x0
   40975:	68 e7 00 00 00       	pushq  $0xe7
   4097a:	e9 f3 00 00 00       	jmpq   40a72 <exception_entry>

000000000004097f <exception_entry_232>:
   4097f:	6a 00                	pushq  $0x0
   40981:	68 e8 00 00 00       	pushq  $0xe8
   40986:	e9 e7 00 00 00       	jmpq   40a72 <exception_entry>

000000000004098b <exception_entry_233>:
   4098b:	6a 00                	pushq  $0x0
   4098d:	68 e9 00 00 00       	pushq  $0xe9
   40992:	e9 db 00 00 00       	jmpq   40a72 <exception_entry>

0000000000040997 <exception_entry_234>:
   40997:	6a 00                	pushq  $0x0
   40999:	68 ea 00 00 00       	pushq  $0xea
   4099e:	e9 cf 00 00 00       	jmpq   40a72 <exception_entry>

00000000000409a3 <exception_entry_235>:
   409a3:	6a 00                	pushq  $0x0
   409a5:	68 eb 00 00 00       	pushq  $0xeb
   409aa:	e9 c3 00 00 00       	jmpq   40a72 <exception_entry>

00000000000409af <exception_entry_236>:
   409af:	6a 00                	pushq  $0x0
   409b1:	68 ec 00 00 00       	pushq  $0xec
   409b6:	e9 b7 00 00 00       	jmpq   40a72 <exception_entry>

00000000000409bb <exception_entry_237>:
   409bb:	6a 00                	pushq  $0x0
   409bd:	68 ed 00 00 00       	pushq  $0xed
   409c2:	e9 ab 00 00 00       	jmpq   40a72 <exception_entry>

00000000000409c7 <exception_entry_238>:
   409c7:	6a 00                	pushq  $0x0
   409c9:	68 ee 00 00 00       	pushq  $0xee
   409ce:	e9 9f 00 00 00       	jmpq   40a72 <exception_entry>

00000000000409d3 <exception_entry_239>:
   409d3:	6a 00                	pushq  $0x0
   409d5:	68 ef 00 00 00       	pushq  $0xef
   409da:	e9 93 00 00 00       	jmpq   40a72 <exception_entry>

00000000000409df <exception_entry_240>:
   409df:	6a 00                	pushq  $0x0
   409e1:	68 f0 00 00 00       	pushq  $0xf0
   409e6:	e9 87 00 00 00       	jmpq   40a72 <exception_entry>

00000000000409eb <exception_entry_241>:
   409eb:	6a 00                	pushq  $0x0
   409ed:	68 f1 00 00 00       	pushq  $0xf1
   409f2:	eb 7e                	jmp    40a72 <exception_entry>

00000000000409f4 <exception_entry_242>:
   409f4:	6a 00                	pushq  $0x0
   409f6:	68 f2 00 00 00       	pushq  $0xf2
   409fb:	eb 75                	jmp    40a72 <exception_entry>

00000000000409fd <exception_entry_243>:
   409fd:	6a 00                	pushq  $0x0
   409ff:	68 f3 00 00 00       	pushq  $0xf3
   40a04:	eb 6c                	jmp    40a72 <exception_entry>

0000000000040a06 <exception_entry_244>:
   40a06:	6a 00                	pushq  $0x0
   40a08:	68 f4 00 00 00       	pushq  $0xf4
   40a0d:	eb 63                	jmp    40a72 <exception_entry>

0000000000040a0f <exception_entry_245>:
   40a0f:	6a 00                	pushq  $0x0
   40a11:	68 f5 00 00 00       	pushq  $0xf5
   40a16:	eb 5a                	jmp    40a72 <exception_entry>

0000000000040a18 <exception_entry_246>:
   40a18:	6a 00                	pushq  $0x0
   40a1a:	68 f6 00 00 00       	pushq  $0xf6
   40a1f:	eb 51                	jmp    40a72 <exception_entry>

0000000000040a21 <exception_entry_247>:
   40a21:	6a 00                	pushq  $0x0
   40a23:	68 f7 00 00 00       	pushq  $0xf7
   40a28:	eb 48                	jmp    40a72 <exception_entry>

0000000000040a2a <exception_entry_248>:
   40a2a:	6a 00                	pushq  $0x0
   40a2c:	68 f8 00 00 00       	pushq  $0xf8
   40a31:	eb 3f                	jmp    40a72 <exception_entry>

0000000000040a33 <exception_entry_249>:
   40a33:	6a 00                	pushq  $0x0
   40a35:	68 f9 00 00 00       	pushq  $0xf9
   40a3a:	eb 36                	jmp    40a72 <exception_entry>

0000000000040a3c <exception_entry_250>:
   40a3c:	6a 00                	pushq  $0x0
   40a3e:	68 fa 00 00 00       	pushq  $0xfa
   40a43:	eb 2d                	jmp    40a72 <exception_entry>

0000000000040a45 <exception_entry_251>:
   40a45:	6a 00                	pushq  $0x0
   40a47:	68 fb 00 00 00       	pushq  $0xfb
   40a4c:	eb 24                	jmp    40a72 <exception_entry>

0000000000040a4e <exception_entry_252>:
   40a4e:	6a 00                	pushq  $0x0
   40a50:	68 fc 00 00 00       	pushq  $0xfc
   40a55:	eb 1b                	jmp    40a72 <exception_entry>

0000000000040a57 <exception_entry_253>:
   40a57:	6a 00                	pushq  $0x0
   40a59:	68 fd 00 00 00       	pushq  $0xfd
   40a5e:	eb 12                	jmp    40a72 <exception_entry>

0000000000040a60 <exception_entry_254>:
   40a60:	6a 00                	pushq  $0x0
   40a62:	68 fe 00 00 00       	pushq  $0xfe
   40a67:	eb 09                	jmp    40a72 <exception_entry>

0000000000040a69 <exception_entry_255>:
   40a69:	6a 00                	pushq  $0x0
   40a6b:	68 ff 00 00 00       	pushq  $0xff
   40a70:	eb 00                	jmp    40a72 <exception_entry>

0000000000040a72 <exception_entry>:
   40a72:	0f a8                	pushq  %gs
   40a74:	0f a0                	pushq  %fs
   40a76:	41 57                	push   %r15
   40a78:	41 56                	push   %r14
   40a7a:	41 55                	push   %r13
   40a7c:	41 54                	push   %r12
   40a7e:	41 53                	push   %r11
   40a80:	41 52                	push   %r10
   40a82:	41 51                	push   %r9
   40a84:	41 50                	push   %r8
   40a86:	57                   	push   %rdi
   40a87:	56                   	push   %rsi
   40a88:	55                   	push   %rbp
   40a89:	53                   	push   %rbx
   40a8a:	52                   	push   %rdx
   40a8b:	51                   	push   %rcx
   40a8c:	50                   	push   %rax
   40a8d:	48 89 e7             	mov    %rsp,%rdi
   40a90:	48 c7 c0 00 50 05 00 	mov    $0x55000,%rax
   40a97:	0f 22 d8             	mov    %rax,%cr3
   40a9a:	e8 41 07 00 00       	callq  411e0 <exception(regstate*)>

0000000000040a9f <exception_return(proc*)>:
   40a9f:	8b 47 0c             	mov    0xc(%rdi),%eax
   40aa2:	83 f8 01             	cmp    $0x1,%eax
   40aa5:	0f 85 a4 00 00 00    	jne    40b4f <proc_runnable_fail>
   40aab:	48 8b 07             	mov    (%rdi),%rax
   40aae:	0f 22 d8             	mov    %rax,%cr3
   40ab1:	48 8d 67 10          	lea    0x10(%rdi),%rsp
   40ab5:	58                   	pop    %rax
   40ab6:	59                   	pop    %rcx
   40ab7:	5a                   	pop    %rdx
   40ab8:	5b                   	pop    %rbx
   40ab9:	5d                   	pop    %rbp
   40aba:	5e                   	pop    %rsi
   40abb:	5f                   	pop    %rdi
   40abc:	41 58                	pop    %r8
   40abe:	41 59                	pop    %r9
   40ac0:	41 5a                	pop    %r10
   40ac2:	41 5b                	pop    %r11
   40ac4:	41 5c                	pop    %r12
   40ac6:	41 5d                	pop    %r13
   40ac8:	41 5e                	pop    %r14
   40aca:	41 5f                	pop    %r15
   40acc:	0f a1                	popq   %fs
   40ace:	0f a9                	popq   %gs
   40ad0:	48 83 c4 10          	add    $0x10,%rsp
   40ad4:	48 cf                	iretq  

0000000000040ad6 <syscall_entry>:
   40ad6:	48 89 24 25 f0 ff 07 	mov    %rsp,0x7fff0
   40add:	00 
   40ade:	48 c7 c4 00 00 08 00 	mov    $0x80000,%rsp
   40ae5:	6a 23                	pushq  $0x23
   40ae7:	48 83 ec 08          	sub    $0x8,%rsp
   40aeb:	41 53                	push   %r11
   40aed:	6a 1b                	pushq  $0x1b
   40aef:	51                   	push   %rcx
   40af0:	48 83 ec 08          	sub    $0x8,%rsp
   40af4:	6a ff                	pushq  $0xffffffffffffffff
   40af6:	0f a8                	pushq  %gs
   40af8:	0f a0                	pushq  %fs
   40afa:	41 57                	push   %r15
   40afc:	41 56                	push   %r14
   40afe:	41 55                	push   %r13
   40b00:	41 54                	push   %r12
   40b02:	48 83 ec 08          	sub    $0x8,%rsp
   40b06:	41 52                	push   %r10
   40b08:	41 51                	push   %r9
   40b0a:	41 50                	push   %r8
   40b0c:	57                   	push   %rdi
   40b0d:	56                   	push   %rsi
   40b0e:	55                   	push   %rbp
   40b0f:	53                   	push   %rbx
   40b10:	52                   	push   %rdx
   40b11:	48 83 ec 08          	sub    $0x8,%rsp
   40b15:	50                   	push   %rax
   40b16:	48 c7 c0 00 50 05 00 	mov    $0x55000,%rax
   40b1d:	0f 22 d8             	mov    %rax,%cr3
   40b20:	48 89 e7             	mov    %rsp,%rdi
   40b23:	e8 c2 07 00 00       	callq  412ea <syscall(regstate*)>
   40b28:	48 8b 0c 25 00 32 05 	mov    0x53200,%rcx
   40b2f:	00 
   40b30:	8b 49 0c             	mov    0xc(%rcx),%ecx
   40b33:	83 f9 01             	cmp    $0x1,%ecx
   40b36:	75 17                	jne    40b4f <proc_runnable_fail>
   40b38:	48 8b 0c 25 00 32 05 	mov    0x53200,%rcx
   40b3f:	00 
   40b40:	48 8b 09             	mov    (%rcx),%rcx
   40b43:	0f 22 d9             	mov    %rcx,%cr3
   40b46:	48 81 c4 98 00 00 00 	add    $0x98,%rsp
   40b4d:	48 cf                	iretq  

0000000000040b4f <proc_runnable_fail>:
   40b4f:	31 c9                	xor    %ecx,%ecx
   40b51:	48 c7 c2 ee 45 04 00 	mov    $0x445ee,%rdx
   40b58:	31 f6                	xor    %esi,%esi
   40b5a:	48 c7 c7 e0 45 04 00 	mov    $0x445e0,%rdi
   40b61:	e8 37 15 00 00       	callq  4209d <assert_fail(char const*, int, char const*, char const*)>

0000000000040b66 <kernel_isolation(x86_64_pagetable*, unsigned long)>:
    
    // Switch to the first process using run()
    run(&ptable[1]);
}

bool kernel_isolation(x86_64_pagetable *table, uintptr_t va){
   40b66:	f3 0f 1e fa          	endbr64 
    if (va < PROC_START_ADDR){
        return map_to_kernel_space(table, va);
        
    }
    return true;
   40b6a:	b8 01 00 00 00       	mov    $0x1,%eax
    if (va < PROC_START_ADDR){
   40b6f:	48 81 fe ff ff 0f 00 	cmp    $0xfffff,%rsi
   40b76:	76 01                	jbe    40b79 <kernel_isolation(x86_64_pagetable*, unsigned long)+0x13>
}
   40b78:	c3                   	retq   
bool kernel_isolation(x86_64_pagetable *table, uintptr_t va){
   40b79:	55                   	push   %rbp
   40b7a:	48 89 e5             	mov    %rsp,%rbp
        return map_to_kernel_space(table, va);
   40b7d:	e8 1e 3a 00 00       	callq  445a0 <map_to_kernel_space>
}
   40b82:	5d                   	pop    %rbp
   40b83:	c3                   	retq   

0000000000040b84 <kalloc(unsigned long)>:
//    anyway.
//
//    The handout code returns the next allocatable free page it can find.
//    It checks all pages. (You could maybe make this faster!)

void* kalloc(size_t sz) {
   40b84:	f3 0f 1e fa          	endbr64 
   40b88:	55                   	push   %rbp
   40b89:	48 89 e5             	mov    %rsp,%rbp
   40b8c:	41 54                	push   %r12
   40b8e:	53                   	push   %rbx
    if (sz > PAGESIZE) {
   40b8f:	48 81 ff 00 10 00 00 	cmp    $0x1000,%rdi
   40b96:	77 5f                	ja     40bf7 <kalloc(unsigned long)+0x73>
        return nullptr;
    }

    for (uintptr_t pa = 0; pa != MEMSIZE_PHYSICAL; pa += PAGESIZE) {
   40b98:	bb 00 00 00 00       	mov    $0x0,%ebx
   40b9d:	eb 10                	jmp    40baf <kalloc(unsigned long)+0x2b>
   40b9f:	48 81 c3 00 10 00 00 	add    $0x1000,%rbx
   40ba6:	48 81 fb 00 00 20 00 	cmp    $0x200000,%rbx
   40bad:	74 40                	je     40bef <kalloc(unsigned long)+0x6b>
        if (allocatable_physical_address(pa)
   40baf:	48 89 df             	mov    %rbx,%rdi
   40bb2:	e8 2e 0f 00 00       	callq  41ae5 <allocatable_physical_address(unsigned long)>
            && !pages[pa / PAGESIZE].used()) {
   40bb7:	84 c0                	test   %al,%al
   40bb9:	74 e4                	je     40b9f <kalloc(unsigned long)+0x1b>
   40bbb:	48 89 d8             	mov    %rbx,%rax
   40bbe:	48 c1 e8 0c          	shr    $0xc,%rax
   40bc2:	80 b8 00 30 05 00 00 	cmpb   $0x0,0x53000(%rax)
   40bc9:	75 d4                	jne    40b9f <kalloc(unsigned long)+0x1b>
            ++pages[pa / PAGESIZE].refcount;
   40bcb:	c6 80 00 30 05 00 01 	movb   $0x1,0x53000(%rax)
            memset((void*) pa, 0xCC, PAGESIZE);
   40bd2:	49 89 dc             	mov    %rbx,%r12
   40bd5:	ba 00 10 00 00       	mov    $0x1000,%edx
   40bda:	be cc 00 00 00       	mov    $0xcc,%esi
   40bdf:	48 89 df             	mov    %rbx,%rdi
   40be2:	e8 70 2c 00 00       	callq  43857 <memset>
            return (void*) pa;
        }
    }
    return nullptr;
}
   40be7:	4c 89 e0             	mov    %r12,%rax
   40bea:	5b                   	pop    %rbx
   40beb:	41 5c                	pop    %r12
   40bed:	5d                   	pop    %rbp
   40bee:	c3                   	retq   
    return nullptr;
   40bef:	41 bc 00 00 00 00    	mov    $0x0,%r12d
   40bf5:	eb f0                	jmp    40be7 <kalloc(unsigned long)+0x63>
        return nullptr;
   40bf7:	41 bc 00 00 00 00    	mov    $0x0,%r12d
   40bfd:	eb e8                	jmp    40be7 <kalloc(unsigned long)+0x63>

0000000000040bff <process_setup(int, char const*)>:
// process_setup(pid, program_name)
//    Load application program `program_name` as process number `pid`.
//    This loads the application's code and data into memory, sets its
//    %rip and %rsp, gives it a stack page, and marks it as runnable.

void process_setup(pid_t pid, const char* program_name) {
   40bff:	55                   	push   %rbp
   40c00:	48 89 e5             	mov    %rsp,%rbp
   40c03:	41 57                	push   %r15
   40c05:	41 56                	push   %r14
   40c07:	41 55                	push   %r13
   40c09:	41 54                	push   %r12
   40c0b:	53                   	push   %rbx
   40c0c:	48 83 ec 48          	sub    $0x48,%rsp
   40c10:	41 89 ff             	mov    %edi,%r15d
   40c13:	49 89 f4             	mov    %rsi,%r12
    init_process(&ptable[pid], 0);
   40c16:	4c 63 ef             	movslq %edi,%r13
   40c19:	4b 8d 5c 6d 00       	lea    0x0(%r13,%r13,2),%rbx
   40c1e:	48 c1 e3 02          	shl    $0x2,%rbx
   40c22:	4a 8d 3c 2b          	lea    (%rbx,%r13,1),%rdi
   40c26:	48 c1 e7 04          	shl    $0x4,%rdi
   40c2a:	48 81 c7 20 32 05 00 	add    $0x53220,%rdi
   40c31:	be 00 00 00 00       	mov    $0x0,%esi
   40c36:	e8 07 0f 00 00       	callq  41b42 <init_process(proc*, int)>

    // initialize process page table
    ptable[pid].pagetable = kalloc_pagetable();
   40c3b:	e8 49 0e 00 00       	callq  41a89 <kalloc_pagetable()>
   40c40:	48 89 c7             	mov    %rax,%rdi
   40c43:	4a 8d 04 2b          	lea    (%rbx,%r13,1),%rax
   40c47:	48 c1 e0 04          	shl    $0x4,%rax
   40c4b:	48 89 b8 20 32 05 00 	mov    %rdi,0x53220(%rax)
    memory_foreach(ptable[pid].pagetable, MEMSIZE_PHYSICAL, kernel_isolation);
   40c52:	ba 66 0b 04 00       	mov    $0x40b66,%edx
   40c57:	be 00 00 20 00       	mov    $0x200000,%esi
   40c5c:	e8 c1 37 00 00       	callq  44422 <memory_foreach>
    map_to_nobody(ptable[pid].pagetable, (uintptr_t)NULL);
   40c61:	4a 8d 04 2b          	lea    (%rbx,%r13,1),%rax
   40c65:	48 c1 e0 04          	shl    $0x4,%rax
   40c69:	be 00 00 00 00       	mov    $0x0,%esi
   40c6e:	48 8b b8 20 32 05 00 	mov    0x53220(%rax),%rdi
   40c75:	e8 0a 39 00 00       	callq  44584 <map_to_nobody>
    map_to_user_space(ptable[pid].pagetable, (uintptr_t)CONSOLE_ADDR);
   40c7a:	4c 01 eb             	add    %r13,%rbx
   40c7d:	48 c1 e3 04          	shl    $0x4,%rbx
   40c81:	be 00 80 0b 00       	mov    $0xb8000,%esi
   40c86:	48 8b bb 20 32 05 00 	mov    0x53220(%rbx),%rdi
   40c8d:	e8 2a 39 00 00       	callq  445bc <map_to_user_space>

    // obtain reference to the program image
    program_image pgm(program_name);
   40c92:	4c 89 e6             	mov    %r12,%rsi
   40c95:	48 8d 7d a8          	lea    -0x58(%rbp),%rdi
   40c99:	e8 3e 1f 00 00       	callq  42bdc <program_image::program_image(char const*)>

    // allocate and map global memory required by loadable segments
    for (auto seg = pgm.begin(); seg != pgm.end(); ++seg) {
   40c9e:	48 8d 7d a8          	lea    -0x58(%rbp),%rdi
   40ca2:	e8 d1 1f 00 00       	callq  42c78 <program_image::begin() const>
   40ca7:	48 89 45 98          	mov    %rax,-0x68(%rbp)
   40cab:	48 89 55 a0          	mov    %rdx,-0x60(%rbp)
        for (uintptr_t a = round_down(seg.va(), PAGESIZE);
             a < seg.va() + seg.size();
             a += PAGESIZE) {
            // (NB this is physical page allocation!)
            uintptr_t physical = (uintptr_t)kalloc(PAGESIZE);
            memory_map(ptable[pid].pagetable, a, physical, PTE_PWU);
   40caf:	4d 89 ee             	mov    %r13,%r14
   40cb2:	4f 8d 6c 6d 00       	lea    0x0(%r13,%r13,2),%r13
   40cb7:	49 c1 e5 02          	shl    $0x2,%r13
   40cbb:	eb 09                	jmp    40cc6 <process_setup(int, char const*)+0xc7>
    for (auto seg = pgm.begin(); seg != pgm.end(); ++seg) {
   40cbd:	48 8d 7d 98          	lea    -0x68(%rbp),%rdi
   40cc1:	e8 6c 20 00 00       	callq  42d32 <program_image_segment::operator++()>
   40cc6:	48 8d 7d a8          	lea    -0x58(%rbp),%rdi
   40cca:	e8 dd 1f 00 00       	callq  42cac <program_image::end() const>
   40ccf:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
   40cd3:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
   40cd7:	48 8d 75 b0          	lea    -0x50(%rbp),%rsi
   40cdb:	48 8d 7d 98          	lea    -0x68(%rbp),%rdi
   40cdf:	e8 40 20 00 00       	callq  42d24 <program_image_segment::operator!=(program_image_segment const&) const>
   40ce4:	84 c0                	test   %al,%al
   40ce6:	74 62                	je     40d4a <process_setup(int, char const*)+0x14b>
        for (uintptr_t a = round_down(seg.va(), PAGESIZE);
   40ce8:	48 8d 7d 98          	lea    -0x68(%rbp),%rdi
   40cec:	e8 ff 1f 00 00       	callq  42cf0 <program_image_segment::va() const>
   40cf1:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   40cf7:	49 89 c4             	mov    %rax,%r12
             a < seg.va() + seg.size();
   40cfa:	48 8d 7d 98          	lea    -0x68(%rbp),%rdi
   40cfe:	e8 ed 1f 00 00       	callq  42cf0 <program_image_segment::va() const>
   40d03:	48 89 c3             	mov    %rax,%rbx
   40d06:	48 8d 7d 98          	lea    -0x68(%rbp),%rdi
   40d0a:	e8 ed 1f 00 00       	callq  42cfc <program_image_segment::size() const>
   40d0f:	48 01 c3             	add    %rax,%rbx
   40d12:	4c 39 e3             	cmp    %r12,%rbx
   40d15:	76 a6                	jbe    40cbd <process_setup(int, char const*)+0xbe>
            uintptr_t physical = (uintptr_t)kalloc(PAGESIZE);
   40d17:	bf 00 10 00 00       	mov    $0x1000,%edi
   40d1c:	e8 63 fe ff ff       	callq  40b84 <kalloc(unsigned long)>
   40d21:	48 89 c2             	mov    %rax,%rdx
            memory_map(ptable[pid].pagetable, a, physical, PTE_PWU);
   40d24:	4b 8d 7c 35 00       	lea    0x0(%r13,%r14,1),%rdi
   40d29:	48 c1 e7 04          	shl    $0x4,%rdi
   40d2d:	b9 07 00 00 00       	mov    $0x7,%ecx
   40d32:	4c 89 e6             	mov    %r12,%rsi
   40d35:	48 8b bf 20 32 05 00 	mov    0x53220(%rdi),%rdi
   40d3c:	e8 62 37 00 00       	callq  444a3 <memory_map>
             a += PAGESIZE) {
   40d41:	49 81 c4 00 10 00 00 	add    $0x1000,%r12
        for (uintptr_t a = round_down(seg.va(), PAGESIZE);
   40d48:	eb b0                	jmp    40cfa <process_setup(int, char const*)+0xfb>
        }
        
    }

    // initialize data in loadable segments
    for (auto seg = pgm.begin(); seg != pgm.end(); ++seg) {
   40d4a:	48 8d 7d a8          	lea    -0x58(%rbp),%rdi
   40d4e:	e8 25 1f 00 00       	callq  42c78 <program_image::begin() const>
   40d53:	48 89 45 98          	mov    %rax,-0x68(%rbp)
   40d57:	48 89 55 a0          	mov    %rdx,-0x60(%rbp)
        uintptr_t phys_addr = (uintptr_t)memory_virtual_to_physical(ptable[pid].pagetable, (uintptr_t)seg.va());
   40d5b:	4d 63 f7             	movslq %r15d,%r14
   40d5e:	4f 8d 2c 76          	lea    (%r14,%r14,2),%r13
   40d62:	49 c1 e5 02          	shl    $0x2,%r13
    for (auto seg = pgm.begin(); seg != pgm.end(); ++seg) {
   40d66:	48 8d 7d a8          	lea    -0x58(%rbp),%rdi
   40d6a:	e8 3d 1f 00 00       	callq  42cac <program_image::end() const>
   40d6f:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   40d73:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
   40d77:	48 8d 75 c0          	lea    -0x40(%rbp),%rsi
   40d7b:	48 8d 7d 98          	lea    -0x68(%rbp),%rdi
   40d7f:	e8 a0 1f 00 00       	callq  42d24 <program_image_segment::operator!=(program_image_segment const&) const>
   40d84:	84 c0                	test   %al,%al
   40d86:	74 6e                	je     40df6 <process_setup(int, char const*)+0x1f7>
        uintptr_t phys_addr = (uintptr_t)memory_virtual_to_physical(ptable[pid].pagetable, (uintptr_t)seg.va());
   40d88:	48 8d 7d 98          	lea    -0x68(%rbp),%rdi
   40d8c:	e8 5f 1f 00 00       	callq  42cf0 <program_image_segment::va() const>
   40d91:	48 89 c6             	mov    %rax,%rsi
   40d94:	4b 8d 54 35 00       	lea    0x0(%r13,%r14,1),%rdx
   40d99:	48 c1 e2 04          	shl    $0x4,%rdx
   40d9d:	48 8b ba 20 32 05 00 	mov    0x53220(%rdx),%rdi
   40da4:	e8 4e 37 00 00       	callq  444f7 <memory_virtual_to_physical>
   40da9:	48 89 c3             	mov    %rax,%rbx
        memset((void *)phys_addr, 0, seg.size());
   40dac:	48 8d 7d 98          	lea    -0x68(%rbp),%rdi
   40db0:	e8 47 1f 00 00       	callq  42cfc <program_image_segment::size() const>
   40db5:	48 89 c2             	mov    %rax,%rdx
   40db8:	be 00 00 00 00       	mov    $0x0,%esi
   40dbd:	48 89 df             	mov    %rbx,%rdi
   40dc0:	e8 92 2a 00 00       	callq  43857 <memset>
        memcpy((void *)phys_addr, seg.data(), seg.data_size());
   40dc5:	48 8d 7d 98          	lea    -0x68(%rbp),%rdi
   40dc9:	e8 4a 1f 00 00       	callq  42d18 <program_image_segment::data_size() const>
   40dce:	49 89 c4             	mov    %rax,%r12
   40dd1:	48 8d 7d 98          	lea    -0x68(%rbp),%rdi
   40dd5:	e8 2e 1f 00 00       	callq  42d08 <program_image_segment::data() const>
   40dda:	48 89 c6             	mov    %rax,%rsi
   40ddd:	4c 89 e2             	mov    %r12,%rdx
   40de0:	48 89 df             	mov    %rbx,%rdi
   40de3:	e8 fe 29 00 00       	callq  437e6 <memcpy>
    for (auto seg = pgm.begin(); seg != pgm.end(); ++seg) {
   40de8:	48 8d 7d 98          	lea    -0x68(%rbp),%rdi
   40dec:	e8 41 1f 00 00       	callq  42d32 <program_image_segment::operator++()>
   40df1:	e9 70 ff ff ff       	jmpq   40d66 <process_setup(int, char const*)+0x167>
    }

    // mark entry point
    ptable[pid].regs.reg_rip = pgm.entry();
   40df6:	48 8d 7d a8          	lea    -0x58(%rbp),%rdi
   40dfa:	e8 07 1e 00 00       	callq  42c06 <program_image::entry() const>
   40dff:	48 89 c2             	mov    %rax,%rdx
   40e02:	4d 63 ff             	movslq %r15d,%r15
   40e05:	4b 8d 1c 7f          	lea    (%r15,%r15,2),%rbx
   40e09:	48 c1 e3 02          	shl    $0x2,%rbx
   40e0d:	4a 8d 04 3b          	lea    (%rbx,%r15,1),%rax
   40e11:	48 c1 e0 04          	shl    $0x4,%rax
   40e15:	48 89 90 c8 32 05 00 	mov    %rdx,0x532c8(%rax)
    //uintptr_t stack_addr = PROC_START_ADDR + PROC_SIZE * pid - PAGESIZE;
    uintptr_t stack_addr = MEMSIZE_VIRTUAL - PAGESIZE;
    // (NB this is physical page allocation!)
    // assert(!pages[stack_addr / PAGESIZE].used());
    //++pages[stack_addr / PAGESIZE].refcount;
    uintptr_t physical = (uintptr_t)kalloc(PAGESIZE);
   40e1c:	bf 00 10 00 00       	mov    $0x1000,%edi
   40e21:	e8 5e fd ff ff       	callq  40b84 <kalloc(unsigned long)>
   40e26:	48 89 c2             	mov    %rax,%rdx
    memory_map(ptable[pid].pagetable, stack_addr, physical, PTE_PWU);
   40e29:	4a 8d 3c 3b          	lea    (%rbx,%r15,1),%rdi
   40e2d:	48 c1 e7 04          	shl    $0x4,%rdi
   40e31:	b9 07 00 00 00       	mov    $0x7,%ecx
   40e36:	be 00 f0 2f 00       	mov    $0x2ff000,%esi
   40e3b:	48 8b bf 20 32 05 00 	mov    0x53220(%rdi),%rdi
   40e42:	e8 5c 36 00 00       	callq  444a3 <memory_map>
    // map_to_user_space(ptable[pid].pagetable, stack_addr);
    ptable[pid].regs.reg_rsp = stack_addr + PAGESIZE;
   40e47:	4a 8d 04 3b          	lea    (%rbx,%r15,1),%rax
   40e4b:	48 c1 e0 04          	shl    $0x4,%rax
   40e4f:	48 c7 80 e0 32 05 00 	movq   $0x300000,0x532e0(%rax)
   40e56:	00 00 30 00 

    // mark process as runnable
    ptable[pid].state = P_RUNNABLE;
   40e5a:	c7 80 2c 32 05 00 01 	movl   $0x1,0x5322c(%rax)
   40e61:	00 00 00 
}
   40e64:	48 83 c4 48          	add    $0x48,%rsp
   40e68:	5b                   	pop    %rbx
   40e69:	41 5c                	pop    %r12
   40e6b:	41 5d                	pop    %r13
   40e6d:	41 5e                	pop    %r14
   40e6f:	41 5f                	pop    %r15
   40e71:	5d                   	pop    %rbp
   40e72:	c3                   	retq   

0000000000040e73 <syscall_page_alloc(unsigned long)>:
// syscall_page_alloc(addr)
//    Handles the SYSCALL_PAGE_ALLOC system call. This function
//    should implement the specification for `sys_page_alloc`
//    in `u-lib.hh` (but in the handout code, it does not).

int syscall_page_alloc(uintptr_t addr) {
   40e73:	f3 0f 1e fa          	endbr64 
   40e77:	55                   	push   %rbp
   40e78:	48 89 e5             	mov    %rsp,%rbp
   40e7b:	53                   	push   %rbx
   40e7c:	48 83 ec 08          	sub    $0x8,%rsp
   40e80:	48 89 fb             	mov    %rdi,%rbx
    uintptr_t physical = (uintptr_t)kalloc(PAGESIZE);
   40e83:	bf 00 10 00 00       	mov    $0x1000,%edi
   40e88:	e8 f7 fc ff ff       	callq  40b84 <kalloc(unsigned long)>
    if (physical == NULL){
   40e8d:	48 85 c0             	test   %rax,%rax
   40e90:	74 4a                	je     40edc <syscall_page_alloc(unsigned long)+0x69>
   40e92:	48 89 c2             	mov    %rax,%rdx
        return -1;
    }
    memory_map(current->pagetable, addr, physical, PTE_PWU);
   40e95:	b9 07 00 00 00       	mov    $0x7,%ecx
   40e9a:	48 89 de             	mov    %rbx,%rsi
   40e9d:	48 8b 05 5c 23 01 00 	mov    0x1235c(%rip),%rax        # 53200 <current>
   40ea4:	48 8b 38             	mov    (%rax),%rdi
   40ea7:	e8 f7 35 00 00       	callq  444a3 <memory_map>
    uintptr_t phys_addr = (uintptr_t)memory_virtual_to_physical(current->pagetable, addr);
   40eac:	48 89 de             	mov    %rbx,%rsi
   40eaf:	48 8b 05 4a 23 01 00 	mov    0x1234a(%rip),%rax        # 53200 <current>
   40eb6:	48 8b 38             	mov    (%rax),%rdi
   40eb9:	e8 39 36 00 00       	callq  444f7 <memory_virtual_to_physical>
   40ebe:	48 89 c7             	mov    %rax,%rdi
    memset((void *)phys_addr, 0, PAGESIZE);
   40ec1:	ba 00 10 00 00       	mov    $0x1000,%edx
   40ec6:	be 00 00 00 00       	mov    $0x0,%esi
   40ecb:	e8 87 29 00 00       	callq  43857 <memset>
    return 0;
   40ed0:	b8 00 00 00 00       	mov    $0x0,%eax
}
   40ed5:	48 83 c4 08          	add    $0x8,%rsp
   40ed9:	5b                   	pop    %rbx
   40eda:	5d                   	pop    %rbp
   40edb:	c3                   	retq   
        return -1;
   40edc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   40ee1:	eb f2                	jmp    40ed5 <syscall_page_alloc(unsigned long)+0x62>

0000000000040ee3 <run(proc*)>:

// run(p)
//    Run process `p`. This involves setting `current = p` and calling
//    `exception_return` to restore its page table and registers.

void run(proc* p) {
   40ee3:	f3 0f 1e fa          	endbr64 
   40ee7:	55                   	push   %rbp
   40ee8:	48 89 e5             	mov    %rsp,%rbp
   40eeb:	53                   	push   %rbx
   40eec:	48 83 ec 08          	sub    $0x8,%rsp
    assert(p->state == P_RUNNABLE);
   40ef0:	83 7f 0c 01          	cmpl   $0x1,0xc(%rdi)
   40ef4:	75 1a                	jne    40f10 <run(proc*)+0x2d>
   40ef6:	48 89 fb             	mov    %rdi,%rbx
    current = p;
   40ef9:	48 89 3d 00 23 01 00 	mov    %rdi,0x12300(%rip)        # 53200 <current>

    // Check the process's current pagetable.
    check_pagetable(p->pagetable);
   40f00:	48 8b 3f             	mov    (%rdi),%rdi
   40f03:	e8 ba 16 00 00       	callq  425c2 <check_pagetable(x86_64_pagetable*)>

    // This function is defined in k-exception.S. It restores the process's
    // registers then jumps back to user mode.
    exception_return(p);
   40f08:	48 89 df             	mov    %rbx,%rdi
   40f0b:	e8 8f fb ff ff       	callq  40a9f <exception_return(proc*)>
    assert(p->state == P_RUNNABLE);
   40f10:	b9 00 00 00 00       	mov    $0x0,%ecx
   40f15:	ba 1a 46 04 00       	mov    $0x4461a,%edx
   40f1a:	be 83 01 00 00       	mov    $0x183,%esi
   40f1f:	bf 11 46 04 00       	mov    $0x44611,%edi
   40f24:	e8 74 11 00 00       	callq  4209d <assert_fail(char const*, int, char const*, char const*)>

0000000000040f29 <kernel_start(char const*)>:
void kernel_start(const char* command) {
   40f29:	f3 0f 1e fa          	endbr64 
   40f2d:	55                   	push   %rbp
   40f2e:	48 89 e5             	mov    %rsp,%rbp
   40f31:	53                   	push   %rbx
   40f32:	48 83 ec 18          	sub    $0x18,%rsp
   40f36:	48 89 fb             	mov    %rdi,%rbx
    init_hardware();
   40f39:	e8 c0 11 00 00       	callq  420fe <init_hardware()>
    log_printf("Starting WeensyOS\n");
   40f3e:	bf 31 46 04 00       	mov    $0x44631,%edi
   40f43:	b8 00 00 00 00       	mov    $0x0,%eax
   40f48:	e8 2a 0e 00 00       	callq  41d77 <log_printf(char const*, ...)>
	memory_order __b = __m & __memory_order_mask;
	__glibcxx_assert(__b != memory_order_acquire);
	__glibcxx_assert(__b != memory_order_acq_rel);
	__glibcxx_assert(__b != memory_order_consume);

	__atomic_store_n(&_M_i, __i, int(__m));
   40f4d:	48 c7 05 d0 2f 01 00 	movq   $0x1,0x12fd0(%rip)        # 53f28 <ticks>
   40f54:	01 00 00 00 
   40f58:	0f ae f0             	mfence 
    init_timer(HZ);
   40f5b:	bf 64 00 00 00       	mov    $0x64,%edi
   40f60:	e8 fe 0a 00 00       	callq  41a63 <init_timer(int)>
    console_clear();
   40f65:	e8 c3 31 00 00       	callq  4412d <console_clear()>
    memory_foreach(kernel_pagetable, MEMSIZE_PHYSICAL, kernel_isolation);  
   40f6a:	ba 66 0b 04 00       	mov    $0x40b66,%edx
   40f6f:	be 00 00 20 00       	mov    $0x200000,%esi
   40f74:	bf 00 50 05 00       	mov    $0x55000,%edi
   40f79:	e8 a4 34 00 00       	callq  44422 <memory_foreach>
    map_to_user_space(kernel_pagetable, (uintptr_t)CONSOLE_ADDR);
   40f7e:	be 00 80 0b 00       	mov    $0xb8000,%esi
   40f83:	bf 00 50 05 00       	mov    $0x55000,%edi
   40f88:	e8 2f 36 00 00       	callq  445bc <map_to_user_space>
    map_to_nobody(kernel_pagetable, (uintptr_t)NULL);
   40f8d:	be 00 00 00 00       	mov    $0x0,%esi
   40f92:	bf 00 50 05 00       	mov    $0x55000,%edi
   40f97:	e8 e8 35 00 00       	callq  44584 <map_to_nobody>
    for (pid_t i = 0; i < NPROC; i++) {
   40f9c:	ba 28 32 05 00       	mov    $0x53228,%edx
   40fa1:	b8 00 00 00 00       	mov    $0x0,%eax
        ptable[i].pid = i;
   40fa6:	89 02                	mov    %eax,(%rdx)
        ptable[i].state = P_FREE;
   40fa8:	c7 42 04 00 00 00 00 	movl   $0x0,0x4(%rdx)
    for (pid_t i = 0; i < NPROC; i++) {
   40faf:	83 c0 01             	add    $0x1,%eax
   40fb2:	48 81 c2 d0 00 00 00 	add    $0xd0,%rdx
   40fb9:	83 f8 10             	cmp    $0x10,%eax
   40fbc:	75 e8                	jne    40fa6 <kernel_start(char const*)+0x7d>
    if (command && !program_image(command).empty()) {
   40fbe:	48 85 db             	test   %rbx,%rbx
   40fc1:	74 19                	je     40fdc <kernel_start(char const*)+0xb3>
   40fc3:	48 89 de             	mov    %rbx,%rsi
   40fc6:	48 8d 7d e8          	lea    -0x18(%rbp),%rdi
   40fca:	e8 0d 1c 00 00       	callq  42bdc <program_image::program_image(char const*)>
   40fcf:	48 8d 7d e8          	lea    -0x18(%rbp),%rdi
   40fd3:	e8 44 1c 00 00       	callq  42c1c <program_image::empty() const>
   40fd8:	84 c0                	test   %al,%al
   40fda:	74 46                	je     41022 <kernel_start(char const*)+0xf9>
        process_setup(1, "allocator");
   40fdc:	be 44 46 04 00       	mov    $0x44644,%esi
   40fe1:	bf 01 00 00 00       	mov    $0x1,%edi
   40fe6:	e8 14 fc ff ff       	callq  40bff <process_setup(int, char const*)>
        process_setup(2, "allocator2");
   40feb:	be 4e 46 04 00       	mov    $0x4464e,%esi
   40ff0:	bf 02 00 00 00       	mov    $0x2,%edi
   40ff5:	e8 05 fc ff ff       	callq  40bff <process_setup(int, char const*)>
        process_setup(3, "allocator3");
   40ffa:	be 59 46 04 00       	mov    $0x44659,%esi
   40fff:	bf 03 00 00 00       	mov    $0x3,%edi
   41004:	e8 f6 fb ff ff       	callq  40bff <process_setup(int, char const*)>
        process_setup(4, "allocator4");
   41009:	be 64 46 04 00       	mov    $0x44664,%esi
   4100e:	bf 04 00 00 00       	mov    $0x4,%edi
   41013:	e8 e7 fb ff ff       	callq  40bff <process_setup(int, char const*)>
    run(&ptable[1]);
   41018:	bf f0 32 05 00       	mov    $0x532f0,%edi
   4101d:	e8 c1 fe ff ff       	callq  40ee3 <run(proc*)>
        process_setup(1, command);
   41022:	48 89 de             	mov    %rbx,%rsi
   41025:	bf 01 00 00 00       	mov    $0x1,%edi
   4102a:	e8 d0 fb ff ff       	callq  40bff <process_setup(int, char const*)>
   4102f:	eb e7                	jmp    41018 <kernel_start(char const*)+0xef>

0000000000041031 <memshow()>:
// memshow()
//    Draw a picture of memory (physical and virtual) on the CGA console.
//    Switches to a new process's virtual memory map every 0.25 sec.
//    Uses `console_memviewer()`, a function defined in `k-memviewer.cc`.

void memshow() {
   41031:	f3 0f 1e fa          	endbr64 
   41035:	55                   	push   %rbp
   41036:	48 89 e5             	mov    %rsp,%rbp
    static unsigned last_ticks = 0;
    static int showing = 0;

    // switch to a new process every 0.25 sec
    if (last_ticks == 0 || ticks - last_ticks >= HZ / 2) {
   41039:	83 3d e4 2e 01 00 00 	cmpl   $0x0,0x12ee4(%rip)        # 53f24 <memshow()::last_ticks>
   41040:	74 16                	je     41058 <memshow()+0x27>
      {
	memory_order __b = __m & __memory_order_mask;
	__glibcxx_assert(__b != memory_order_release);
	__glibcxx_assert(__b != memory_order_acq_rel);

	return __atomic_load_n(&_M_i, int(__m));
   41042:	48 8b 05 df 2e 01 00 	mov    0x12edf(%rip),%rax        # 53f28 <ticks>
   41049:	8b 15 d5 2e 01 00    	mov    0x12ed5(%rip),%edx        # 53f24 <memshow()::last_ticks>
   4104f:	48 29 d0             	sub    %rdx,%rax
   41052:	48 83 f8 31          	cmp    $0x31,%rax
   41056:	76 27                	jbe    4107f <memshow()+0x4e>
   41058:	48 8b 05 c9 2e 01 00 	mov    0x12ec9(%rip),%rax        # 53f28 <ticks>
        last_ticks = ticks;
   4105f:	89 05 bf 2e 01 00    	mov    %eax,0x12ebf(%rip)        # 53f24 <memshow()::last_ticks>
        showing = (showing + 1) % NPROC;
   41065:	8b 05 b5 2e 01 00    	mov    0x12eb5(%rip),%eax        # 53f20 <memshow()::showing>
   4106b:	83 c0 01             	add    $0x1,%eax
   4106e:	99                   	cltd   
   4106f:	c1 ea 1c             	shr    $0x1c,%edx
   41072:	01 d0                	add    %edx,%eax
   41074:	83 e0 0f             	and    $0xf,%eax
   41077:	29 d0                	sub    %edx,%eax
   41079:	89 05 a1 2e 01 00    	mov    %eax,0x12ea1(%rip)        # 53f20 <memshow()::showing>
    }

    proc* p = nullptr;
    for (int search = 0; !p && search < NPROC; ++search) {
   4107f:	8b 05 9b 2e 01 00    	mov    0x12e9b(%rip),%eax        # 53f20 <memshow()::showing>
void memshow() {
   41085:	b9 10 00 00 00       	mov    $0x10,%ecx
   4108a:	41 b8 00 00 00 00    	mov    $0x0,%r8d
   41090:	be 01 00 00 00       	mov    $0x1,%esi
   41095:	eb 16                	jmp    410ad <memshow()+0x7c>
        if (ptable[showing].state != P_FREE
            && ptable[showing].pagetable) {
            p = &ptable[showing];
        } else {
            showing = (showing + 1) % NPROC;
   41097:	83 c0 01             	add    $0x1,%eax
   4109a:	99                   	cltd   
   4109b:	c1 ea 1c             	shr    $0x1c,%edx
   4109e:	01 d0                	add    %edx,%eax
   410a0:	83 e0 0f             	and    $0xf,%eax
   410a3:	29 d0                	sub    %edx,%eax
    for (int search = 0; !p && search < NPROC; ++search) {
   410a5:	41 89 f0             	mov    %esi,%r8d
   410a8:	83 e9 01             	sub    $0x1,%ecx
   410ab:	74 54                	je     41101 <memshow()+0xd0>
        if (ptable[showing].state != P_FREE
   410ad:	48 63 d0             	movslq %eax,%rdx
   410b0:	48 8d 3c 52          	lea    (%rdx,%rdx,2),%rdi
   410b4:	48 8d 14 ba          	lea    (%rdx,%rdi,4),%rdx
   410b8:	48 c1 e2 04          	shl    $0x4,%rdx
   410bc:	83 ba 2c 32 05 00 00 	cmpl   $0x0,0x5322c(%rdx)
   410c3:	74 d2                	je     41097 <memshow()+0x66>
            && ptable[showing].pagetable) {
   410c5:	48 63 d0             	movslq %eax,%rdx
   410c8:	48 8d 14 ba          	lea    (%rdx,%rdi,4),%rdx
   410cc:	48 c1 e2 04          	shl    $0x4,%rdx
   410d0:	48 83 ba 20 32 05 00 	cmpq   $0x0,0x53220(%rdx)
   410d7:	00 
   410d8:	74 bd                	je     41097 <memshow()+0x66>
   410da:	45 84 c0             	test   %r8b,%r8b
   410dd:	74 06                	je     410e5 <memshow()+0xb4>
   410df:	89 05 3b 2e 01 00    	mov    %eax,0x12e3b(%rip)        # 53f20 <memshow()::showing>
            p = &ptable[showing];
   410e5:	48 98                	cltq   
   410e7:	48 8d 14 40          	lea    (%rax,%rax,2),%rdx
   410eb:	48 8d 3c 90          	lea    (%rax,%rdx,4),%rdi
   410ef:	48 c1 e7 04          	shl    $0x4,%rdi
   410f3:	48 81 c7 20 32 05 00 	add    $0x53220,%rdi
        }
    }

    extern void console_memviewer(proc* vmp);
    console_memviewer(p);
   410fa:	e8 02 24 00 00       	callq  43501 <console_memviewer(proc*)>
    if (!p) {
        console_printf(CPOS(10, 29), 0x0F00, "VIRTUAL ADDRESS SPACE\n"
            "                          [All processes have exited]\n"
            "\n\n\n\n\n\n\n\n\n\n\n");
    }
}
   410ff:	5d                   	pop    %rbp
   41100:	c3                   	retq   
   41101:	89 05 19 2e 01 00    	mov    %eax,0x12e19(%rip)        # 53f20 <memshow()::showing>
    console_memviewer(p);
   41107:	bf 00 00 00 00       	mov    $0x0,%edi
   4110c:	e8 f0 23 00 00       	callq  43501 <console_memviewer(proc*)>
        console_printf(CPOS(10, 29), 0x0F00, "VIRTUAL ADDRESS SPACE\n"
   41111:	ba d8 46 04 00       	mov    $0x446d8,%edx
   41116:	be 00 0f 00 00       	mov    $0xf00,%esi
   4111b:	bf 3d 03 00 00       	mov    $0x33d,%edi
   41120:	b8 00 00 00 00       	mov    $0x0,%eax
   41125:	e8 35 32 00 00       	callq  4435f <console_printf(int, int, char const*, ...)>
}
   4112a:	eb d3                	jmp    410ff <memshow()+0xce>

000000000004112c <schedule()>:
void schedule() {
   4112c:	f3 0f 1e fa          	endbr64 
   41130:	55                   	push   %rbp
   41131:	48 89 e5             	mov    %rsp,%rbp
   41134:	41 54                	push   %r12
   41136:	53                   	push   %rbx
    pid_t pid = current->pid;
   41137:	48 8b 05 c2 20 01 00 	mov    0x120c2(%rip),%rax        # 53200 <current>
        pid = (pid + 1) % NPROC;
   4113e:	8b 40 08             	mov    0x8(%rax),%eax
   41141:	83 c0 01             	add    $0x1,%eax
   41144:	99                   	cltd   
   41145:	c1 ea 1c             	shr    $0x1c,%edx
   41148:	01 d0                	add    %edx,%eax
   4114a:	83 e0 0f             	and    $0xf,%eax
   4114d:	29 d0                	sub    %edx,%eax
   4114f:	41 89 c4             	mov    %eax,%r12d
        if (ptable[pid].state == P_RUNNABLE) {
   41152:	48 98                	cltq   
   41154:	48 8d 14 40          	lea    (%rax,%rax,2),%rdx
   41158:	48 8d 04 90          	lea    (%rax,%rdx,4),%rax
   4115c:	48 c1 e0 04          	shl    $0x4,%rax
   41160:	83 b8 2c 32 05 00 01 	cmpl   $0x1,0x5322c(%rax)
   41167:	74 5c                	je     411c5 <schedule()+0x99>
        check_keyboard();
   41169:	e8 62 18 00 00       	callq  429d0 <check_keyboard()>
    for (unsigned spins = 1; true; ++spins) {
   4116e:	bb 01 00 00 00       	mov    $0x1,%ebx
   41173:	83 c3 01             	add    $0x1,%ebx
        pid = (pid + 1) % NPROC;
   41176:	41 8d 44 24 01       	lea    0x1(%r12),%eax
   4117b:	99                   	cltd   
   4117c:	c1 ea 1c             	shr    $0x1c,%edx
   4117f:	01 d0                	add    %edx,%eax
   41181:	83 e0 0f             	and    $0xf,%eax
   41184:	29 d0                	sub    %edx,%eax
   41186:	41 89 c4             	mov    %eax,%r12d
        if (ptable[pid].state == P_RUNNABLE) {
   41189:	48 98                	cltq   
   4118b:	48 8d 14 40          	lea    (%rax,%rax,2),%rdx
   4118f:	48 8d 04 90          	lea    (%rax,%rdx,4),%rax
   41193:	48 c1 e0 04          	shl    $0x4,%rax
   41197:	83 b8 2c 32 05 00 01 	cmpl   $0x1,0x5322c(%rax)
   4119e:	74 25                	je     411c5 <schedule()+0x99>
        check_keyboard();
   411a0:	e8 2b 18 00 00       	callq  429d0 <check_keyboard()>
        if (spins % (1 << 12) == 0) {
   411a5:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
   411ab:	75 c6                	jne    41173 <schedule()+0x47>
            memshow();
   411ad:	e8 7f fe ff ff       	callq  41031 <memshow()>
            log_printf("%u\n", spins);
   411b2:	89 de                	mov    %ebx,%esi
   411b4:	bf 6f 46 04 00       	mov    $0x4466f,%edi
   411b9:	b8 00 00 00 00       	mov    $0x0,%eax
   411be:	e8 b4 0b 00 00       	callq  41d77 <log_printf(char const*, ...)>
   411c3:	eb ae                	jmp    41173 <schedule()+0x47>
            run(&ptable[pid]);
   411c5:	49 63 c4             	movslq %r12d,%rax
   411c8:	48 8d 14 40          	lea    (%rax,%rax,2),%rdx
   411cc:	48 8d 3c 90          	lea    (%rax,%rdx,4),%rdi
   411d0:	48 c1 e7 04          	shl    $0x4,%rdi
   411d4:	48 81 c7 20 32 05 00 	add    $0x53220,%rdi
   411db:	e8 03 fd ff ff       	callq  40ee3 <run(proc*)>

00000000000411e0 <exception(regstate*)>:
void exception(regstate* regs) {
   411e0:	f3 0f 1e fa          	endbr64 
   411e4:	55                   	push   %rbp
   411e5:	48 89 e5             	mov    %rsp,%rbp
   411e8:	53                   	push   %rbx
   411e9:	48 83 ec 08          	sub    $0x8,%rsp
   411ed:	48 89 fe             	mov    %rdi,%rsi
    current->regs = *regs;
   411f0:	48 8b 1d 09 20 01 00 	mov    0x12009(%rip),%rbx        # 53200 <current>
   411f7:	48 8d 7b 10          	lea    0x10(%rbx),%rdi
   411fb:	b9 18 00 00 00       	mov    $0x18,%ecx
   41200:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
    console_show_cursor(cursorpos);
   41203:	8b 3d f3 7d 07 00    	mov    0x77df3(%rip),%edi        # b8ffc <cursorpos>
   41209:	e8 b9 09 00 00       	callq  41bc7 <console_show_cursor(int)>
    if (regs->reg_intno != INT_PF || (regs->reg_errcode & PFERR_USER)) {
   4120e:	83 bb 98 00 00 00 0e 	cmpl   $0xe,0x98(%rbx)
   41215:	75 09                	jne    41220 <exception(regstate*)+0x40>
   41217:	f6 83 a0 00 00 00 04 	testb  $0x4,0xa0(%rbx)
   4121e:	74 05                	je     41225 <exception(regstate*)+0x45>
        memshow();
   41220:	e8 0c fe ff ff       	callq  41031 <memshow()>
    check_keyboard();
   41225:	e8 a6 17 00 00       	callq  429d0 <check_keyboard()>
    switch (regs->reg_intno) {
   4122a:	8b b3 98 00 00 00    	mov    0x98(%rbx),%esi
   41230:	83 fe 0e             	cmp    $0xe,%esi
   41233:	74 22                	je     41257 <exception(regstate*)+0x77>
   41235:	83 fe 20             	cmp    $0x20,%esi
   41238:	0f 85 9d 00 00 00    	jne    412db <exception(regstate*)+0xfb>
      { return __atomic_add_fetch(&_M_i, 1, int(memory_order_seq_cst)); }
   4123e:	f0 48 83 05 e1 2c 01 	lock addq $0x1,0x12ce1(%rip)        # 53f28 <ticks>
   41245:	00 01 
}
inline uint32_t lapicstate::read(int reg) const {
    return reg_[reg].v;
}
inline void lapicstate::write(int reg, uint32_t v) {
    reg_[reg].v = v;
   41247:	b8 b0 00 e0 fe       	mov    $0xfee000b0,%eax
   4124c:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
        schedule();
   41252:	e8 d5 fe ff ff       	callq  4112c <schedule()>
    asm volatile("movq %0, %%cr0" : : "r" (x));
}

__always_inline uintptr_t rdcr2() {
    uintptr_t x;
    asm volatile("movq %%cr2, %0" : "=r" (x));
   41257:	41 0f 20 d0          	mov    %cr2,%r8
        const char* operation = regs->reg_errcode & PFERR_WRITE
   4125b:	48 8b 83 a0 00 00 00 	mov    0xa0(%rbx),%rax
                ? "write" : "read";
   41262:	a8 02                	test   $0x2,%al
   41264:	41 b9 73 46 04 00    	mov    $0x44673,%r9d
   4126a:	ba 79 46 04 00       	mov    $0x44679,%edx
   4126f:	4c 0f 44 ca          	cmove  %rdx,%r9
                ? "protection problem" : "missing page";
   41273:	a8 01                	test   $0x1,%al
   41275:	b9 7e 46 04 00       	mov    $0x4467e,%ecx
   4127a:	ba 91 46 04 00       	mov    $0x44691,%edx
   4127f:	48 0f 44 ca          	cmove  %rdx,%rcx
        if (!(regs->reg_errcode & PFERR_USER)) {
   41283:	a8 04                	test   $0x4,%al
   41285:	74 3f                	je     412c6 <exception(regstate*)+0xe6>
        console_printf(CPOS(24, 0), 0x0C00,
   41287:	48 8b 05 72 1f 01 00 	mov    0x11f72(%rip),%rax        # 53200 <current>
   4128e:	8b 40 08             	mov    0x8(%rax),%eax
   41291:	ff b3 a8 00 00 00    	pushq  0xa8(%rbx)
   41297:	51                   	push   %rcx
   41298:	89 c1                	mov    %eax,%ecx
   4129a:	ba 58 47 04 00       	mov    $0x44758,%edx
   4129f:	be 00 0c 00 00       	mov    $0xc00,%esi
   412a4:	bf 80 07 00 00       	mov    $0x780,%edi
   412a9:	b8 00 00 00 00       	mov    $0x0,%eax
   412ae:	e8 ac 30 00 00       	callq  4435f <console_printf(int, int, char const*, ...)>
        current->state = P_BROKEN;
   412b3:	48 8b 05 46 1f 01 00 	mov    0x11f46(%rip),%rax        # 53200 <current>
   412ba:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%rax)
        schedule();
   412c1:	e8 66 fe ff ff       	callq  4112c <schedule()>
            panic("Kernel page fault on %p (%s %s)!\n",
   412c6:	4c 89 ca             	mov    %r9,%rdx
   412c9:	4c 89 c6             	mov    %r8,%rsi
   412cc:	bf 30 47 04 00       	mov    $0x44730,%edi
   412d1:	b8 00 00 00 00       	mov    $0x0,%eax
   412d6:	e8 1c 18 00 00       	callq  42af7 <panic(char const*, ...)>
        panic("Unexpected exception %d!\n", regs->reg_intno);
   412db:	bf 9e 46 04 00       	mov    $0x4469e,%edi
   412e0:	b8 00 00 00 00       	mov    $0x0,%eax
   412e5:	e8 0d 18 00 00       	callq  42af7 <panic(char const*, ...)>

00000000000412ea <syscall(regstate*)>:
uintptr_t syscall(regstate* regs) {
   412ea:	f3 0f 1e fa          	endbr64 
   412ee:	55                   	push   %rbp
   412ef:	48 89 e5             	mov    %rsp,%rbp
   412f2:	53                   	push   %rbx
   412f3:	48 83 ec 08          	sub    $0x8,%rsp
   412f7:	48 89 fe             	mov    %rdi,%rsi
    current->regs = *regs;
   412fa:	48 8b 1d ff 1e 01 00 	mov    0x11eff(%rip),%rbx        # 53200 <current>
   41301:	48 8d 7b 10          	lea    0x10(%rbx),%rdi
   41305:	b9 18 00 00 00       	mov    $0x18,%ecx
   4130a:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
    console_show_cursor(cursorpos);
   4130d:	8b 3d e9 7c 07 00    	mov    0x77ce9(%rip),%edi        # b8ffc <cursorpos>
   41313:	e8 af 08 00 00       	callq  41bc7 <console_show_cursor(int)>
    memshow();
   41318:	e8 14 fd ff ff       	callq  41031 <memshow()>
    check_keyboard();
   4131d:	e8 ae 16 00 00       	callq  429d0 <check_keyboard()>
    switch (regs->reg_rax) {
   41322:	48 8b 73 10          	mov    0x10(%rbx),%rsi
   41326:	48 83 fe 02          	cmp    $0x2,%rsi
   4132a:	74 49                	je     41375 <syscall(regstate*)+0x8b>
   4132c:	77 18                	ja     41346 <syscall(regstate*)+0x5c>
   4132e:	48 83 fe 01          	cmp    $0x1,%rsi
   41332:	75 55                	jne    41389 <syscall(regstate*)+0x9f>
        return current->pid;
   41334:	48 8b 05 c5 1e 01 00 	mov    0x11ec5(%rip),%rax        # 53200 <current>
   4133b:	48 63 40 08          	movslq 0x8(%rax),%rax
}
   4133f:	48 83 c4 08          	add    $0x8,%rsp
   41343:	5b                   	pop    %rbx
   41344:	5d                   	pop    %rbp
   41345:	c3                   	retq   
    switch (regs->reg_rax) {
   41346:	48 83 fe 03          	cmp    $0x3,%rsi
   4134a:	74 1a                	je     41366 <syscall(regstate*)+0x7c>
   4134c:	48 83 fe 04          	cmp    $0x4,%rsi
   41350:	75 37                	jne    41389 <syscall(regstate*)+0x9f>
        return syscall_page_alloc(current->regs.reg_rdi);
   41352:	48 8b 05 a7 1e 01 00 	mov    0x11ea7(%rip),%rax        # 53200 <current>
   41359:	48 8b 78 40          	mov    0x40(%rax),%rdi
   4135d:	e8 11 fb ff ff       	callq  40e73 <syscall_page_alloc(unsigned long)>
   41362:	48 98                	cltq   
   41364:	eb d9                	jmp    4133f <syscall(regstate*)+0x55>
        panic(nullptr);         // does not return
   41366:	bf 00 00 00 00       	mov    $0x0,%edi
   4136b:	b8 00 00 00 00       	mov    $0x0,%eax
   41370:	e8 82 17 00 00       	callq  42af7 <panic(char const*, ...)>
        current->regs.reg_rax = 0;
   41375:	48 8b 05 84 1e 01 00 	mov    0x11e84(%rip),%rax        # 53200 <current>
   4137c:	48 c7 40 10 00 00 00 	movq   $0x0,0x10(%rax)
   41383:	00 
        schedule();             // does not return
   41384:	e8 a3 fd ff ff       	callq  4112c <schedule()>
        panic("Unexpected system call %ld!\n", regs->reg_rax);
   41389:	bf b8 46 04 00       	mov    $0x446b8,%edi
   4138e:	b8 00 00 00 00       	mov    $0x0,%eax
   41393:	e8 5f 17 00 00       	callq  42af7 <panic(char const*, ...)>

0000000000041398 <vmiter::down()>:
    } else {
        return 0;
    }
}

void vmiter::down() {
   41398:	f3 0f 1e fa          	endbr64 
    while (level_ > 0 && (*pep_ & (PTE_P | PTE_PS)) == PTE_P) {
   4139c:	8b 47 10             	mov    0x10(%rdi),%eax
   4139f:	85 c0                	test   %eax,%eax
   413a1:	7e 4f                	jle    413f2 <vmiter::down()+0x5a>
        perm_ &= *pep_ | ~(PTE_P | PTE_W | PTE_U);
        --level_;
        uintptr_t pa = *pep_ & PTE_PAMASK;
   413a3:	49 b8 00 f0 ff ff ff 	movabs $0xffffffffff000,%r8
   413aa:	ff 0f 00 
    while (level_ > 0 && (*pep_ & (PTE_P | PTE_PS)) == PTE_P) {
   413ad:	48 8b 4f 08          	mov    0x8(%rdi),%rcx
   413b1:	48 8b 11             	mov    (%rcx),%rdx
   413b4:	48 89 d6             	mov    %rdx,%rsi
   413b7:	81 e6 81 00 00 00    	and    $0x81,%esi
   413bd:	48 83 fe 01          	cmp    $0x1,%rsi
   413c1:	75 2f                	jne    413f2 <vmiter::down()+0x5a>
        perm_ &= *pep_ | ~(PTE_P | PTE_W | PTE_U);
   413c3:	83 ca f8             	or     $0xfffffff8,%edx
   413c6:	21 57 14             	and    %edx,0x14(%rdi)
        --level_;
   413c9:	83 e8 01             	sub    $0x1,%eax
   413cc:	89 47 10             	mov    %eax,0x10(%rdi)
        uintptr_t pa = *pep_ & PTE_PAMASK;
   413cf:	4c 89 c6             	mov    %r8,%rsi
   413d2:	48 23 31             	and    (%rcx),%rsi
    return (int) (addr >> (PAGEOFFBITS + level * PAGEINDEXBITS)) & 0x1FF;
   413d5:	8d 4c c0 0c          	lea    0xc(%rax,%rax,8),%ecx
   413d9:	48 8b 57 18          	mov    0x18(%rdi),%rdx
   413dd:	48 d3 ea             	shr    %cl,%rdx
        x86_64_pagetable* pt = reinterpret_cast<x86_64_pagetable*>(pa);
        pep_ = &pt->entry[pageindex(va_, level_)];
   413e0:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
   413e6:	48 8d 14 d6          	lea    (%rsi,%rdx,8),%rdx
   413ea:	48 89 57 08          	mov    %rdx,0x8(%rdi)
    while (level_ > 0 && (*pep_ & (PTE_P | PTE_PS)) == PTE_P) {
   413ee:	85 c0                	test   %eax,%eax
   413f0:	75 bb                	jne    413ad <vmiter::down()+0x15>
    }
    if ((*pep_ & PTE_PAMASK) >= 0x100000000UL) {
   413f2:	48 8b 47 08          	mov    0x8(%rdi),%rax
   413f6:	48 8b 10             	mov    (%rax),%rdx
   413f9:	48 b8 00 f0 ff ff ff 	movabs $0xffffffffff000,%rax
   41400:	ff 0f 00 
   41403:	48 21 d0             	and    %rdx,%rax
   41406:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
   4140b:	48 39 c8             	cmp    %rcx,%rax
   4140e:	77 01                	ja     41411 <vmiter::down()+0x79>
   41410:	c3                   	retq   
void vmiter::down() {
   41411:	55                   	push   %rbp
   41412:	48 89 e5             	mov    %rsp,%rbp
        panic("Page table %p may contain uninitialized memory!\n"
   41415:	48 8b 37             	mov    (%rdi),%rsi
   41418:	bf 88 47 04 00       	mov    $0x44788,%edi
   4141d:	b8 00 00 00 00       	mov    $0x0,%eax
   41422:	e8 d0 16 00 00       	callq  42af7 <panic(char const*, ...)>
   41427:	90                   	nop

0000000000041428 <vmiter::real_find(unsigned long)>:
              "(Page table contents: %p)\n", pt_, *pep_);
    }
}

void vmiter::real_find(uintptr_t va) {
   41428:	f3 0f 1e fa          	endbr64 
   4142c:	55                   	push   %rbp
   4142d:	48 89 e5             	mov    %rsp,%rbp
    if (level_ == 3 || ((va_ ^ va) & ~pageoffmask(level_ + 1)) != 0) {
   41430:	8b 47 10             	mov    0x10(%rdi),%eax
   41433:	83 f8 03             	cmp    $0x3,%eax
   41436:	74 1d                	je     41455 <vmiter::real_find(unsigned long)+0x2d>
    return (1UL << (PAGEOFFBITS + level * PAGEINDEXBITS)) - 1;
   41438:	8d 54 c0 09          	lea    0x9(%rax,%rax,8),%edx
   4143c:	8d 4a 0c             	lea    0xc(%rdx),%ecx
   4143f:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   41446:	48 d3 e0             	shl    %cl,%rax
   41449:	48 89 f1             	mov    %rsi,%rcx
   4144c:	48 33 4f 18          	xor    0x18(%rdi),%rcx
   41450:	48 85 c8             	test   %rcx,%rax
   41453:	74 34                	je     41489 <vmiter::real_find(unsigned long)+0x61>
        level_ = 3;
   41455:	c7 47 10 03 00 00 00 	movl   $0x3,0x10(%rdi)
    return va <= VA_LOWMAX || va >= VA_HIGHMIN;
   4145c:	48 b8 00 00 00 00 00 	movabs $0xffff800000000000,%rax
   41463:	80 ff ff 
   41466:	48 01 f0             	add    %rsi,%rax
        if (va_is_canonical(va)) {
   41469:	48 ba ff ff ff ff ff 	movabs $0xfffeffffffffffff,%rdx
   41470:	ff fe ff 
   41473:	48 39 d0             	cmp    %rdx,%rax
   41476:	77 3e                	ja     414b6 <vmiter::real_find(unsigned long)+0x8e>
            perm_ = initial_perm;
            pep_ = &pt_->entry[pageindex(va, level_)];
        } else {
            perm_ = 0;
   41478:	c7 47 14 00 00 00 00 	movl   $0x0,0x14(%rdi)
            pep_ = const_cast<x86_64_pageentry_t*>(&zero_pe);
   4147f:	48 c7 47 08 f8 48 04 	movq   $0x448f8,0x8(%rdi)
   41486:	00 
   41487:	eb 47                	jmp    414d0 <vmiter::real_find(unsigned long)+0xa8>
        }
    } else {
        int curidx = (reinterpret_cast<uintptr_t>(pep_) % PAGESIZE) >> 3;
   41489:	4c 8b 47 08          	mov    0x8(%rdi),%r8
    return (int) (addr >> (PAGEOFFBITS + level * PAGEINDEXBITS)) & 0x1FF;
   4148d:	8d 4a 03             	lea    0x3(%rdx),%ecx
   41490:	48 89 f0             	mov    %rsi,%rax
   41493:	48 d3 e8             	shr    %cl,%rax
   41496:	25 ff 01 00 00       	and    $0x1ff,%eax
   4149b:	4c 89 c2             	mov    %r8,%rdx
   4149e:	48 c1 ea 03          	shr    $0x3,%rdx
   414a2:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
        pep_ += pageindex(va, level_) - curidx;
   414a8:	29 d0                	sub    %edx,%eax
   414aa:	48 98                	cltq   
   414ac:	49 8d 04 c0          	lea    (%r8,%rax,8),%rax
   414b0:	48 89 47 08          	mov    %rax,0x8(%rdi)
   414b4:	eb 1a                	jmp    414d0 <vmiter::real_find(unsigned long)+0xa8>
            perm_ = initial_perm;
   414b6:	c7 47 14 ff 0f 00 00 	movl   $0xfff,0x14(%rdi)
            pep_ = &pt_->entry[pageindex(va, level_)];
   414bd:	48 89 f0             	mov    %rsi,%rax
   414c0:	48 c1 e8 24          	shr    $0x24,%rax
   414c4:	25 f8 0f 00 00       	and    $0xff8,%eax
   414c9:	48 03 07             	add    (%rdi),%rax
   414cc:	48 89 47 08          	mov    %rax,0x8(%rdi)
    }
    va_ = va;
   414d0:	48 89 77 18          	mov    %rsi,0x18(%rdi)
    down();
   414d4:	e8 bf fe ff ff       	callq  41398 <vmiter::down()>
}
   414d9:	5d                   	pop    %rbp
   414da:	c3                   	retq   
   414db:	90                   	nop

00000000000414dc <vmiter::range_perm(unsigned long) const>:
uint64_t vmiter::range_perm(size_t sz) const {
   414dc:	f3 0f 1e fa          	endbr64 
   414e0:	55                   	push   %rbp
   414e1:	48 89 e5             	mov    %rsp,%rbp
   414e4:	41 55                	push   %r13
   414e6:	41 54                	push   %r12
   414e8:	53                   	push   %rbx
   414e9:	48 83 ec 28          	sub    $0x28,%rsp
    }
}
inline uint64_t vmiter::perm() const {
    // Returns 0-0xFFF. (XXX Does not track PTE_XD.)
    // Returns 0 unless `(*pep_ & perm_ & PTE_P) != 0`.
    uint64_t ph = *pep_ & perm_;
   414ed:	48 8b 47 08          	mov    0x8(%rdi),%rax
   414f1:	48 63 5f 14          	movslq 0x14(%rdi),%rbx
   414f5:	48 23 18             	and    (%rax),%rbx
   414f8:	48 89 d8             	mov    %rbx,%rax
    return ph & -(ph & PTE_P);
   414fb:	83 e3 01             	and    $0x1,%ebx
   414fe:	48 f7 db             	neg    %rbx
   41501:	48 21 c3             	and    %rax,%rbx
    return (1UL << (PAGEOFFBITS + level * PAGEINDEXBITS)) - 1;
   41504:	8b 47 10             	mov    0x10(%rdi),%eax
   41507:	8d 4c c0 0c          	lea    0xc(%rax,%rax,8),%ecx
   4150b:	b8 01 00 00 00       	mov    $0x1,%eax
   41510:	48 d3 e0             	shl    %cl,%rax
    if ((p & PTE_P) != 0 && sz > rsz) {
   41513:	f6 c3 01             	test   $0x1,%bl
   41516:	74 05                	je     4151d <vmiter::range_perm(unsigned long) const+0x41>
   41518:	48 39 c6             	cmp    %rax,%rsi
   4151b:	77 18                	ja     41535 <vmiter::range_perm(unsigned long) const+0x59>
        return 0;
   4151d:	48 89 d8             	mov    %rbx,%rax
   41520:	83 e0 01             	and    $0x1,%eax
   41523:	48 0f 44 d8          	cmove  %rax,%rbx
}
   41527:	48 89 d8             	mov    %rbx,%rax
   4152a:	48 83 c4 28          	add    $0x28,%rsp
   4152e:	5b                   	pop    %rbx
   4152f:	41 5c                	pop    %r12
   41531:	41 5d                	pop    %r13
   41533:	5d                   	pop    %rbp
   41534:	c3                   	retq   
    return va_;
   41535:	4c 8b 67 18          	mov    0x18(%rdi),%r12
        if (sz > ((int64_t) va() < 0 ? 0 : VA_LOWEND) - va()) {
   41539:	4c 89 e2             	mov    %r12,%rdx
   4153c:	48 f7 d2             	not    %rdx
   4153f:	48 c1 ea 3f          	shr    $0x3f,%rdx
   41543:	48 c1 e2 2f          	shl    $0x2f,%rdx
   41547:	4c 29 e2             	sub    %r12,%rdx
   4154a:	48 39 f2             	cmp    %rsi,%rdx
   4154d:	0f 82 8e 00 00 00    	jb     415e1 <vmiter::range_perm(unsigned long) const+0x105>
        vmiter it(*this);
   41553:	48 8b 17             	mov    (%rdi),%rdx
   41556:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
   4155a:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   4155e:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
   41562:	48 8b 57 10          	mov    0x10(%rdi),%rdx
   41566:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
   4156a:	48 8b 57 18          	mov    0x18(%rdi),%rdx
   4156e:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
   41572:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
        sz += va() & (rsz - 1);
   41576:	49 21 d4             	and    %rdx,%r12
   41579:	49 01 f4             	add    %rsi,%r12
   4157c:	41 bd 01 00 00 00    	mov    $0x1,%r13d
            sz -= rsz;
   41582:	49 29 c4             	sub    %rax,%r12
   41585:	8b 45 d0             	mov    -0x30(%rbp),%eax
   41588:	8d 4c c0 0c          	lea    0xc(%rax,%rax,8),%ecx
   4158c:	4c 89 ee             	mov    %r13,%rsi
   4158f:	48 d3 e6             	shl    %cl,%rsi
   41592:	48 83 ee 01          	sub    $0x1,%rsi
    return (va_ | pageoffmask(level_)) + 1;
   41596:	48 0b 75 d8          	or     -0x28(%rbp),%rsi
   4159a:	48 83 c6 01          	add    $0x1,%rsi
}
inline vmiter& vmiter::operator-=(intptr_t delta) {
    return find(va_ - delta);
}
inline void vmiter::next_range() {
    real_find(last_va());
   4159e:	48 8d 7d c0          	lea    -0x40(%rbp),%rdi
   415a2:	e8 81 fe ff ff       	callq  41428 <vmiter::real_find(unsigned long)>
    uint64_t ph = *pep_ & perm_;
   415a7:	48 63 45 d4          	movslq -0x2c(%rbp),%rax
   415ab:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
   415af:	48 23 02             	and    (%rdx),%rax
   415b2:	48 89 c2             	mov    %rax,%rdx
    return ph & -(ph & PTE_P);
   415b5:	83 e0 01             	and    $0x1,%eax
   415b8:	48 f7 d8             	neg    %rax
   415bb:	48 21 d0             	and    %rdx,%rax
            p &= it.perm();
   415be:	48 21 c3             	and    %rax,%rbx
   415c1:	8b 45 d0             	mov    -0x30(%rbp),%eax
   415c4:	8d 4c c0 0c          	lea    0xc(%rax,%rax,8),%ecx
   415c8:	4c 89 e8             	mov    %r13,%rax
   415cb:	48 d3 e0             	shl    %cl,%rax
        } while ((p & PTE_P) != 0 && sz > rsz);
   415ce:	f6 c3 01             	test   $0x1,%bl
   415d1:	0f 84 46 ff ff ff    	je     4151d <vmiter::range_perm(unsigned long) const+0x41>
   415d7:	49 39 c4             	cmp    %rax,%r12
   415da:	77 a6                	ja     41582 <vmiter::range_perm(unsigned long) const+0xa6>
   415dc:	e9 3c ff ff ff       	jmpq   4151d <vmiter::range_perm(unsigned long) const+0x41>
            return 0;
   415e1:	bb 00 00 00 00       	mov    $0x0,%ebx
   415e6:	e9 3c ff ff ff       	jmpq   41527 <vmiter::range_perm(unsigned long) const+0x4b>
   415eb:	90                   	nop

00000000000415ec <vmiter::next()>:

void vmiter::next() {
   415ec:	f3 0f 1e fa          	endbr64 
   415f0:	55                   	push   %rbp
   415f1:	48 89 e5             	mov    %rsp,%rbp
    int level = 0;
    if (level_ > 0 && !perm()) {
   415f4:	8b 47 10             	mov    0x10(%rdi),%eax
   415f7:	85 c0                	test   %eax,%eax
   415f9:	7e 3e                	jle    41639 <vmiter::next()+0x4d>
    uint64_t ph = *pep_ & perm_;
   415fb:	48 8b 4f 08          	mov    0x8(%rdi),%rcx
   415ff:	48 63 57 14          	movslq 0x14(%rdi),%rdx
   41603:	48 23 11             	and    (%rcx),%rdx
    return ph & -(ph & PTE_P);
   41606:	48 89 d1             	mov    %rdx,%rcx
   41609:	83 e1 01             	and    $0x1,%ecx
   4160c:	48 f7 d9             	neg    %rcx
    int level = 0;
   4160f:	48 85 d1             	test   %rdx,%rcx
   41612:	ba 00 00 00 00       	mov    $0x0,%edx
   41617:	0f 45 c2             	cmovne %edx,%eax
   4161a:	8d 4c c0 0c          	lea    0xc(%rax,%rax,8),%ecx
   4161e:	be 01 00 00 00       	mov    $0x1,%esi
   41623:	48 d3 e6             	shl    %cl,%rsi
   41626:	48 83 ee 01          	sub    $0x1,%rsi
        level = level_;
    }
    real_find((va_ | pageoffmask(level)) + 1);
   4162a:	48 0b 77 18          	or     0x18(%rdi),%rsi
   4162e:	48 83 c6 01          	add    $0x1,%rsi
   41632:	e8 f1 fd ff ff       	callq  41428 <vmiter::real_find(unsigned long)>
}
   41637:	5d                   	pop    %rbp
   41638:	c3                   	retq   
    int level = 0;
   41639:	b8 00 00 00 00       	mov    $0x0,%eax
   4163e:	eb da                	jmp    4161a <vmiter::next()+0x2e>

0000000000041640 <vmiter::try_map(unsigned long, int)>:

int vmiter::try_map(uintptr_t pa, int perm) {
   41640:	f3 0f 1e fa          	endbr64 
   41644:	55                   	push   %rbp
   41645:	48 89 e5             	mov    %rsp,%rbp
   41648:	41 57                	push   %r15
   4164a:	41 56                	push   %r14
   4164c:	41 55                	push   %r13
   4164e:	41 54                	push   %r12
   41650:	53                   	push   %rbx
   41651:	48 83 ec 08          	sub    $0x8,%rsp
   41655:	49 89 fc             	mov    %rdi,%r12
   41658:	49 89 f6             	mov    %rsi,%r14
   4165b:	41 89 d7             	mov    %edx,%r15d
    if (pa == (uintptr_t) -1 && perm == 0) {
   4165e:	85 d2                	test   %edx,%edx
   41660:	0f 94 c2             	sete   %dl
   41663:	48 83 fe ff          	cmp    $0xffffffffffffffff,%rsi
   41667:	75 2a                	jne    41693 <vmiter::try_map(unsigned long, int)+0x53>
   41669:	84 d2                	test   %dl,%dl
   4166b:	74 26                	je     41693 <vmiter::try_map(unsigned long, int)+0x53>
        pa = 0;
    }
    // virtual address is page-aligned
    assert((va_ % PAGESIZE) == 0, "vmiter::try_map va not aligned");
   4166d:	4c 8b 77 18          	mov    0x18(%rdi),%r14
   41671:	41 81 e6 ff 0f 00 00 	and    $0xfff,%r14d
   41678:	74 4d                	je     416c7 <vmiter::try_map(unsigned long, int)+0x87>
   4167a:	b9 d8 47 04 00       	mov    $0x447d8,%ecx
   4167f:	ba 6b 48 04 00       	mov    $0x4486b,%edx
   41684:	be 49 00 00 00       	mov    $0x49,%esi
   41689:	bf 81 48 04 00       	mov    $0x44881,%edi
   4168e:	e8 0a 0a 00 00       	callq  4209d <assert_fail(char const*, int, char const*, char const*)>
   41693:	66 41 f7 44 24 18 ff 	testw  $0xfff,0x18(%r12)
   4169a:	0f 
   4169b:	75 dd                	jne    4167a <vmiter::try_map(unsigned long, int)+0x3a>
    if (perm & PTE_P) {
   4169d:	41 f6 c7 01          	test   $0x1,%r15b
   416a1:	0f 84 ee 00 00 00    	je     41795 <vmiter::try_map(unsigned long, int)+0x155>
        // if mapping present, physical address is page-aligned
        assert(pa != (uintptr_t) -1, "vmiter::try_map mapping nonexistent pa");
   416a7:	49 83 fe ff          	cmp    $0xffffffffffffffff,%r14
   416ab:	0f 84 b2 00 00 00    	je     41763 <vmiter::try_map(unsigned long, int)+0x123>
        assert((pa & PTE_PAMASK) == pa, "vmiter::try_map pa not aligned");
   416b1:	48 b8 00 f0 ff ff ff 	movabs $0xffffffffff000,%rax
   416b8:	ff 0f 00 
   416bb:	4c 21 f0             	and    %r14,%rax
   416be:	4c 39 f0             	cmp    %r14,%rax
   416c1:	0f 85 b5 00 00 00    	jne    4177c <vmiter::try_map(unsigned long, int)+0x13c>
    } else {
        assert((pa & PTE_P) == 0, "vmiter::try_map invalid pa");
    }
    // new permissions (`perm`) cannot be less restrictive than permissions
    // imposed by higher-level page tables (`perm_`)
    assert(!(perm & ~perm_ & (PTE_P | PTE_W | PTE_U)));
   416c7:	45 8b 6c 24 14       	mov    0x14(%r12),%r13d
   416cc:	41 f7 d5             	not    %r13d
   416cf:	45 21 fd             	and    %r15d,%r13d
   416d2:	41 83 e5 07          	and    $0x7,%r13d
   416d6:	0f 85 dc 00 00 00    	jne    417b8 <vmiter::try_map(unsigned long, int)+0x178>

    while (level_ > 0 && perm) {
   416dc:	41 8b 44 24 10       	mov    0x10(%r12),%eax
   416e1:	85 c0                	test   %eax,%eax
   416e3:	7e 57                	jle    4173c <vmiter::try_map(unsigned long, int)+0xfc>
   416e5:	84 d2                	test   %dl,%dl
   416e7:	75 53                	jne    4173c <vmiter::try_map(unsigned long, int)+0xfc>
        assert(!(*pep_ & PTE_P));
   416e9:	49 8b 44 24 08       	mov    0x8(%r12),%rax
   416ee:	f6 00 01             	testb  $0x1,(%rax)
   416f1:	0f 85 da 00 00 00    	jne    417d1 <vmiter::try_map(unsigned long, int)+0x191>
        x86_64_pagetable* pt = (x86_64_pagetable*) kalloc(PAGESIZE);
   416f7:	bf 00 10 00 00       	mov    $0x1000,%edi
   416fc:	e8 83 f4 ff ff       	callq  40b84 <kalloc(unsigned long)>
   41701:	48 89 c3             	mov    %rax,%rbx
        if (!pt) {
   41704:	48 85 c0             	test   %rax,%rax
   41707:	0f 84 dd 00 00 00    	je     417ea <vmiter::try_map(unsigned long, int)+0x1aa>
            return -1;
        }
        memset(pt, 0, PAGESIZE);
   4170d:	ba 00 10 00 00       	mov    $0x1000,%edx
   41712:	be 00 00 00 00       	mov    $0x0,%esi
   41717:	48 89 c7             	mov    %rax,%rdi
   4171a:	e8 38 21 00 00       	callq  43857 <memset>
        *pep_ = (uintptr_t) pt | PTE_P | PTE_W | PTE_U;
   4171f:	49 8b 44 24 08       	mov    0x8(%r12),%rax
   41724:	48 83 cb 07          	or     $0x7,%rbx
   41728:	48 89 18             	mov    %rbx,(%rax)
        down();
   4172b:	4c 89 e7             	mov    %r12,%rdi
   4172e:	e8 65 fc ff ff       	callq  41398 <vmiter::down()>
    while (level_ > 0 && perm) {
   41733:	41 8b 44 24 10       	mov    0x10(%r12),%eax
   41738:	85 c0                	test   %eax,%eax
   4173a:	7f ad                	jg     416e9 <vmiter::try_map(unsigned long, int)+0xa9>
    }

    if (level_ == 0) {
   4173c:	85 c0                	test   %eax,%eax
   4173e:	75 11                	jne    41751 <vmiter::try_map(unsigned long, int)+0x111>
        *pep_ = pa | perm;
   41740:	49 8b 54 24 08       	mov    0x8(%r12),%rdx
   41745:	4d 63 ff             	movslq %r15d,%r15
   41748:	4d 09 fe             	or     %r15,%r14
   4174b:	4c 89 32             	mov    %r14,(%rdx)
    }
    return 0;
   4174e:	41 89 c5             	mov    %eax,%r13d
}
   41751:	44 89 e8             	mov    %r13d,%eax
   41754:	48 83 c4 08          	add    $0x8,%rsp
   41758:	5b                   	pop    %rbx
   41759:	41 5c                	pop    %r12
   4175b:	41 5d                	pop    %r13
   4175d:	41 5e                	pop    %r14
   4175f:	41 5f                	pop    %r15
   41761:	5d                   	pop    %rbp
   41762:	c3                   	retq   
        assert(pa != (uintptr_t) -1, "vmiter::try_map mapping nonexistent pa");
   41763:	b9 f8 47 04 00       	mov    $0x447f8,%ecx
   41768:	ba 8d 48 04 00       	mov    $0x4488d,%edx
   4176d:	be 4c 00 00 00       	mov    $0x4c,%esi
   41772:	bf 81 48 04 00       	mov    $0x44881,%edi
   41777:	e8 21 09 00 00       	callq  4209d <assert_fail(char const*, int, char const*, char const*)>
        assert((pa & PTE_PAMASK) == pa, "vmiter::try_map pa not aligned");
   4177c:	b9 20 48 04 00       	mov    $0x44820,%ecx
   41781:	ba a2 48 04 00       	mov    $0x448a2,%edx
   41786:	be 4d 00 00 00       	mov    $0x4d,%esi
   4178b:	bf 81 48 04 00       	mov    $0x44881,%edi
   41790:	e8 08 09 00 00       	callq  4209d <assert_fail(char const*, int, char const*, char const*)>
        assert((pa & PTE_P) == 0, "vmiter::try_map invalid pa");
   41795:	41 f6 c6 01          	test   $0x1,%r14b
   41799:	0f 84 28 ff ff ff    	je     416c7 <vmiter::try_map(unsigned long, int)+0x87>
   4179f:	b9 ba 48 04 00       	mov    $0x448ba,%ecx
   417a4:	ba d5 48 04 00       	mov    $0x448d5,%edx
   417a9:	be 4f 00 00 00       	mov    $0x4f,%esi
   417ae:	bf 81 48 04 00       	mov    $0x44881,%edi
   417b3:	e8 e5 08 00 00       	callq  4209d <assert_fail(char const*, int, char const*, char const*)>
    assert(!(perm & ~perm_ & (PTE_P | PTE_W | PTE_U)));
   417b8:	b9 00 00 00 00       	mov    $0x0,%ecx
   417bd:	ba 40 48 04 00       	mov    $0x44840,%edx
   417c2:	be 53 00 00 00       	mov    $0x53,%esi
   417c7:	bf 81 48 04 00       	mov    $0x44881,%edi
   417cc:	e8 cc 08 00 00       	callq  4209d <assert_fail(char const*, int, char const*, char const*)>
        assert(!(*pep_ & PTE_P));
   417d1:	b9 00 00 00 00       	mov    $0x0,%ecx
   417d6:	ba e7 48 04 00       	mov    $0x448e7,%edx
   417db:	be 56 00 00 00       	mov    $0x56,%esi
   417e0:	bf 81 48 04 00       	mov    $0x44881,%edi
   417e5:	e8 b3 08 00 00       	callq  4209d <assert_fail(char const*, int, char const*, char const*)>
            return -1;
   417ea:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
   417f0:	e9 5c ff ff ff       	jmpq   41751 <vmiter::try_map(unsigned long, int)+0x111>
   417f5:	90                   	nop

00000000000417f6 <ptiter::down(bool)>:
    pep_ = &pt_->entry[pageindex(va, level_)];
    va_ = va;
    down(false);
}

void ptiter::down(bool skip) {
   417f6:	f3 0f 1e fa          	endbr64 
   417fa:	55                   	push   %rbp
   417fb:	48 89 e5             	mov    %rsp,%rbp
   417fe:	41 55                	push   %r13
   41800:	41 54                	push   %r12
   41802:	53                   	push   %rbx
    int stop_level = 1;
   41803:	41 bd 01 00 00 00    	mov    $0x1,%r13d
   41809:	41 ba 01 00 00 00    	mov    $0x1,%r10d
        if ((*pep_ & (PTE_P | PTE_PS)) == PTE_P && !skip) {
            if (level_ == stop_level) {
                break;
            } else {
                --level_;
                uintptr_t pa = *pep_ & PTE_PAMASK;
   4180f:	48 bb 00 f0 ff ff ff 	movabs $0xffffffffff000,%rbx
   41816:	ff 0f 00 
                // up one level
                if (level_ == 3) {
                    va_ = VA_NONCANONMAX + 1;
                    return;
                }
                stop_level = level_ + 1;
   41819:	41 bb 00 00 00 00    	mov    $0x0,%r11d
   4181f:	eb 53                	jmp    41874 <ptiter::down(bool)+0x7e>
            if (level_ == stop_level) {
   41821:	8b 47 10             	mov    0x10(%rdi),%eax
   41824:	44 39 e8             	cmp    %r13d,%eax
   41827:	74 35                	je     4185e <ptiter::down(bool)+0x68>
                --level_;
   41829:	83 e8 01             	sub    $0x1,%eax
   4182c:	89 47 10             	mov    %eax,0x10(%rdi)
                uintptr_t pa = *pep_ & PTE_PAMASK;
   4182f:	48 89 da             	mov    %rbx,%rdx
   41832:	49 23 14 24          	and    (%r12),%rdx
    return (int) (addr >> (PAGEOFFBITS + level * PAGEINDEXBITS)) & 0x1FF;
   41836:	8d 4c c0 0c          	lea    0xc(%rax,%rax,8),%ecx
   4183a:	48 8b 47 18          	mov    0x18(%rdi),%rax
   4183e:	48 d3 e8             	shr    %cl,%rax
                pep_ = &pt->entry[pageindex(va_, level_)];
   41841:	25 ff 01 00 00       	and    $0x1ff,%eax
   41846:	48 8d 04 c2          	lea    (%rdx,%rax,8),%rax
   4184a:	48 89 47 08          	mov    %rax,0x8(%rdi)
            }
   4184e:	eb 21                	jmp    41871 <ptiter::down(bool)+0x7b>
                    va_ = VA_NONCANONMAX + 1;
   41850:	48 b8 00 00 00 00 00 	movabs $0x1000000000000,%rax
   41857:	00 01 00 
   4185a:	48 89 47 18          	mov    %rax,0x18(%rdi)
                va_ = va;
            }
            skip = false;
        }
    }
}
   4185e:	5b                   	pop    %rbx
   4185f:	41 5c                	pop    %r12
   41861:	41 5d                	pop    %r13
   41863:	5d                   	pop    %rbp
   41864:	c3                   	retq   
                ++pep_;
   41865:	49 83 c4 08          	add    $0x8,%r12
   41869:	4c 89 67 08          	mov    %r12,0x8(%rdi)
                va_ = va;
   4186d:	48 89 47 18          	mov    %rax,0x18(%rdi)
                stop_level = level_ + 1;
   41871:	44 89 de             	mov    %r11d,%esi
        if ((*pep_ & (PTE_P | PTE_PS)) == PTE_P && !skip) {
   41874:	4c 8b 67 08          	mov    0x8(%rdi),%r12
   41878:	49 8b 04 24          	mov    (%r12),%rax
   4187c:	25 81 00 00 00       	and    $0x81,%eax
   41881:	48 83 f8 01          	cmp    $0x1,%rax
   41885:	75 05                	jne    4188c <ptiter::down(bool)+0x96>
   41887:	40 84 f6             	test   %sil,%sil
   4188a:	74 95                	je     41821 <ptiter::down(bool)+0x2b>
            uintptr_t va = (va_ | pageoffmask(level_)) + 1;
   4188c:	48 8b 77 18          	mov    0x18(%rdi),%rsi
   41890:	44 8b 4f 10          	mov    0x10(%rdi),%r9d
    return (1UL << (PAGEOFFBITS + level * PAGEINDEXBITS)) - 1;
   41894:	47 8d 04 c9          	lea    (%r9,%r9,8),%r8d
   41898:	41 8d 48 0c          	lea    0xc(%r8),%ecx
   4189c:	4c 89 d2             	mov    %r10,%rdx
   4189f:	48 d3 e2             	shl    %cl,%rdx
   418a2:	48 83 ea 01          	sub    $0x1,%rdx
   418a6:	48 09 f2             	or     %rsi,%rdx
   418a9:	48 8d 42 01          	lea    0x1(%rdx),%rax
            if ((va ^ va_) & ~pageoffmask(level_ + 1)) {
   418ad:	41 8d 51 01          	lea    0x1(%r9),%edx
   418b1:	41 8d 48 15          	lea    0x15(%r8),%ecx
   418b5:	4d 89 d0             	mov    %r10,%r8
   418b8:	49 d3 e0             	shl    %cl,%r8
   418bb:	4c 89 c1             	mov    %r8,%rcx
   418be:	48 f7 d9             	neg    %rcx
   418c1:	49 89 f0             	mov    %rsi,%r8
   418c4:	49 31 c0             	xor    %rax,%r8
   418c7:	4c 85 c1             	test   %r8,%rcx
   418ca:	74 99                	je     41865 <ptiter::down(bool)+0x6f>
                if (level_ == 3) {
   418cc:	41 83 f9 03          	cmp    $0x3,%r9d
   418d0:	0f 84 7a ff ff ff    	je     41850 <ptiter::down(bool)+0x5a>
                level_ = 3;
   418d6:	c7 47 10 03 00 00 00 	movl   $0x3,0x10(%rdi)
                pep_ = &pt_->entry[pageindex(va_, level_)];
   418dd:	48 89 f0             	mov    %rsi,%rax
   418e0:	48 c1 e8 24          	shr    $0x24,%rax
   418e4:	25 f8 0f 00 00       	and    $0xff8,%eax
   418e9:	48 03 07             	add    (%rdi),%rax
   418ec:	48 89 47 08          	mov    %rax,0x8(%rdi)
                stop_level = level_ + 1;
   418f0:	41 89 d5             	mov    %edx,%r13d
   418f3:	e9 79 ff ff ff       	jmpq   41871 <ptiter::down(bool)+0x7b>

00000000000418f8 <ptiter::go(unsigned long)>:
void ptiter::go(uintptr_t va) {
   418f8:	f3 0f 1e fa          	endbr64 
   418fc:	55                   	push   %rbp
   418fd:	48 89 e5             	mov    %rsp,%rbp
    level_ = 3;
   41900:	c7 47 10 03 00 00 00 	movl   $0x3,0x10(%rdi)
    pep_ = &pt_->entry[pageindex(va, level_)];
   41907:	48 89 f0             	mov    %rsi,%rax
   4190a:	48 c1 e8 24          	shr    $0x24,%rax
   4190e:	25 f8 0f 00 00       	and    $0xff8,%eax
   41913:	48 03 07             	add    (%rdi),%rax
   41916:	48 89 47 08          	mov    %rax,0x8(%rdi)
    va_ = va;
   4191a:	48 89 77 18          	mov    %rsi,0x18(%rdi)
    down(false);
   4191e:	be 00 00 00 00       	mov    $0x0,%esi
   41923:	e8 ce fe ff ff       	callq  417f6 <ptiter::down(bool)>
}
   41928:	5d                   	pop    %rbp
   41929:	c3                   	retq   

000000000004192a <(anonymous namespace)::log_printer::putc(unsigned char, int)>:
         | IO_PARALLEL_CONTROL_INIT);
}

namespace {
struct log_printer : public printer {
    void putc(unsigned char c, int) override {
   4192a:	f3 0f 1e fa          	endbr64 
    if (!initialized) {
   4192e:	83 3d cf 86 01 00 00 	cmpl   $0x0,0x186cf(%rip)        # 5a004 <parallel_port_putc(unsigned char)::initialized>
   41935:	75 15                	jne    4194c <(anonymous namespace)::log_printer::putc(unsigned char, int)+0x22>
    asm volatile("outb %0, %w1" : : "a" (data), "d" (port));
   41937:	b8 00 00 00 00       	mov    $0x0,%eax
   4193c:	ba 7a 03 00 00       	mov    $0x37a,%edx
   41941:	ee                   	out    %al,(%dx)
        initialized = 1;
   41942:	c7 05 b8 86 01 00 01 	movl   $0x1,0x186b8(%rip)        # 5a004 <parallel_port_putc(unsigned char)::initialized>
   41949:	00 00 00 
    asm volatile("inb %w1, %0" : "=a" (data) : "d" (port));
   4194c:	ba 79 03 00 00       	mov    $0x379,%edx
   41951:	ec                   	in     (%dx),%al
         i < 12800 && (inb(IO_PARALLEL1_STATUS) & IO_PARALLEL_STATUS_BUSY) == 0;
   41952:	bf 00 32 00 00       	mov    $0x3200,%edi
   41957:	b9 84 00 00 00       	mov    $0x84,%ecx
   4195c:	41 b8 79 03 00 00    	mov    $0x379,%r8d
   41962:	84 c0                	test   %al,%al
   41964:	78 13                	js     41979 <(anonymous namespace)::log_printer::putc(unsigned char, int)+0x4f>
   41966:	89 ca                	mov    %ecx,%edx
   41968:	ec                   	in     (%dx),%al
   41969:	ec                   	in     (%dx),%al
   4196a:	ec                   	in     (%dx),%al
   4196b:	ec                   	in     (%dx),%al
   4196c:	83 ef 01             	sub    $0x1,%edi
   4196f:	74 08                	je     41979 <(anonymous namespace)::log_printer::putc(unsigned char, int)+0x4f>
   41971:	44 89 c2             	mov    %r8d,%edx
   41974:	ec                   	in     (%dx),%al
   41975:	84 c0                	test   %al,%al
   41977:	79 ed                	jns    41966 <(anonymous namespace)::log_printer::putc(unsigned char, int)+0x3c>
    asm volatile("outb %0, %w1" : : "a" (data), "d" (port));
   41979:	ba 78 03 00 00       	mov    $0x378,%edx
   4197e:	89 f0                	mov    %esi,%eax
   41980:	ee                   	out    %al,(%dx)
   41981:	ba 7a 03 00 00       	mov    $0x37a,%edx
   41986:	b8 0d 00 00 00       	mov    $0xd,%eax
   4198b:	ee                   	out    %al,(%dx)
   4198c:	b8 0c 00 00 00       	mov    $0xc,%eax
   41991:	ee                   	out    %al,(%dx)
        parallel_port_putc(c);
    }
   41992:	c3                   	retq   

0000000000041993 <stash_kernel_data(bool)>:

// stash_kernel_data
//    Soft reboot requires that we restore kernel data memory to
//    its initial state, so we store its initial state in unused
//    physical memory.
static void stash_kernel_data(bool reboot) {
   41993:	55                   	push   %rbp
   41994:	48 89 e5             	mov    %rsp,%rbp
   41997:	89 f8                	mov    %edi,%eax
    // stash initial value of data segment for soft-reboot support
    extern uint8_t _data_start, _edata, _kernel_end;
    uintptr_t data_size = (uintptr_t) &_edata - (uintptr_t) &_data_start;
   41999:	ba 60 21 05 00       	mov    $0x52160,%edx
   4199e:	48 81 ea 00 60 04 00 	sub    $0x46000,%rdx
    uint8_t* data_stash = (uint8_t*) (SYMTAB_ADDR - data_size);
   419a5:	bf 00 60 04 01       	mov    $0x1046000,%edi
   419aa:	48 81 ef 60 21 05 00 	sub    $0x52160,%rdi
    if (reboot) {
   419b1:	84 c0                	test   %al,%al
   419b3:	74 2a                	je     419df <stash_kernel_data(bool)+0x4c>
        memcpy(&_data_start, data_stash, data_size);
   419b5:	48 89 fe             	mov    %rdi,%rsi
   419b8:	bf 00 60 04 00       	mov    $0x46000,%edi
   419bd:	e8 24 1e 00 00       	callq  437e6 <memcpy>
        memset(&_edata, 0, &_kernel_end - &_edata);
   419c2:	ba e0 a0 05 00       	mov    $0x5a0e0,%edx
   419c7:	48 81 ea 60 21 05 00 	sub    $0x52160,%rdx
   419ce:	be 00 00 00 00       	mov    $0x0,%esi
   419d3:	bf 60 21 05 00       	mov    $0x52160,%edi
   419d8:	e8 7a 1e 00 00       	callq  43857 <memset>
    } else {
        memcpy(data_stash, &_data_start, data_size);
    }
}
   419dd:	5d                   	pop    %rbp
   419de:	c3                   	retq   
        memcpy(data_stash, &_data_start, data_size);
   419df:	be 00 60 04 00       	mov    $0x46000,%esi
   419e4:	e8 fd 1d 00 00       	callq  437e6 <memcpy>
}
   419e9:	eb f2                	jmp    419dd <stash_kernel_data(bool)+0x4a>
   419eb:	90                   	nop

00000000000419ec <(anonymous namespace)::backtracer::check()>:
    void check() {
   419ec:	55                   	push   %rbp
   419ed:	48 89 e5             	mov    %rsp,%rbp
   419f0:	53                   	push   %rbx
   419f1:	48 83 ec 28          	sub    $0x28,%rsp
   419f5:	48 89 fb             	mov    %rdi,%rbx
        if (rbp_ < rsp_
   419f8:	48 8b 37             	mov    (%rdi),%rsi
            || ((vmiter(pt_, rbp_).range_perm(16)) & PTE_P) == 0) {
   419fb:	48 3b 77 08          	cmp    0x8(%rdi),%rsi
   419ff:	72 0d                	jb     41a0e <(anonymous namespace)::backtracer::check()+0x22>
            || stack_top_ - rbp_ < 16
   41a01:	48 8b 47 10          	mov    0x10(%rdi),%rax
   41a05:	48 29 f0             	sub    %rsi,%rax
   41a08:	48 83 f8 0f          	cmp    $0xf,%rax
   41a0c:	77 16                	ja     41a24 <(anonymous namespace)::backtracer::check()+0x38>
            rbp_ = rsp_ = 0;
   41a0e:	48 c7 43 08 00 00 00 	movq   $0x0,0x8(%rbx)
   41a15:	00 
   41a16:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
    }
   41a1d:	48 83 c4 28          	add    $0x28,%rsp
   41a21:	5b                   	pop    %rbx
   41a22:	5d                   	pop    %rbp
   41a23:	c3                   	retq   
            || ((vmiter(pt_, rbp_).range_perm(16)) & PTE_P) == 0) {
   41a24:	48 8b 47 18          	mov    0x18(%rdi),%rax
    : pt_(pt), pep_(&pt_->entry[0]), level_(3), perm_(initial_perm), va_(0) {
   41a28:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
   41a2c:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
   41a30:	c7 45 e0 03 00 00 00 	movl   $0x3,-0x20(%rbp)
   41a37:	c7 45 e4 ff 0f 00 00 	movl   $0xfff,-0x1c(%rbp)
   41a3e:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
   41a45:	00 
    real_find(va);
   41a46:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
   41a4a:	e8 d9 f9 ff ff       	callq  41428 <vmiter::real_find(unsigned long)>
   41a4f:	be 10 00 00 00       	mov    $0x10,%esi
   41a54:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
   41a58:	e8 7f fa ff ff       	callq  414dc <vmiter::range_perm(unsigned long) const>
   41a5d:	a8 01                	test   $0x1,%al
   41a5f:	75 bc                	jne    41a1d <(anonymous namespace)::backtracer::check()+0x31>
   41a61:	eb ab                	jmp    41a0e <(anonymous namespace)::backtracer::check()+0x22>

0000000000041a63 <init_timer(int)>:
void init_timer(int rate) {
   41a63:	f3 0f 1e fa          	endbr64 
    if (rate > 0) {
   41a67:	85 ff                	test   %edi,%edi
   41a69:	7e 12                	jle    41a7d <init_timer(int)+0x1a>
        lapic.write(lapic.reg_timer_initial_count, 1000000000 / rate);
   41a6b:	b8 00 ca 9a 3b       	mov    $0x3b9aca00,%eax
   41a70:	99                   	cltd   
   41a71:	f7 ff                	idiv   %edi
   41a73:	a3 80 03 e0 fe 00 00 	movabs %eax,0xfee00380
   41a7a:	00 00 
}
   41a7c:	c3                   	retq   
    reg_[reg].v = v;
   41a7d:	b8 80 03 e0 fe       	mov    $0xfee00380,%eax
   41a82:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
}
   41a88:	c3                   	retq   

0000000000041a89 <kalloc_pagetable()>:
x86_64_pagetable* kalloc_pagetable() {
   41a89:	f3 0f 1e fa          	endbr64 
   41a8d:	55                   	push   %rbp
   41a8e:	48 89 e5             	mov    %rsp,%rbp
   41a91:	53                   	push   %rbx
   41a92:	48 83 ec 08          	sub    $0x8,%rsp
    x86_64_pagetable* pt = reinterpret_cast<x86_64_pagetable*>(kalloc(PAGESIZE));
   41a96:	bf 00 10 00 00       	mov    $0x1000,%edi
   41a9b:	e8 e4 f0 ff ff       	callq  40b84 <kalloc(unsigned long)>
   41aa0:	48 89 c3             	mov    %rax,%rbx
    if (pt) {
   41aa3:	48 85 c0             	test   %rax,%rax
   41aa6:	74 12                	je     41aba <kalloc_pagetable()+0x31>
        memset(&pt->entry[0], 0, sizeof(x86_64_pageentry_t) * 512);
   41aa8:	ba 00 10 00 00       	mov    $0x1000,%edx
   41aad:	be 00 00 00 00       	mov    $0x0,%esi
   41ab2:	48 89 c7             	mov    %rax,%rdi
   41ab5:	e8 9d 1d 00 00       	callq  43857 <memset>
}
   41aba:	48 89 d8             	mov    %rbx,%rax
   41abd:	48 83 c4 08          	add    $0x8,%rsp
   41ac1:	5b                   	pop    %rbx
   41ac2:	5d                   	pop    %rbp
   41ac3:	c3                   	retq   

0000000000041ac4 <reserved_physical_address(unsigned long)>:
bool reserved_physical_address(uintptr_t pa) {
   41ac4:	f3 0f 1e fa          	endbr64 
    return pa < PAGESIZE || (pa >= IOPHYSMEM && pa < EXTPHYSMEM);
   41ac8:	48 8d 87 00 00 f6 ff 	lea    -0xa0000(%rdi),%rax
   41acf:	48 3d ff ff 05 00    	cmp    $0x5ffff,%rax
   41ad5:	0f 96 c0             	setbe  %al
   41ad8:	48 81 ff ff 0f 00 00 	cmp    $0xfff,%rdi
   41adf:	0f 96 c2             	setbe  %dl
   41ae2:	09 d0                	or     %edx,%eax
}
   41ae4:	c3                   	retq   

0000000000041ae5 <allocatable_physical_address(unsigned long)>:
bool allocatable_physical_address(uintptr_t pa) {
   41ae5:	f3 0f 1e fa          	endbr64 
   41ae9:	55                   	push   %rbp
   41aea:	48 89 e5             	mov    %rsp,%rbp
   41aed:	53                   	push   %rbx
   41aee:	48 83 ec 08          	sub    $0x8,%rsp
   41af2:	48 89 fb             	mov    %rdi,%rbx
    return !reserved_physical_address(pa)
   41af5:	e8 ca ff ff ff       	callq  41ac4 <reserved_physical_address(unsigned long)>
        && pa < MEMSIZE_PHYSICAL;
   41afa:	84 c0                	test   %al,%al
   41afc:	75 38                	jne    41b36 <allocatable_physical_address(unsigned long)+0x51>
        && (pa < KERNEL_START_ADDR
   41afe:	48 81 fb ff ff 03 00 	cmp    $0x3ffff,%rbx
   41b05:	76 11                	jbe    41b18 <allocatable_physical_address(unsigned long)+0x33>
//    Return the smallest multiple of `m` greater than or equal to `x`.
//    Equivalently, round `x` up to the nearest multiple of `m`.
template <typename T>
inline constexpr T round_up(T x, unsigned m) {
    static_assert(std::is_unsigned<T>::value, "T must be unsigned");
    return round_down(x + m - 1, m);
   41b07:	ba df b0 05 00       	mov    $0x5b0df,%edx
            || pa >= round_up((uintptr_t) _kernel_end, PAGESIZE))
   41b0c:	48 81 e2 00 f0 ff ff 	and    $0xfffffffffffff000,%rdx
   41b13:	48 39 d3             	cmp    %rdx,%rbx
   41b16:	72 23                	jb     41b3b <allocatable_physical_address(unsigned long)+0x56>
            || pa >= KERNEL_STACK_TOP)
   41b18:	48 8d 83 00 10 f8 ff 	lea    -0x7f000(%rbx),%rax
        && (pa < KERNEL_STACK_TOP - PAGESIZE
   41b1f:	48 3d ff 0f 00 00    	cmp    $0xfff,%rax
   41b25:	0f 97 c0             	seta   %al
        && pa < MEMSIZE_PHYSICAL;
   41b28:	48 81 fb ff ff 1f 00 	cmp    $0x1fffff,%rbx
   41b2f:	0f 96 c2             	setbe  %dl
   41b32:	21 d0                	and    %edx,%eax
   41b34:	eb 05                	jmp    41b3b <allocatable_physical_address(unsigned long)+0x56>
   41b36:	b8 00 00 00 00       	mov    $0x0,%eax
}
   41b3b:	48 83 c4 08          	add    $0x8,%rsp
   41b3f:	5b                   	pop    %rbx
   41b40:	5d                   	pop    %rbp
   41b41:	c3                   	retq   

0000000000041b42 <init_process(proc*, int)>:
void init_process(proc* p, int flags) {
   41b42:	f3 0f 1e fa          	endbr64 
   41b46:	55                   	push   %rbp
   41b47:	48 89 e5             	mov    %rsp,%rbp
   41b4a:	41 54                	push   %r12
   41b4c:	53                   	push   %rbx
   41b4d:	48 89 fb             	mov    %rdi,%rbx
   41b50:	41 89 f4             	mov    %esi,%r12d
    memset(&p->regs, 0, sizeof(p->regs));
   41b53:	48 8d 7f 10          	lea    0x10(%rdi),%rdi
   41b57:	ba c0 00 00 00       	mov    $0xc0,%edx
   41b5c:	be 00 00 00 00       	mov    $0x0,%esi
   41b61:	e8 f1 1c 00 00       	callq  43857 <memset>
    p->regs.reg_cs = SEGSEL_APP_CODE | 3;
   41b66:	48 c7 83 b0 00 00 00 	movq   $0x1b,0xb0(%rbx)
   41b6d:	1b 00 00 00 
    p->regs.reg_fs = SEGSEL_APP_DATA | 3;
   41b71:	48 c7 83 88 00 00 00 	movq   $0x23,0x88(%rbx)
   41b78:	23 00 00 00 
    p->regs.reg_gs = SEGSEL_APP_DATA | 3;
   41b7c:	48 c7 83 90 00 00 00 	movq   $0x23,0x90(%rbx)
   41b83:	23 00 00 00 
    p->regs.reg_ss = SEGSEL_APP_DATA | 3;
   41b87:	48 c7 83 c8 00 00 00 	movq   $0x23,0xc8(%rbx)
   41b8e:	23 00 00 00 
    if (flags & PROCINIT_ALLOW_PROGRAMMED_IO) {
   41b92:	44 89 e0             	mov    %r12d,%eax
   41b95:	83 e0 01             	and    $0x1,%eax
    p->regs.reg_rflags = EFLAGS_IF;
   41b98:	83 f8 01             	cmp    $0x1,%eax
   41b9b:	48 19 c0             	sbb    %rax,%rax
   41b9e:	48 25 00 d0 ff ff    	and    $0xffffffffffffd000,%rax
   41ba4:	48 05 00 32 00 00    	add    $0x3200,%rax
   41baa:	48 89 83 b8 00 00 00 	mov    %rax,0xb8(%rbx)
    if (flags & PROCINIT_DISABLE_INTERRUPTS) {
   41bb1:	41 f6 c4 02          	test   $0x2,%r12b
   41bb5:	74 0b                	je     41bc2 <init_process(proc*, int)+0x80>
        p->regs.reg_rflags &= ~EFLAGS_IF;
   41bb7:	48 81 a3 b8 00 00 00 	andq   $0xfffffffffffffdff,0xb8(%rbx)
   41bbe:	ff fd ff ff 
}
   41bc2:	5b                   	pop    %rbx
   41bc3:	41 5c                	pop    %r12
   41bc5:	5d                   	pop    %rbp
   41bc6:	c3                   	retq   

0000000000041bc7 <console_show_cursor(int)>:
void console_show_cursor(int cpos) {
   41bc7:	f3 0f 1e fa          	endbr64 
        cpos = 0;
   41bcb:	81 ff d1 07 00 00    	cmp    $0x7d1,%edi
   41bd1:	b8 00 00 00 00       	mov    $0x0,%eax
   41bd6:	0f 43 f8             	cmovae %eax,%edi
   41bd9:	be d4 03 00 00       	mov    $0x3d4,%esi
   41bde:	b8 0e 00 00 00       	mov    $0xe,%eax
   41be3:	89 f2                	mov    %esi,%edx
   41be5:	ee                   	out    %al,(%dx)
    outb(0x3D5, cpos / 256);
   41be6:	8d 87 ff 00 00 00    	lea    0xff(%rdi),%eax
   41bec:	85 ff                	test   %edi,%edi
   41bee:	0f 49 c7             	cmovns %edi,%eax
   41bf1:	c1 f8 08             	sar    $0x8,%eax
   41bf4:	b9 d5 03 00 00       	mov    $0x3d5,%ecx
   41bf9:	89 ca                	mov    %ecx,%edx
   41bfb:	ee                   	out    %al,(%dx)
   41bfc:	b8 0f 00 00 00       	mov    $0xf,%eax
   41c01:	89 f2                	mov    %esi,%edx
   41c03:	ee                   	out    %al,(%dx)
    outb(0x3D5, cpos % 256);
   41c04:	89 fa                	mov    %edi,%edx
   41c06:	c1 fa 1f             	sar    $0x1f,%edx
   41c09:	c1 ea 18             	shr    $0x18,%edx
   41c0c:	8d 04 17             	lea    (%rdi,%rdx,1),%eax
   41c0f:	0f b6 c0             	movzbl %al,%eax
   41c12:	29 d0                	sub    %edx,%eax
   41c14:	89 ca                	mov    %ecx,%edx
   41c16:	ee                   	out    %al,(%dx)
}
   41c17:	c3                   	retq   

0000000000041c18 <keyboard_readc()>:
int keyboard_readc() {
   41c18:	f3 0f 1e fa          	endbr64 
    asm volatile("inb %w1, %0" : "=a" (data) : "d" (port));
   41c1c:	ba 64 00 00 00       	mov    $0x64,%edx
   41c21:	ec                   	in     (%dx),%al
    if ((inb(KEYBOARD_STATUSREG) & KEYBOARD_STATUS_READY) == 0) {
   41c22:	a8 01                	test   $0x1,%al
   41c24:	0f 84 1d 01 00 00    	je     41d47 <keyboard_readc()+0x12f>
   41c2a:	ba 60 00 00 00       	mov    $0x60,%edx
   41c2f:	ec                   	in     (%dx),%al
    uint8_t escape = last_escape;
   41c30:	0f b6 15 d1 83 01 00 	movzbl 0x183d1(%rip),%edx        # 5a008 <keyboard_readc()::last_escape>
    last_escape = 0;
   41c37:	c6 05 ca 83 01 00 00 	movb   $0x0,0x183ca(%rip)        # 5a008 <keyboard_readc()::last_escape>
    if (data == 0xE0) {         // mode shift
   41c3e:	3c e0                	cmp    $0xe0,%al
   41c40:	74 2a                	je     41c6c <keyboard_readc()+0x54>
    } else if (data & 0x80) {   // key release: matters only for modifier keys
   41c42:	84 c0                	test   %al,%al
   41c44:	78 33                	js     41c79 <keyboard_readc()+0x61>
    int ch = (unsigned char) keymap[data | escape];
   41c46:	09 d0                	or     %edx,%eax
   41c48:	0f b6 c0             	movzbl %al,%eax
   41c4b:	0f b6 80 80 4d 04 00 	movzbl 0x44d80(%rax),%eax
    if (ch >= 'a' && ch <= 'z') {
   41c52:	89 c1                	mov    %eax,%ecx
   41c54:	8d 50 9f             	lea    -0x61(%rax),%edx
   41c57:	83 fa 19             	cmp    $0x19,%edx
   41c5a:	77 73                	ja     41ccf <keyboard_readc()+0xb7>
        if (modifiers & MOD_CONTROL) {
   41c5c:	0f b6 15 a6 83 01 00 	movzbl 0x183a6(%rip),%edx        # 5a009 <keyboard_readc()::modifiers>
   41c63:	f6 c2 02             	test   $0x2,%dl
   41c66:	74 4d                	je     41cb5 <keyboard_readc()+0x9d>
            ch -= 0x60;
   41c68:	83 e8 60             	sub    $0x60,%eax
   41c6b:	c3                   	retq   
        last_escape = 0x80;
   41c6c:	c6 05 95 83 01 00 80 	movb   $0x80,0x18395(%rip)        # 5a008 <keyboard_readc()::last_escape>
        return 0;
   41c73:	b8 00 00 00 00       	mov    $0x0,%eax
   41c78:	c3                   	retq   
        int ch = keymap[(data & 0x7F) | escape];
   41c79:	83 e0 7f             	and    $0x7f,%eax
   41c7c:	09 d0                	or     %edx,%eax
   41c7e:	0f b6 c0             	movzbl %al,%eax
   41c81:	0f b6 88 80 4d 04 00 	movzbl 0x44d80(%rax),%ecx
        if (ch >= KEY_SHIFT && ch < KEY_CAPSLOCK) {
   41c88:	0f b6 d1             	movzbl %cl,%edx
   41c8b:	81 ea fa 00 00 00    	sub    $0xfa,%edx
        return 0;
   41c91:	b8 00 00 00 00       	mov    $0x0,%eax
        if (ch >= KEY_SHIFT && ch < KEY_CAPSLOCK) {
   41c96:	83 fa 02             	cmp    $0x2,%edx
   41c99:	0f 87 ad 00 00 00    	ja     41d4c <keyboard_readc()+0x134>
            modifiers &= ~(1 << (ch - KEY_SHIFT));
   41c9f:	83 c1 06             	add    $0x6,%ecx
   41ca2:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
   41ca7:	d3 c0                	rol    %cl,%eax
   41ca9:	20 05 5a 83 01 00    	and    %al,0x1835a(%rip)        # 5a009 <keyboard_readc()::modifiers>
        return 0;
   41caf:	b8 00 00 00 00       	mov    $0x0,%eax
   41cb4:	c3                   	retq   
        } else if (!(modifiers & MOD_SHIFT) != !(modifiers & MOD_CAPSLOCK)) {
   41cb5:	89 d1                	mov    %edx,%ecx
   41cb7:	83 f1 01             	xor    $0x1,%ecx
   41cba:	83 e1 01             	and    $0x1,%ecx
   41cbd:	c0 ea 03             	shr    $0x3,%dl
   41cc0:	83 f2 01             	xor    $0x1,%edx
   41cc3:	83 e2 01             	and    $0x1,%edx
            ch -= 0x20;
   41cc6:	8d 70 e0             	lea    -0x20(%rax),%esi
   41cc9:	38 d1                	cmp    %dl,%cl
   41ccb:	0f 45 c6             	cmovne %esi,%eax
   41cce:	c3                   	retq   
    } else if (ch >= KEY_CAPSLOCK) {
   41ccf:	3d fc 00 00 00       	cmp    $0xfc,%eax
   41cd4:	7e 19                	jle    41cef <keyboard_readc()+0xd7>
        modifiers ^= 1 << (ch - KEY_SHIFT);
   41cd6:	8d 88 06 ff ff ff    	lea    -0xfa(%rax),%ecx
   41cdc:	ba 01 00 00 00       	mov    $0x1,%edx
   41ce1:	d3 e2                	shl    %cl,%edx
   41ce3:	30 15 20 83 01 00    	xor    %dl,0x18320(%rip)        # 5a009 <keyboard_readc()::modifiers>
        ch = 0;
   41ce9:	b8 00 00 00 00       	mov    $0x0,%eax
   41cee:	c3                   	retq   
    } else if (ch >= KEY_SHIFT) {
   41cef:	3d f9 00 00 00       	cmp    $0xf9,%eax
   41cf4:	7e 19                	jle    41d0f <keyboard_readc()+0xf7>
        modifiers |= 1 << (ch - KEY_SHIFT);
   41cf6:	8d 88 06 ff ff ff    	lea    -0xfa(%rax),%ecx
   41cfc:	ba 01 00 00 00       	mov    $0x1,%edx
   41d01:	d3 e2                	shl    %cl,%edx
   41d03:	08 15 00 83 01 00    	or     %dl,0x18300(%rip)        # 5a009 <keyboard_readc()::modifiers>
        ch = 0;
   41d09:	b8 00 00 00 00       	mov    $0x0,%eax
   41d0e:	c3                   	retq   
    } else if (ch >= CKEY(0) && ch <= CKEY(21)) {
   41d0f:	83 c1 80             	add    $0xffffff80,%ecx
   41d12:	83 f9 15             	cmp    $0x15,%ecx
   41d15:	77 18                	ja     41d2f <keyboard_readc()+0x117>
        ch = complex_keymap[ch - CKEY(0)].map[modifiers & 3];
   41d17:	0f b6 15 eb 82 01 00 	movzbl 0x182eb(%rip),%edx        # 5a009 <keyboard_readc()::modifiers>
   41d1e:	83 e2 03             	and    $0x3,%edx
   41d21:	83 c0 80             	add    $0xffffff80,%eax
   41d24:	48 98                	cltq   
   41d26:	0f b6 84 82 20 4d 04 	movzbl 0x44d20(%rdx,%rax,4),%eax
   41d2d:	00 
   41d2e:	c3                   	retq   
    } else if (ch < 0x80 && (modifiers & MOD_CONTROL)) {
   41d2f:	83 f8 7f             	cmp    $0x7f,%eax
   41d32:	7f 18                	jg     41d4c <keyboard_readc()+0x134>
   41d34:	0f b6 15 ce 82 01 00 	movzbl 0x182ce(%rip),%edx        # 5a009 <keyboard_readc()::modifiers>
   41d3b:	83 e2 02             	and    $0x2,%edx
        ch = 0;
   41d3e:	ba 00 00 00 00       	mov    $0x0,%edx
   41d43:	0f 45 c2             	cmovne %edx,%eax
   41d46:	c3                   	retq   
        return -1;
   41d47:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
   41d4c:	c3                   	retq   

0000000000041d4d <log_vprintf(char const*, __va_list_tag*)>:
void log_vprintf(const char* format, va_list val) {
   41d4d:	f3 0f 1e fa          	endbr64 
   41d51:	55                   	push   %rbp
   41d52:	48 89 e5             	mov    %rsp,%rbp
   41d55:	48 83 ec 10          	sub    $0x10,%rsp
   41d59:	48 89 fa             	mov    %rdi,%rdx
   41d5c:	48 89 f1             	mov    %rsi,%rcx
    log_printer p;
   41d5f:	48 c7 45 f8 10 4d 04 	movq   $0x44d10,-0x8(%rbp)
   41d66:	00 
    p.vprintf(0, format, val);
   41d67:	be 00 00 00 00       	mov    $0x0,%esi
   41d6c:	48 8d 7d f8          	lea    -0x8(%rbp),%rdi
   41d70:	e8 bf 1b 00 00       	callq  43934 <printer::vprintf(int, char const*, __va_list_tag*)>
}
   41d75:	c9                   	leaveq 
   41d76:	c3                   	retq   

0000000000041d77 <log_printf(char const*, ...)>:
void log_printf(const char* format, ...) {
   41d77:	f3 0f 1e fa          	endbr64 
   41d7b:	55                   	push   %rbp
   41d7c:	48 89 e5             	mov    %rsp,%rbp
   41d7f:	48 83 ec 50          	sub    $0x50,%rsp
   41d83:	48 89 75 d8          	mov    %rsi,-0x28(%rbp)
   41d87:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
   41d8b:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   41d8f:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   41d93:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_start(val, format);
   41d97:	c7 45 b8 08 00 00 00 	movl   $0x8,-0x48(%rbp)
   41d9e:	48 8d 45 10          	lea    0x10(%rbp),%rax
   41da2:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   41da6:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   41daa:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    log_vprintf(format, val);
   41dae:	48 8d 75 b8          	lea    -0x48(%rbp),%rsi
   41db2:	e8 96 ff ff ff       	callq  41d4d <log_vprintf(char const*, __va_list_tag*)>
}
   41db7:	c9                   	leaveq 
   41db8:	c3                   	retq   

0000000000041db9 <lookup_symbol(unsigned long, char const**, unsigned long*)>:
bool lookup_symbol(uintptr_t addr, const char** name, uintptr_t* start) {
   41db9:	f3 0f 1e fa          	endbr64 
   41dbd:	55                   	push   %rbp
   41dbe:	48 89 e5             	mov    %rsp,%rbp
   41dc1:	41 54                	push   %r12
   41dc3:	53                   	push   %rbx
   41dc4:	48 89 f3             	mov    %rsi,%rbx
   41dc7:	49 89 d4             	mov    %rdx,%r12
    if (!kernel_pagetable[2].entry[SYMTAB_ADDR / 0x200000]) {
   41dca:	48 83 3d 6e 52 01 00 	cmpq   $0x0,0x1526e(%rip)        # 57040 <kernel_pagetable+0x2040>
   41dd1:	00 
   41dd2:	75 0b                	jne    41ddf <lookup_symbol(unsigned long, char const**, unsigned long*)+0x26>
        kernel_pagetable[2].entry[SYMTAB_ADDR / 0x200000] =
   41dd4:	48 c7 05 61 52 01 00 	movq   $0x1000083,0x15261(%rip)        # 57040 <kernel_pagetable+0x2040>
   41ddb:	83 00 00 01 
    size_t r = symtab.nsym;
   41ddf:	48 8b 35 c2 42 00 00 	mov    0x42c2(%rip),%rsi        # 460a8 <symtab+0x8>
        auto& sym = symtab.sym[m];
   41de6:	48 8b 15 b3 42 00 00 	mov    0x42b3(%rip),%rdx        # 460a0 <symtab>
    size_t r = symtab.nsym;
   41ded:	49 89 f1             	mov    %rsi,%r9
    size_t l = 0;
   41df0:	41 b8 00 00 00 00    	mov    $0x0,%r8d
   41df6:	eb 19                	jmp    41e11 <lookup_symbol(unsigned long, char const**, unsigned long*)+0x58>
            && (sym.st_size == 0 || addr <= sym.st_value + sym.st_size)) {
   41df8:	4d 8b 5a 10          	mov    0x10(%r10),%r11
   41dfc:	4d 85 db             	test   %r11,%r11
   41dff:	74 43                	je     41e44 <lookup_symbol(unsigned long, char const**, unsigned long*)+0x8b>
   41e01:	49 01 cb             	add    %rcx,%r11
   41e04:	49 39 fb             	cmp    %rdi,%r11
   41e07:	73 3b                	jae    41e44 <lookup_symbol(unsigned long, char const**, unsigned long*)+0x8b>
        } else if (sym.st_value < addr) {
   41e09:	48 39 f9             	cmp    %rdi,%rcx
   41e0c:	72 6b                	jb     41e79 <lookup_symbol(unsigned long, char const**, unsigned long*)+0xc0>
        size_t m = l + ((r - l) >> 1);
   41e0e:	49 89 c1             	mov    %rax,%r9
    while (l < r) {
   41e11:	4d 39 c8             	cmp    %r9,%r8
   41e14:	73 69                	jae    41e7f <lookup_symbol(unsigned long, char const**, unsigned long*)+0xc6>
        size_t m = l + ((r - l) >> 1);
   41e16:	4c 89 c8             	mov    %r9,%rax
   41e19:	4c 29 c0             	sub    %r8,%rax
   41e1c:	48 d1 e8             	shr    %rax
   41e1f:	4c 01 c0             	add    %r8,%rax
        auto& sym = symtab.sym[m];
   41e22:	48 8d 0c 40          	lea    (%rax,%rax,2),%rcx
   41e26:	4c 8d 14 ca          	lea    (%rdx,%rcx,8),%r10
        if (sym.st_value <= addr
   41e2a:	49 8b 4a 08          	mov    0x8(%r10),%rcx
   41e2e:	48 39 f9             	cmp    %rdi,%rcx
   41e31:	77 d6                	ja     41e09 <lookup_symbol(unsigned long, char const**, unsigned long*)+0x50>
            && (m + 1 == symtab.nsym || addr < (&sym)[1].st_value)
   41e33:	4c 8d 58 01          	lea    0x1(%rax),%r11
   41e37:	49 39 f3             	cmp    %rsi,%r11
   41e3a:	74 bc                	je     41df8 <lookup_symbol(unsigned long, char const**, unsigned long*)+0x3f>
   41e3c:	49 39 7a 20          	cmp    %rdi,0x20(%r10)
   41e40:	76 c7                	jbe    41e09 <lookup_symbol(unsigned long, char const**, unsigned long*)+0x50>
   41e42:	eb b4                	jmp    41df8 <lookup_symbol(unsigned long, char const**, unsigned long*)+0x3f>
                return false;
   41e44:	b8 00 00 00 00       	mov    $0x0,%eax
            if (!sym.st_value) {
   41e49:	48 85 c9             	test   %rcx,%rcx
   41e4c:	74 36                	je     41e84 <lookup_symbol(unsigned long, char const**, unsigned long*)+0xcb>
            if (name) {
   41e4e:	48 85 db             	test   %rbx,%rbx
   41e51:	74 0d                	je     41e60 <lookup_symbol(unsigned long, char const**, unsigned long*)+0xa7>
                *name = symtab.strtab + sym.st_name;
   41e53:	41 8b 02             	mov    (%r10),%eax
   41e56:	48 03 05 53 42 00 00 	add    0x4253(%rip),%rax        # 460b0 <symtab+0x10>
   41e5d:	48 89 03             	mov    %rax,(%rbx)
            return true;
   41e60:	b8 01 00 00 00       	mov    $0x1,%eax
            if (start) {
   41e65:	4d 85 e4             	test   %r12,%r12
   41e68:	74 1a                	je     41e84 <lookup_symbol(unsigned long, char const**, unsigned long*)+0xcb>
                *start = sym.st_value;
   41e6a:	49 8b 42 08          	mov    0x8(%r10),%rax
   41e6e:	49 89 04 24          	mov    %rax,(%r12)
            return true;
   41e72:	b8 01 00 00 00       	mov    $0x1,%eax
   41e77:	eb 0b                	jmp    41e84 <lookup_symbol(unsigned long, char const**, unsigned long*)+0xcb>
            l = m + 1;
   41e79:	4c 8d 40 01          	lea    0x1(%rax),%r8
   41e7d:	eb 92                	jmp    41e11 <lookup_symbol(unsigned long, char const**, unsigned long*)+0x58>
    return false;
   41e7f:	b8 00 00 00 00       	mov    $0x0,%eax
}
   41e84:	5b                   	pop    %rbx
   41e85:	41 5c                	pop    %r12
   41e87:	5d                   	pop    %rbp
   41e88:	c3                   	retq   

0000000000041e89 <error_print_backtrace(unsigned long, unsigned long)>:
static void error_print_backtrace(uintptr_t rsp, uintptr_t rbp) {
   41e89:	55                   	push   %rbp
   41e8a:	48 89 e5             	mov    %rsp,%rbp
   41e8d:	41 54                	push   %r12
   41e8f:	53                   	push   %rbx
   41e90:	48 83 ec 30          	sub    $0x30,%rsp
        : rbp_(rbp), rsp_(rsp), stack_top_(stack_top) {
   41e94:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
   41e98:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
   41e9c:	48 81 c7 ff 0f 00 00 	add    $0xfff,%rdi
   41ea3:	48 81 e7 00 f0 ff ff 	and    $0xfffffffffffff000,%rdi
   41eaa:	48 89 7d e0          	mov    %rdi,-0x20(%rbp)
    return x;
}

__always_inline uintptr_t rdcr3() {
    uintptr_t x;
    asm volatile("movq %%cr3, %0" : "=r" (x));
   41eae:	0f 20 d8             	mov    %cr3,%rax
        pt_ = pa2kptr<x86_64_pagetable*>(rdcr3());
   41eb1:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
        check();
   41eb5:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
   41eb9:	e8 2e fb ff ff       	callq  419ec <(anonymous namespace)::backtracer::check()>
    int frame = 1;
   41ebe:	bb 01 00 00 00       	mov    $0x1,%ebx
         bt.ok();
   41ec3:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
   41ec8:	74 65                	je     41f2f <error_print_backtrace(unsigned long, unsigned long)+0xa6>
        return rbpx[1];
   41eca:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   41ece:	4c 8b 60 08          	mov    0x8(%rax),%r12
        if (lookup_symbol(ret_rip, &name, nullptr)) {
   41ed2:	ba 00 00 00 00       	mov    $0x0,%edx
   41ed7:	48 8d 75 c8          	lea    -0x38(%rbp),%rsi
   41edb:	4c 89 e7             	mov    %r12,%rdi
   41ede:	e8 d6 fe ff ff       	callq  41db9 <lookup_symbol(unsigned long, char const**, unsigned long*)>
   41ee3:	84 c0                	test   %al,%al
   41ee5:	74 35                	je     41f1c <error_print_backtrace(unsigned long, unsigned long)+0x93>
            error_printf("  #%d  %p  <%s>\n", frame, ret_rip, name);
   41ee7:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
   41eeb:	4c 89 e2             	mov    %r12,%rdx
   41eee:	89 de                	mov    %ebx,%esi
   41ef0:	bf 02 49 04 00       	mov    $0x44902,%edi
   41ef5:	b0 00                	mov    $0x0,%al
   41ef7:	e8 d7 24 00 00       	callq  443d3 <error_printf(char const*, ...)>
        uintptr_t* rbpx = reinterpret_cast<uintptr_t*>(rbp_);
   41efc:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
        rsp_ = rbp_ + 16;
   41f00:	48 8d 50 10          	lea    0x10(%rax),%rdx
   41f04:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
        rbp_ = rbpx[0];
   41f08:	48 8b 00             	mov    (%rax),%rax
   41f0b:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
        check();
   41f0f:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
   41f13:	e8 d4 fa ff ff       	callq  419ec <(anonymous namespace)::backtracer::check()>
    for (backtracer bt(rbp, rsp, round_up(rsp, PAGESIZE));
   41f18:	ff c3                	inc    %ebx
   41f1a:	eb a7                	jmp    41ec3 <error_print_backtrace(unsigned long, unsigned long)+0x3a>
            error_printf("  #%d  %p\n", frame, ret_rip);
   41f1c:	4c 89 e2             	mov    %r12,%rdx
   41f1f:	89 de                	mov    %ebx,%esi
   41f21:	bf 15 49 04 00       	mov    $0x44915,%edi
   41f26:	b0 00                	mov    $0x0,%al
   41f28:	e8 a6 24 00 00       	callq  443d3 <error_printf(char const*, ...)>
   41f2d:	eb cd                	jmp    41efc <error_print_backtrace(unsigned long, unsigned long)+0x73>
}
   41f2f:	48 83 c4 30          	add    $0x30,%rsp
   41f33:	5b                   	pop    %rbx
   41f34:	41 5c                	pop    %r12
   41f36:	5d                   	pop    %rbp
   41f37:	c3                   	retq   

0000000000041f38 <error_vprintf(int, int, char const*, __va_list_tag*)>:
int error_vprintf(int cpos, int color, const char* format, va_list val) {
   41f38:	f3 0f 1e fa          	endbr64 
   41f3c:	55                   	push   %rbp
   41f3d:	48 89 e5             	mov    %rsp,%rbp
   41f40:	41 56                	push   %r14
   41f42:	41 55                	push   %r13
   41f44:	41 54                	push   %r12
   41f46:	53                   	push   %rbx
   41f47:	48 83 ec 20          	sub    $0x20,%rsp
   41f4b:	41 89 fd             	mov    %edi,%r13d
   41f4e:	41 89 f6             	mov    %esi,%r14d
   41f51:	49 89 d4             	mov    %rdx,%r12
   41f54:	48 89 cb             	mov    %rcx,%rbx
    __builtin_va_copy(val2, val);
   41f57:	48 8d 45 c8          	lea    -0x38(%rbp),%rax
   41f5b:	b9 06 00 00 00       	mov    $0x6,%ecx
   41f60:	48 89 c7             	mov    %rax,%rdi
   41f63:	48 89 de             	mov    %rbx,%rsi
   41f66:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
    log_vprintf(format, val2);
   41f68:	48 89 c6             	mov    %rax,%rsi
   41f6b:	48 89 d7             	mov    %rdx,%rdi
   41f6e:	e8 da fd ff ff       	callq  41d4d <log_vprintf(char const*, __va_list_tag*)>
    return console_vprintf(cpos, color, format, val);
   41f73:	48 89 d9             	mov    %rbx,%rcx
   41f76:	4c 89 e2             	mov    %r12,%rdx
   41f79:	44 89 f6             	mov    %r14d,%esi
   41f7c:	44 89 ef             	mov    %r13d,%edi
   41f7f:	e8 72 23 00 00       	callq  442f6 <console_vprintf(int, int, char const*, __va_list_tag*)>
}
   41f84:	48 83 c4 20          	add    $0x20,%rsp
   41f88:	5b                   	pop    %rbx
   41f89:	41 5c                	pop    %r12
   41f8b:	41 5d                	pop    %r13
   41f8d:	41 5e                	pop    %r14
   41f8f:	5d                   	pop    %rbp
   41f90:	c3                   	retq   

0000000000041f91 <vpanic(unsigned long, unsigned long, unsigned long, char const*, __va_list_tag*)>:
                   const char* format, va_list val) {
   41f91:	55                   	push   %rbp
   41f92:	48 89 e5             	mov    %rsp,%rbp
   41f95:	41 57                	push   %r15
   41f97:	41 56                	push   %r14
   41f99:	41 55                	push   %r13
   41f9b:	41 54                	push   %r12
   41f9d:	53                   	push   %rbx
   41f9e:	48 83 ec 18          	sub    $0x18,%rsp
   41fa2:	49 89 fd             	mov    %rdi,%r13
   41fa5:	49 89 f6             	mov    %rsi,%r14
   41fa8:	48 89 d3             	mov    %rdx,%rbx
	__atomic_store_n(&_M_i, __i, int(__m));
   41fab:	c6 05 57 20 01 00 01 	movb   $0x1,0x12057(%rip)        # 54009 <panicking>
   41fb2:	0f ae f0             	mfence 
    cursorpos = CPOS(24, 80);
   41fb5:	c7 05 3d 70 07 00 d0 	movl   $0x7d0,0x7703d(%rip)        # b8ffc <cursorpos>
   41fbc:	07 00 00 
    if (format) {
   41fbf:	48 85 c9             	test   %rcx,%rcx
   41fc2:	0f 84 a0 00 00 00    	je     42068 <vpanic(unsigned long, unsigned long, unsigned long, char const*, __va_list_tag*)+0xd7>
   41fc8:	49 89 cc             	mov    %rcx,%r12
   41fcb:	4d 89 c7             	mov    %r8,%r15
        error_printf(-1, COLOR_ERROR, "PANIC: ");
   41fce:	ba 20 49 04 00       	mov    $0x44920,%edx
   41fd3:	be 00 c0 00 00       	mov    $0xc000,%esi
   41fd8:	bf ff ff ff ff       	mov    $0xffffffff,%edi
   41fdd:	b0 00                	mov    $0x0,%al
   41fdf:	e8 b5 23 00 00       	callq  44399 <error_printf(int, int, char const*, ...)>
        error_vprintf(-1, COLOR_ERROR, format, val);
   41fe4:	4c 89 f9             	mov    %r15,%rcx
   41fe7:	4c 89 e2             	mov    %r12,%rdx
   41fea:	be 00 c0 00 00       	mov    $0xc000,%esi
   41fef:	bf ff ff ff ff       	mov    $0xffffffff,%edi
   41ff4:	e8 3f ff ff ff       	callq  41f38 <error_vprintf(int, int, char const*, __va_list_tag*)>
        if (CCOL(cursorpos)) {
   41ff9:	8b 05 fd 6f 07 00    	mov    0x76ffd(%rip),%eax        # b8ffc <cursorpos>
   41fff:	b9 50 00 00 00       	mov    $0x50,%ecx
   42004:	99                   	cltd   
   42005:	f7 f9                	idiv   %ecx
   42007:	85 d2                	test   %edx,%edx
   42009:	74 16                	je     42021 <vpanic(unsigned long, unsigned long, unsigned long, char const*, __va_list_tag*)+0x90>
            error_printf(-1, COLOR_ERROR, "\n");
   4200b:	ba b6 46 04 00       	mov    $0x446b6,%edx
   42010:	be 00 c0 00 00       	mov    $0xc000,%esi
   42015:	bf ff ff ff ff       	mov    $0xffffffff,%edi
   4201a:	b0 00                	mov    $0x0,%al
   4201c:	e8 78 23 00 00       	callq  44399 <error_printf(int, int, char const*, ...)>
    if (rip) {
   42021:	48 85 db             	test   %rbx,%rbx
   42024:	74 28                	je     4204e <vpanic(unsigned long, unsigned long, unsigned long, char const*, __va_list_tag*)+0xbd>
        if (lookup_symbol(rip, &name, nullptr)) {
   42026:	ba 00 00 00 00       	mov    $0x0,%edx
   4202b:	48 8d 75 c8          	lea    -0x38(%rbp),%rsi
   4202f:	48 89 df             	mov    %rbx,%rdi
   42032:	e8 82 fd ff ff       	callq  41db9 <lookup_symbol(unsigned long, char const**, unsigned long*)>
   42037:	84 c0                	test   %al,%al
   42039:	74 51                	je     4208c <vpanic(unsigned long, unsigned long, unsigned long, char const*, __va_list_tag*)+0xfb>
            error_printf("  #0  %p  <%s>\n", rip, name);
   4203b:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
   4203f:	48 89 de             	mov    %rbx,%rsi
   42042:	bf 2e 49 04 00       	mov    $0x4492e,%edi
   42047:	b0 00                	mov    $0x0,%al
   42049:	e8 85 23 00 00       	callq  443d3 <error_printf(char const*, ...)>
    error_print_backtrace(rsp, rbp);
   4204e:	4c 89 f6             	mov    %r14,%rsi
   42051:	4c 89 ef             	mov    %r13,%rdi
   42054:	e8 30 fe ff ff       	callq  41e89 <error_print_backtrace(unsigned long, unsigned long)>
}
   42059:	48 83 c4 18          	add    $0x18,%rsp
   4205d:	5b                   	pop    %rbx
   4205e:	41 5c                	pop    %r12
   42060:	41 5d                	pop    %r13
   42062:	41 5e                	pop    %r14
   42064:	41 5f                	pop    %r15
   42066:	5d                   	pop    %rbp
   42067:	c3                   	retq   
        error_printf(-1, COLOR_ERROR, "PANIC");
   42068:	ba 28 49 04 00       	mov    $0x44928,%edx
   4206d:	be 00 c0 00 00       	mov    $0xc000,%esi
   42072:	bf ff ff ff ff       	mov    $0xffffffff,%edi
   42077:	b0 00                	mov    $0x0,%al
   42079:	e8 1b 23 00 00       	callq  44399 <error_printf(int, int, char const*, ...)>
        log_printf("\n");
   4207e:	bf b6 46 04 00       	mov    $0x446b6,%edi
   42083:	b0 00                	mov    $0x0,%al
   42085:	e8 ed fc ff ff       	callq  41d77 <log_printf(char const*, ...)>
   4208a:	eb 95                	jmp    42021 <vpanic(unsigned long, unsigned long, unsigned long, char const*, __va_list_tag*)+0x90>
            error_printf("  #0  %p\n", rip);
   4208c:	48 89 de             	mov    %rbx,%rsi
   4208f:	bf 3e 49 04 00       	mov    $0x4493e,%edi
   42094:	b0 00                	mov    $0x0,%al
   42096:	e8 38 23 00 00       	callq  443d3 <error_printf(char const*, ...)>
   4209b:	eb b1                	jmp    4204e <vpanic(unsigned long, unsigned long, unsigned long, char const*, __va_list_tag*)+0xbd>

000000000004209d <assert_fail(char const*, int, char const*, char const*)>:
                 const char* description) {
   4209d:	f3 0f 1e fa          	endbr64 
   420a1:	55                   	push   %rbp
   420a2:	48 89 e5             	mov    %rsp,%rbp
   420a5:	41 55                	push   %r13
   420a7:	41 54                	push   %r12
   420a9:	53                   	push   %rbx
   420aa:	48 83 ec 08          	sub    $0x8,%rsp
   420ae:	48 89 fb             	mov    %rdi,%rbx
   420b1:	41 89 f4             	mov    %esi,%r12d
   420b4:	49 89 d5             	mov    %rdx,%r13
    cursorpos = CPOS(23, 0);
   420b7:	c7 05 3b 6f 07 00 30 	movl   $0x730,0x76f3b(%rip)        # b8ffc <cursorpos>
   420be:	07 00 00 
    if (description) {
   420c1:	48 85 c9             	test   %rcx,%rcx
   420c4:	74 11                	je     420d7 <assert_fail(char const*, int, char const*, char const*)+0x3a>
        error_printf("%s:%d: %s\n", file, line, description);
   420c6:	89 f2                	mov    %esi,%edx
   420c8:	48 89 fe             	mov    %rdi,%rsi
   420cb:	bf 48 49 04 00       	mov    $0x44948,%edi
   420d0:	b0 00                	mov    $0x0,%al
   420d2:	e8 fc 22 00 00       	callq  443d3 <error_printf(char const*, ...)>
    error_printf("%s:%d: kernel assertion '%s' failed\n", file, line, msg);
   420d7:	4c 89 e9             	mov    %r13,%rcx
   420da:	44 89 e2             	mov    %r12d,%edx
   420dd:	48 89 de             	mov    %rbx,%rsi
   420e0:	bf b0 4a 04 00       	mov    $0x44ab0,%edi
   420e5:	b0 00                	mov    $0x0,%al
   420e7:	e8 e7 22 00 00       	callq  443d3 <error_printf(char const*, ...)>
    return (rdeflags() & EFLAGS_IF) == 0;
}

__always_inline uintptr_t rdrbp() {
    uintptr_t x;
    asm volatile("movq %%rbp, %0" : "=r" (x));
   420ec:	48 89 ee             	mov    %rbp,%rsi
    return x;
}

__always_inline uintptr_t rdrsp() {
    uintptr_t x;
    asm volatile("movq %%rsp, %0" : "=r" (x));
   420ef:	48 89 e7             	mov    %rsp,%rdi
    error_print_backtrace(rdrsp(), rdrbp());
   420f2:	e8 92 fd ff ff       	callq  41e89 <error_print_backtrace(unsigned long, unsigned long)>
        check_keyboard();
   420f7:	e8 d4 08 00 00       	callq  429d0 <check_keyboard()>
    while (true) {
   420fc:	eb f9                	jmp    420f7 <assert_fail(char const*, int, char const*, char const*)+0x5a>

00000000000420fe <init_hardware()>:
void init_hardware() {
   420fe:	f3 0f 1e fa          	endbr64 
   42102:	55                   	push   %rbp
   42103:	48 89 e5             	mov    %rsp,%rbp
   42106:	53                   	push   %rbx
   42107:	48 83 ec 38          	sub    $0x38,%rsp
    stash_kernel_data(false);
   4210b:	bf 00 00 00 00       	mov    $0x0,%edi
   42110:	e8 7e f8 ff ff       	callq  41993 <stash_kernel_data(bool)>
    gdt_segments[0] = 0;
   42115:	48 c7 05 80 7f 01 00 	movq   $0x0,0x17f80(%rip)        # 5a0a0 <gdt_segments>
   4211c:	00 00 00 00 
    *segment = type
   42120:	48 b8 00 00 00 00 00 	movabs $0x20980000000000,%rax
   42127:	98 20 00 
   4212a:	48 89 05 77 7f 01 00 	mov    %rax,0x17f77(%rip)        # 5a0a8 <gdt_segments+0x8>
   42131:	48 b8 00 00 00 00 00 	movabs $0x920000000000,%rax
   42138:	92 00 00 
   4213b:	48 89 05 6e 7f 01 00 	mov    %rax,0x17f6e(%rip)        # 5a0b0 <gdt_segments+0x10>
    gdt.limit = sizeof(gdt_segments[0]) * 3 - 1;
   42142:	66 c7 45 c6 17 00    	movw   $0x17,-0x3a(%rbp)
    gdt.base = (uint64_t) gdt_segments;
   42148:	48 c7 45 c8 a0 a0 05 	movq   $0x5a0a0,-0x38(%rbp)
   4214f:	00 
    asm volatile("lgdt %0" : : "m" (gdt.limit));
   42150:	0f 01 55 c6          	lgdt   -0x3a(%rbp)
    memset(kernel_pagetable, 0, sizeof(kernel_pagetable));
   42154:	ba 00 50 00 00       	mov    $0x5000,%edx
   42159:	be 00 00 00 00       	mov    $0x0,%esi
   4215e:	bf 00 50 05 00       	mov    $0x55000,%edi
   42163:	e8 ef 16 00 00       	callq  43857 <memset>
        kptr2pa(&kernel_pagetable[1]) | PTE_P | PTE_W | PTE_U;
   42168:	b8 00 60 05 00       	mov    $0x56000,%eax
   4216d:	48 83 c8 07          	or     $0x7,%rax
   42171:	48 89 05 88 2e 01 00 	mov    %rax,0x12e88(%rip)        # 55000 <kernel_pagetable>
        kptr2pa(&kernel_pagetable[2]) | PTE_P | PTE_W | PTE_U;
   42178:	b8 00 70 05 00       	mov    $0x57000,%eax
   4217d:	48 83 c8 07          	or     $0x7,%rax
   42181:	48 89 05 78 3e 01 00 	mov    %rax,0x13e78(%rip)        # 56000 <kernel_pagetable+0x1000>
        kptr2pa(&kernel_pagetable[3]) | PTE_P | PTE_W | PTE_U;
   42188:	b8 00 80 05 00       	mov    $0x58000,%eax
   4218d:	48 83 c8 07          	or     $0x7,%rax
   42191:	48 89 05 68 4e 01 00 	mov    %rax,0x14e68(%rip)        # 57000 <kernel_pagetable+0x2000>
        kptr2pa(&kernel_pagetable[4]) | PTE_P | PTE_W | PTE_U;
   42198:	b8 00 90 05 00       	mov    $0x59000,%eax
   4219d:	48 83 c8 07          	or     $0x7,%rax
   421a1:	48 89 05 60 4e 01 00 	mov    %rax,0x14e60(%rip)        # 57008 <kernel_pagetable+0x2008>
    kernel_pagetable[1].entry[1] =
   421a8:	48 c7 05 55 3e 01 00 	movq   $0x40000083,0x13e55(%rip)        # 56008 <kernel_pagetable+0x1008>
   421af:	83 00 00 40 
    kernel_pagetable[1].entry[2] =
   421b3:	b8 83 00 00 80       	mov    $0x80000083,%eax
   421b8:	48 89 05 51 3e 01 00 	mov    %rax,0x13e51(%rip)        # 56010 <kernel_pagetable+0x1010>
    kernel_pagetable[1].entry[3] =
   421bf:	48 8d 80 00 00 00 40 	lea    0x40000000(%rax),%rax
   421c6:	48 89 05 4b 3e 01 00 	mov    %rax,0x13e4b(%rip)        # 56018 <kernel_pagetable+0x1018>
    : pt_(pt), pep_(&pt_->entry[0]), level_(3), perm_(initial_perm), va_(0) {
   421cd:	48 c7 45 d0 00 50 05 	movq   $0x55000,-0x30(%rbp)
   421d4:	00 
   421d5:	48 c7 45 d8 00 50 05 	movq   $0x55000,-0x28(%rbp)
   421dc:	00 
   421dd:	c7 45 e0 03 00 00 00 	movl   $0x3,-0x20(%rbp)
   421e4:	c7 45 e4 ff 0f 00 00 	movl   $0xfff,-0x1c(%rbp)
   421eb:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
   421f2:	00 
    real_find(va);
   421f3:	be 00 00 00 00       	mov    $0x0,%esi
   421f8:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
   421fc:	e8 27 f2 ff ff       	callq  41428 <vmiter::real_find(unsigned long)>
    return va_;
   42201:	48 8b 75 e8          	mov    -0x18(%rbp),%rsi
         it.va() < MEMSIZE_PHYSICAL;
   42205:	48 81 fe ff ff 1f 00 	cmp    $0x1fffff,%rsi
   4220c:	76 72                	jbe    42280 <init_hardware()+0x182>
    asm volatile("movq %0, %%cr3" : : "r" (x) : "memory");
   4220e:	b8 00 50 05 00       	mov    $0x55000,%eax
   42213:	0f 22 d8             	mov    %rax,%cr3
    cursorpos = 3 * CONSOLE_COLUMNS;
   42216:	c7 05 dc 6d 07 00 f0 	movl   $0xf0,0x76ddc(%rip)        # b8ffc <cursorpos>
   4221d:	00 00 00 
   42220:	ba 60 11 05 00       	mov    $0x51160,%edx
    for (int i = 0; i < 256; ++i) {
   42225:	be 00 00 00 00       	mov    $0x0,%esi
        | ((addr & 0x00000000FFFF0000UL) << 32);
   4222a:	49 b9 00 00 00 00 00 	movabs $0x600000000000,%r9
   42231:	60 00 00 
   42234:	49 b8 00 00 00 00 00 	movabs $0xffff000000000000,%r8
   4223b:	00 ff ff 
   4223e:	48 bf 00 00 08 00 00 	movabs $0x8e0000080000,%rdi
   42245:	8e 00 00 
   42248:	e9 f8 00 00 00       	jmpq   42345 <init_hardware()+0x247>
}
inline void vmiter::map(uintptr_t pa, int perm) {
    int r = try_map(pa, perm);
   4224d:	ba 07 00 00 00       	mov    $0x7,%edx
   42252:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
   42256:	e8 e5 f3 ff ff       	callq  41640 <vmiter::try_map(unsigned long, int)>
    assert(r == 0, "vmiter::map failed");
   4225b:	85 c0                	test   %eax,%eax
   4225d:	75 28                	jne    42287 <init_hardware()+0x189>
    return find(va_ + delta);
   4225f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   42263:	48 8d b0 00 10 00 00 	lea    0x1000(%rax),%rsi
    real_find(va);
   4226a:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
   4226e:	e8 b5 f1 ff ff       	callq  41428 <vmiter::real_find(unsigned long)>
    return va_;
   42273:	48 8b 75 e8          	mov    -0x18(%rbp),%rsi
         it.va() < MEMSIZE_PHYSICAL;
   42277:	48 81 fe ff ff 1f 00 	cmp    $0x1fffff,%rsi
   4227e:	77 8e                	ja     4220e <init_hardware()+0x110>
        if (it.va() != 0) {
   42280:	48 85 f6             	test   %rsi,%rsi
   42283:	74 da                	je     4225f <init_hardware()+0x161>
   42285:	eb c6                	jmp    4224d <init_hardware()+0x14f>
    assert(r == 0, "vmiter::map failed");
   42287:	b9 53 49 04 00       	mov    $0x44953,%ecx
   4228c:	ba 66 49 04 00       	mov    $0x44966,%edx
   42291:	be d3 00 00 00       	mov    $0xd3,%esi
   42296:	bf 6d 49 04 00       	mov    $0x4496d,%edi
   4229b:	e8 fd fd ff ff       	callq  4209d <assert_fail(char const*, int, char const*, char const*)>
    assert(cpuid(1).edx & (1 << 9));
   422a0:	b9 00 00 00 00       	mov    $0x0,%ecx
   422a5:	ba 79 49 04 00       	mov    $0x44979,%edx
   422aa:	be a6 00 00 00       	mov    $0xa6,%esi
   422af:	bf 91 49 04 00       	mov    $0x44991,%edi
   422b4:	e8 e4 fd ff ff       	callq  4209d <assert_fail(char const*, int, char const*, char const*)>
    assert(apic_base & IA32_APIC_BASE_ENABLED);
   422b9:	b9 00 00 00 00       	mov    $0x0,%ecx
   422be:	ba d8 4a 04 00       	mov    $0x44ad8,%edx
   422c3:	be a8 00 00 00       	mov    $0xa8,%esi
   422c8:	bf 91 49 04 00       	mov    $0x44991,%edi
   422cd:	e8 cb fd ff ff       	callq  4209d <assert_fail(char const*, int, char const*, char const*)>
    assert((apic_base & 0xFFFFFFFFF000) == lapicstate::lapic_pa);
   422d2:	b9 00 00 00 00       	mov    $0x0,%ecx
   422d7:	ba 00 4b 04 00       	mov    $0x44b00,%edx
   422dc:	be a9 00 00 00       	mov    $0xa9,%esi
   422e1:	bf 91 49 04 00       	mov    $0x44991,%edi
   422e6:	e8 b2 fd ff ff       	callq  4209d <assert_fail(char const*, int, char const*, char const*)>
    assert((ioapic_ver & 0xFF) == 0x11 || (ioapic_ver & 0xFF) == 0x20);
   422eb:	b9 00 00 00 00       	mov    $0x0,%ecx
   422f0:	ba 38 4b 04 00       	mov    $0x44b38,%edx
   422f5:	be ae 00 00 00       	mov    $0xae,%esi
   422fa:	bf 91 49 04 00       	mov    $0x44991,%edi
   422ff:	e8 99 fd ff ff       	callq  4209d <assert_fail(char const*, int, char const*, char const*)>
    assert((ioapic_ver >> 16) >= 0x17);
   42304:	b9 00 00 00 00       	mov    $0x0,%ecx
   42309:	ba 9f 49 04 00       	mov    $0x4499f,%edx
   4230e:	be af 00 00 00       	mov    $0xaf,%esi
   42313:	bf 91 49 04 00       	mov    $0x44991,%edi
   42318:	e8 80 fd ff ff       	callq  4209d <assert_fail(char const*, int, char const*, char const*)>
    gate->gd_low = (addr & 0x000000000000FFFFUL)
   4231d:	0f b7 c8             	movzwl %ax,%ecx
        | ((addr & 0x00000000FFFF0000UL) << 32);
   42320:	4c 09 c9             	or     %r9,%rcx
   42323:	49 89 c2             	mov    %rax,%r10
   42326:	49 c1 e2 20          	shl    $0x20,%r10
   4232a:	4d 21 c2             	and    %r8,%r10
   4232d:	4c 09 d1             	or     %r10,%rcx
   42330:	48 09 f9             	or     %rdi,%rcx
   42333:	48 89 0a             	mov    %rcx,(%rdx)
    gate->gd_high = addr >> 32;
   42336:	48 c1 e8 20          	shr    $0x20,%rax
   4233a:	48 89 42 08          	mov    %rax,0x8(%rdx)
    for (int i = 0; i < 256; ++i) {
   4233e:	83 c6 01             	add    $0x1,%esi
   42341:	48 83 c2 10          	add    $0x10,%rdx
        uintptr_t addr = interrupt_descriptors[i].gd_low;
   42345:	48 8b 02             	mov    (%rdx),%rax
        set_gate(&interrupt_descriptors[i], addr,
   42348:	83 fe 03             	cmp    $0x3,%esi
   4234b:	74 d0                	je     4231d <init_hardware()+0x21f>
        | ((addr & 0x00000000FFFF0000UL) << 32);
   4234d:	48 89 c1             	mov    %rax,%rcx
   42350:	48 c1 e1 20          	shl    $0x20,%rcx
   42354:	4c 21 c1             	and    %r8,%rcx
    gate->gd_low = (addr & 0x000000000000FFFFUL)
   42357:	44 0f b7 d0          	movzwl %ax,%r10d
        | ((addr & 0x00000000FFFF0000UL) << 32);
   4235b:	4c 09 d1             	or     %r10,%rcx
   4235e:	48 09 f9             	or     %rdi,%rcx
   42361:	48 89 0a             	mov    %rcx,(%rdx)
    gate->gd_high = addr >> 32;
   42364:	48 c1 e8 20          	shr    $0x20,%rax
   42368:	48 89 42 08          	mov    %rax,0x8(%rdx)
    for (int i = 0; i < 256; ++i) {
   4236c:	83 c6 01             	add    $0x1,%esi
   4236f:	48 83 c2 10          	add    $0x10,%rdx
   42373:	81 fe 00 01 00 00    	cmp    $0x100,%esi
   42379:	75 ca                	jne    42345 <init_hardware()+0x247>
__always_inline x86_64_cpuid_t cpuid(uint32_t leaf) {
    x86_64_cpuid_t ret;
    asm volatile("cpuid"
                 : "=a" (ret.eax), "=b" (ret.ebx),
                   "=c" (ret.ecx), "=d" (ret.edx)
                 : "a" (leaf));
   4237b:	b8 01 00 00 00       	mov    $0x1,%eax
   42380:	0f a2                	cpuid  
    assert(cpuid(1).edx & (1 << 9));
   42382:	f6 c6 02             	test   $0x2,%dh
   42385:	0f 84 15 ff ff ff    	je     422a0 <init_hardware()+0x1a2>
    return ret;
}

__always_inline uint64_t rdmsr(uint32_t msr) {
    uint64_t low, high;
    asm volatile("rdmsr" : "=a" (low), "=d" (high) : "c" (msr));
   4238b:	b9 1b 00 00 00       	mov    $0x1b,%ecx
   42390:	0f 32                	rdmsr  
    return low | (high << 32);
   42392:	48 c1 e2 20          	shl    $0x20,%rdx
   42396:	48 09 c2             	or     %rax,%rdx
    assert(apic_base & IA32_APIC_BASE_ENABLED);
   42399:	f6 c4 08             	test   $0x8,%ah
   4239c:	0f 84 17 ff ff ff    	je     422b9 <init_hardware()+0x1bb>
    assert((apic_base & 0xFFFFFFFFF000) == lapicstate::lapic_pa);
   423a2:	48 b9 00 f0 ff ff ff 	movabs $0xfffffffff000,%rcx
   423a9:	ff 00 00 
   423ac:	48 21 ca             	and    %rcx,%rdx
   423af:	b8 00 00 e0 fe       	mov    $0xfee00000,%eax
   423b4:	48 39 c2             	cmp    %rax,%rdx
   423b7:	0f 85 15 ff ff ff    	jne    422d2 <init_hardware()+0x1d4>
inline void ioapicstate::disable_irq(int entry) {
    write(reg_redtbl + 2 * entry, redtbl_masked);
    write(reg_redtbl + 2 * entry + 1, 0);
}
inline uint32_t ioapicstate::read(int reg) const {
    reg_[0].v = reg;
   423bd:	b8 00 00 c0 fe       	mov    $0xfec00000,%eax
   423c2:	c7 00 01 00 00 00    	movl   $0x1,(%rax)
    return reg_[1].v;
   423c8:	8b 40 10             	mov    0x10(%rax),%eax
    assert((ioapic_ver & 0xFF) == 0x11 || (ioapic_ver & 0xFF) == 0x20);
   423cb:	0f b6 d0             	movzbl %al,%edx
   423ce:	3c 20                	cmp    $0x20,%al
   423d0:	74 09                	je     423db <init_hardware()+0x2dd>
   423d2:	83 fa 11             	cmp    $0x11,%edx
   423d5:	0f 85 10 ff ff ff    	jne    422eb <init_hardware()+0x1ed>
    assert((ioapic_ver >> 16) >= 0x17);
   423db:	3d ff ff 16 00       	cmp    $0x16ffff,%eax
   423e0:	0f 86 1e ff ff ff    	jbe    42304 <init_hardware()+0x206>
    asm volatile("outb %0, %w1" : : "a" (data), "d" (port));
   423e6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   423eb:	ba 21 00 00 00       	mov    $0x21,%edx
   423f0:	ee                   	out    %al,(%dx)
   423f1:	ba a1 00 00 00       	mov    $0xa1,%edx
   423f6:	ee                   	out    %al,(%dx)
    for (auto fp = __init_array_start; fp != __init_array_end; ++fp) {
   423f7:	b8 d0 57 04 00       	mov    $0x457d0,%eax
   423fc:	48 3d d8 57 04 00    	cmp    $0x457d8,%rax
   42402:	74 12                	je     42416 <init_hardware()+0x318>
   42404:	48 89 c3             	mov    %rax,%rbx
        (*fp)();
   42407:	ff 13                	callq  *(%rbx)
    for (auto fp = __init_array_start; fp != __init_array_end; ++fp) {
   42409:	48 83 c3 08          	add    $0x8,%rbx
   4240d:	48 81 fb d8 57 04 00 	cmp    $0x457d8,%rbx
   42414:	75 f1                	jne    42407 <init_hardware()+0x309>
    gdt_segments[0] = 0;
   42416:	48 c7 05 7f 7c 01 00 	movq   $0x0,0x17c7f(%rip)        # 5a0a0 <gdt_segments>
   4241d:	00 00 00 00 
    *segment = type
   42421:	48 b8 00 00 00 00 00 	movabs $0x20980000000000,%rax
   42428:	98 20 00 
   4242b:	48 89 05 76 7c 01 00 	mov    %rax,0x17c76(%rip)        # 5a0a8 <gdt_segments+0x8>
   42432:	48 b8 00 00 00 00 00 	movabs $0x920000000000,%rax
   42439:	92 00 00 
   4243c:	48 89 05 6d 7c 01 00 	mov    %rax,0x17c6d(%rip)        # 5a0b0 <gdt_segments+0x10>
   42443:	48 b8 00 00 00 00 00 	movabs $0x20f80000000000,%rax
   4244a:	f8 20 00 
   4244d:	48 89 05 64 7c 01 00 	mov    %rax,0x17c64(%rip)        # 5a0b8 <gdt_segments+0x18>
   42454:	48 b8 00 00 00 00 00 	movabs $0xf20000000000,%rax
   4245b:	f2 00 00 
   4245e:	48 89 05 5b 7c 01 00 	mov    %rax,0x17c5b(%rip)        # 5a0c0 <gdt_segments+0x20>
    set_sys_segment(&gdt_segments[SEGSEL_TASKSTATE >> 3],
   42465:	ba 20 a0 05 00       	mov    $0x5a020,%edx
    segment[0] = ((addr & 0x0000000000FFFFFFUL) << 16)
   4246a:	48 89 d0             	mov    %rdx,%rax
   4246d:	48 c1 e0 10          	shl    $0x10,%rax
   42471:	48 b9 00 00 ff ff ff 	movabs $0xffffff0000,%rcx
   42478:	00 00 00 
   4247b:	48 21 c8             	and    %rcx,%rax
        | ((addr & 0x00000000FF000000UL) << 32)
   4247e:	48 89 d1             	mov    %rdx,%rcx
   42481:	48 c1 e1 20          	shl    $0x20,%rcx
   42485:	48 be 00 00 00 00 00 	movabs $0xff00000000000000,%rsi
   4248c:	00 00 ff 
   4248f:	48 21 f1             	and    %rsi,%rcx
   42492:	48 09 c8             	or     %rcx,%rax
        | X86SEG_P;                   // segment present
   42495:	48 b9 67 00 00 00 00 	movabs $0x890000000067,%rcx
   4249c:	89 00 00 
   4249f:	48 09 c8             	or     %rcx,%rax
   424a2:	48 89 05 1f 7c 01 00 	mov    %rax,0x17c1f(%rip)        # 5a0c8 <gdt_segments+0x28>
    segment[1] = addr >> 32;
   424a9:	48 c1 ea 20          	shr    $0x20,%rdx
   424ad:	48 89 15 1c 7c 01 00 	mov    %rdx,0x17c1c(%rip)        # 5a0d0 <gdt_segments+0x30>
    memset(&taskstate, 0, sizeof(taskstate));
   424b4:	ba 68 00 00 00       	mov    $0x68,%edx
   424b9:	be 00 00 00 00       	mov    $0x0,%esi
   424be:	bf 20 a0 05 00       	mov    $0x5a020,%edi
   424c3:	e8 8f 13 00 00       	callq  43857 <memset>
    taskstate.ts_rsp[0] = KERNEL_STACK_TOP;
   424c8:	48 c7 05 51 7b 01 00 	movq   $0x80000,0x17b51(%rip)        # 5a024 <taskstate+0x4>
   424cf:	00 00 08 00 
    gdt.limit = sizeof(gdt_segments) - 1;
   424d3:	66 c7 45 c6 37 00    	movw   $0x37,-0x3a(%rbp)
    gdt.base = (uint64_t) gdt_segments;
   424d9:	48 c7 45 c8 a0 a0 05 	movq   $0x5a0a0,-0x38(%rbp)
   424e0:	00 
    idt.limit = sizeof(interrupt_descriptors) - 1;
   424e1:	66 c7 45 d6 ff 0f    	movw   $0xfff,-0x2a(%rbp)
    idt.base = (uint64_t) interrupt_descriptors;
   424e7:	48 c7 45 d8 60 11 05 	movq   $0x51160,-0x28(%rbp)
   424ee:	00 
                 : "memory", "cc");
   424ef:	b8 28 00 00 00       	mov    $0x28,%eax
   424f4:	0f 01 55 c6          	lgdt   -0x3a(%rbp)
   424f8:	0f 00 d8             	ltr    %ax
   424fb:	0f 01 5d d6          	lidt   -0x2a(%rbp)
                 : : "a" ((uint16_t) SEGSEL_KERN_DATA));
   424ff:	b8 10 00 00 00       	mov    $0x10,%eax
   42504:	8e e0                	mov    %eax,%fs
   42506:	8e e8                	mov    %eax,%gs
    asm volatile("movq %%cr0, %0" : "=r" (x));
   42508:	0f 20 c0             	mov    %cr0,%rax
    wrcr0(cr0);
   4250b:	0d 23 00 05 80       	or     $0x80050023,%eax
    asm volatile("movq %0, %%cr0" : : "r" (x));
   42510:	0f 22 c0             	mov    %rax,%cr0
}
__always_inline void wrmsr(uint32_t msr, uint64_t x) {
    asm volatile("wrmsr" : : "c" (msr), "a" ((uint32_t) x), "d" (x >> 32));
   42513:	b9 81 00 00 c0       	mov    $0xc0000081,%ecx
   42518:	b8 00 00 00 00       	mov    $0x0,%eax
   4251d:	ba 08 00 18 00       	mov    $0x180008,%edx
   42522:	0f 30                	wrmsr  
    wrmsr(MSR_IA32_LSTAR, reinterpret_cast<uint64_t>(syscall_entry));
   42524:	b8 d6 0a 04 00       	mov    $0x40ad6,%eax
   42529:	48 89 c2             	mov    %rax,%rdx
   4252c:	48 c1 ea 20          	shr    $0x20,%rdx
   42530:	b9 82 00 00 c0       	mov    $0xc0000082,%ecx
   42535:	0f 30                	wrmsr  
   42537:	b9 84 00 00 c0       	mov    $0xc0000084,%ecx
   4253c:	b8 00 77 04 00       	mov    $0x47700,%eax
   42541:	ba 00 00 00 00       	mov    $0x0,%edx
   42546:	0f 30                	wrmsr  
    return reg_[reg].v;
   42548:	b8 00 00 e0 fe       	mov    $0xfee00000,%eax
   4254d:	8b 90 f0 00 00 00    	mov    0xf0(%rax),%edx
    write(reg_svr, (read(reg_svr) & ~0xFF) | 0x100 | vector);
   42553:	81 e2 00 fe ff ff    	and    $0xfffffe00,%edx
   42559:	81 ca 3f 01 00 00    	or     $0x13f,%edx
    reg_[reg].v = v;
   4255f:	89 90 f0 00 00 00    	mov    %edx,0xf0(%rax)
   42565:	c7 80 e0 03 00 00 0b 	movl   $0xb,0x3e0(%rax)
   4256c:	00 00 00 
   4256f:	c7 80 20 03 00 00 20 	movl   $0x20020,0x320(%rax)
   42576:	00 02 00 
   42579:	c7 80 80 03 00 00 00 	movl   $0x0,0x380(%rax)
   42580:	00 00 00 
   42583:	c7 80 50 03 00 00 00 	movl   $0x10000,0x350(%rax)
   4258a:	00 01 00 
   4258d:	c7 80 60 03 00 00 00 	movl   $0x10000,0x360(%rax)
   42594:	00 01 00 
   42597:	c7 80 70 03 00 00 33 	movl   $0x33,0x370(%rax)
   4259e:	00 00 00 
   425a1:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%rax)
   425a8:	00 00 00 
    return reg_[reg].v;
   425ab:	8b 90 80 02 00 00    	mov    0x280(%rax),%edx
    reg_[reg].v = v;
   425b1:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%rax)
   425b8:	00 00 00 
}
   425bb:	48 83 c4 38          	add    $0x38,%rsp
   425bf:	5b                   	pop    %rbx
   425c0:	5d                   	pop    %rbp
   425c1:	c3                   	retq   

00000000000425c2 <check_pagetable(x86_64_pagetable*)>:
void check_pagetable(x86_64_pagetable* pagetable) {
   425c2:	f3 0f 1e fa          	endbr64 
   425c6:	55                   	push   %rbp
   425c7:	48 89 e5             	mov    %rsp,%rbp
   425ca:	53                   	push   %rbx
   425cb:	48 83 ec 28          	sub    $0x28,%rsp
    assert(((uintptr_t) pagetable % PAGESIZE) == 0); // must be page aligned
   425cf:	f7 c7 ff 0f 00 00    	test   $0xfff,%edi
   425d5:	0f 85 85 01 00 00    	jne    42760 <check_pagetable(x86_64_pagetable*)+0x19e>
   425db:	48 89 fb             	mov    %rdi,%rbx
    : pt_(pt), pep_(&pt_->entry[0]), level_(3), perm_(initial_perm), va_(0) {
   425de:	48 89 7d d0          	mov    %rdi,-0x30(%rbp)
   425e2:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
   425e6:	c7 45 e0 03 00 00 00 	movl   $0x3,-0x20(%rbp)
   425ed:	c7 45 e4 ff 0f 00 00 	movl   $0xfff,-0x1c(%rbp)
   425f4:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
   425fb:	00 
    real_find(va);
   425fc:	be 72 0a 04 00       	mov    $0x40a72,%esi
   42601:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
   42605:	e8 1e ee ff ff       	callq  41428 <vmiter::real_find(unsigned long)>
    if (*pep_ & PTE_P) {
   4260a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   4260e:	48 8b 30             	mov    (%rax),%rsi
   42611:	40 f6 c6 01          	test   $0x1,%sil
   42615:	0f 84 73 01 00 00    	je     4278e <check_pagetable(x86_64_pagetable*)+0x1cc>
        if (level_ > 0) {
   4261b:	8b 4d e0             	mov    -0x20(%rbp),%ecx
            pa &= ~0x1000UL;
   4261e:	48 b8 00 e0 ff ff ff 	movabs $0xfffffffffe000,%rax
   42625:	ff 0f 00 
   42628:	48 21 f0             	and    %rsi,%rax
   4262b:	48 89 c2             	mov    %rax,%rdx
        if (level_ > 0) {
   4262e:	85 c9                	test   %ecx,%ecx
   42630:	0f 8e 43 01 00 00    	jle    42779 <check_pagetable(x86_64_pagetable*)+0x1b7>
    return (1UL << (PAGEOFFBITS + level * PAGEINDEXBITS)) - 1;
   42636:	8d 4c c9 0c          	lea    0xc(%rcx,%rcx,8),%ecx
        return pa + (va_ & pageoffmask(level_));
   4263a:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   42641:	48 d3 e0             	shl    %cl,%rax
   42644:	48 f7 d0             	not    %rax
   42647:	48 23 45 e8          	and    -0x18(%rbp),%rax
   4264b:	48 01 d0             	add    %rdx,%rax
    assert(vmiter(pagetable, (uintptr_t) exception_entry).pa()
   4264e:	ba 72 0a 04 00       	mov    $0x40a72,%edx
   42653:	48 39 c2             	cmp    %rax,%rdx
   42656:	0f 85 32 01 00 00    	jne    4278e <check_pagetable(x86_64_pagetable*)+0x1cc>
    : pt_(pt), pep_(&pt_->entry[0]), level_(3), perm_(initial_perm), va_(0) {
   4265c:	48 c7 45 d0 00 50 05 	movq   $0x55000,-0x30(%rbp)
   42663:	00 
   42664:	48 c7 45 d8 00 50 05 	movq   $0x55000,-0x28(%rbp)
   4266b:	00 
   4266c:	c7 45 e0 03 00 00 00 	movl   $0x3,-0x20(%rbp)
   42673:	c7 45 e4 ff 0f 00 00 	movl   $0xfff,-0x1c(%rbp)
   4267a:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
   42681:	00 
    real_find(va);
   42682:	48 89 de             	mov    %rbx,%rsi
   42685:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
   42689:	e8 9a ed ff ff       	callq  41428 <vmiter::real_find(unsigned long)>
    if (*pep_ & PTE_P) {
   4268e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   42692:	48 8b 30             	mov    (%rax),%rsi
   42695:	40 f6 c6 01          	test   $0x1,%sil
   42699:	0f 84 1d 01 00 00    	je     427bc <check_pagetable(x86_64_pagetable*)+0x1fa>
        if (level_ > 0) {
   4269f:	8b 4d e0             	mov    -0x20(%rbp),%ecx
            pa &= ~0x1000UL;
   426a2:	48 b8 00 e0 ff ff ff 	movabs $0xfffffffffe000,%rax
   426a9:	ff 0f 00 
   426ac:	48 21 f0             	and    %rsi,%rax
   426af:	48 89 c2             	mov    %rax,%rdx
        if (level_ > 0) {
   426b2:	85 c9                	test   %ecx,%ecx
   426b4:	0f 8e ed 00 00 00    	jle    427a7 <check_pagetable(x86_64_pagetable*)+0x1e5>
   426ba:	8d 4c c9 0c          	lea    0xc(%rcx,%rcx,8),%ecx
        return pa + (va_ & pageoffmask(level_));
   426be:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   426c5:	48 d3 e0             	shl    %cl,%rax
   426c8:	48 f7 d0             	not    %rax
   426cb:	48 23 45 e8          	and    -0x18(%rbp),%rax
   426cf:	48 01 d0             	add    %rdx,%rax
    assert(vmiter(kernel_pagetable, (uintptr_t) pagetable).pa()
   426d2:	48 39 c3             	cmp    %rax,%rbx
   426d5:	0f 85 e1 00 00 00    	jne    427bc <check_pagetable(x86_64_pagetable*)+0x1fa>
    : pt_(pt), pep_(&pt_->entry[0]), level_(3), perm_(initial_perm), va_(0) {
   426db:	48 89 5d d0          	mov    %rbx,-0x30(%rbp)
   426df:	48 89 5d d8          	mov    %rbx,-0x28(%rbp)
   426e3:	c7 45 e0 03 00 00 00 	movl   $0x3,-0x20(%rbp)
   426ea:	c7 45 e4 ff 0f 00 00 	movl   $0xfff,-0x1c(%rbp)
   426f1:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
   426f8:	00 
    real_find(va);
   426f9:	be 00 50 05 00       	mov    $0x55000,%esi
   426fe:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
   42702:	e8 21 ed ff ff       	callq  41428 <vmiter::real_find(unsigned long)>
    if (*pep_ & PTE_P) {
   42707:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   4270b:	48 8b 30             	mov    (%rax),%rsi
   4270e:	40 f6 c6 01          	test   $0x1,%sil
   42712:	0f 84 d2 00 00 00    	je     427ea <check_pagetable(x86_64_pagetable*)+0x228>
        if (level_ > 0) {
   42718:	8b 4d e0             	mov    -0x20(%rbp),%ecx
            pa &= ~0x1000UL;
   4271b:	48 b8 00 e0 ff ff ff 	movabs $0xfffffffffe000,%rax
   42722:	ff 0f 00 
   42725:	48 21 f0             	and    %rsi,%rax
   42728:	48 89 c2             	mov    %rax,%rdx
        if (level_ > 0) {
   4272b:	85 c9                	test   %ecx,%ecx
   4272d:	0f 8e a2 00 00 00    	jle    427d5 <check_pagetable(x86_64_pagetable*)+0x213>
   42733:	8d 4c c9 0c          	lea    0xc(%rcx,%rcx,8),%ecx
        return pa + (va_ & pageoffmask(level_));
   42737:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   4273e:	48 d3 e0             	shl    %cl,%rax
   42741:	48 f7 d0             	not    %rax
   42744:	48 23 45 e8          	and    -0x18(%rbp),%rax
   42748:	48 01 d0             	add    %rdx,%rax
    assert(vmiter(pagetable, (uintptr_t) kernel_pagetable).pa()
   4274b:	ba 00 50 05 00       	mov    $0x55000,%edx
   42750:	48 39 c2             	cmp    %rax,%rdx
   42753:	0f 85 91 00 00 00    	jne    427ea <check_pagetable(x86_64_pagetable*)+0x228>
}
   42759:	48 83 c4 28          	add    $0x28,%rsp
   4275d:	5b                   	pop    %rbx
   4275e:	5d                   	pop    %rbp
   4275f:	c3                   	retq   
    assert(((uintptr_t) pagetable % PAGESIZE) == 0); // must be page aligned
   42760:	b9 00 00 00 00       	mov    $0x0,%ecx
   42765:	ba 78 4b 04 00       	mov    $0x44b78,%edx
   4276a:	be 30 01 00 00       	mov    $0x130,%esi
   4276f:	bf 91 49 04 00       	mov    $0x44991,%edi
   42774:	e8 24 f9 ff ff       	callq  4209d <assert_fail(char const*, int, char const*, char const*)>
        uintptr_t pa = *pep_ & PTE_PAMASK;
   42779:	48 b8 00 f0 ff ff ff 	movabs $0xffffffffff000,%rax
   42780:	ff 0f 00 
   42783:	48 89 f2             	mov    %rsi,%rdx
   42786:	48 21 c2             	and    %rax,%rdx
   42789:	e9 a8 fe ff ff       	jmpq   42636 <check_pagetable(x86_64_pagetable*)+0x74>
    assert(vmiter(pagetable, (uintptr_t) exception_entry).pa()
   4278e:	b9 00 00 00 00       	mov    $0x0,%ecx
   42793:	ba a0 4b 04 00       	mov    $0x44ba0,%edx
   42798:	be 31 01 00 00       	mov    $0x131,%esi
   4279d:	bf 91 49 04 00       	mov    $0x44991,%edi
   427a2:	e8 f6 f8 ff ff       	callq  4209d <assert_fail(char const*, int, char const*, char const*)>
   427a7:	48 b8 00 f0 ff ff ff 	movabs $0xffffffffff000,%rax
   427ae:	ff 0f 00 
   427b1:	48 89 f2             	mov    %rsi,%rdx
   427b4:	48 21 c2             	and    %rax,%rdx
   427b7:	e9 fe fe ff ff       	jmpq   426ba <check_pagetable(x86_64_pagetable*)+0xf8>
    assert(vmiter(kernel_pagetable, (uintptr_t) pagetable).pa()
   427bc:	b9 00 00 00 00       	mov    $0x0,%ecx
   427c1:	ba f0 4b 04 00       	mov    $0x44bf0,%edx
   427c6:	be 33 01 00 00       	mov    $0x133,%esi
   427cb:	bf 91 49 04 00       	mov    $0x44991,%edi
   427d0:	e8 c8 f8 ff ff       	callq  4209d <assert_fail(char const*, int, char const*, char const*)>
   427d5:	48 b8 00 f0 ff ff ff 	movabs $0xffffffffff000,%rax
   427dc:	ff 0f 00 
   427df:	48 89 f2             	mov    %rsi,%rdx
   427e2:	48 21 c2             	and    %rax,%rdx
   427e5:	e9 49 ff ff ff       	jmpq   42733 <check_pagetable(x86_64_pagetable*)+0x171>
    assert(vmiter(pagetable, (uintptr_t) kernel_pagetable).pa()
   427ea:	b9 00 00 00 00       	mov    $0x0,%ecx
   427ef:	ba 40 4c 04 00       	mov    $0x44c40,%edx
   427f4:	be 35 01 00 00       	mov    $0x135,%esi
   427f9:	bf 91 49 04 00       	mov    $0x44991,%edi
   427fe:	e8 9a f8 ff ff       	callq  4209d <assert_fail(char const*, int, char const*, char const*)>
   42803:	90                   	nop

0000000000042804 <pcistate::next(int) const>:
int pcistate::next(int addr) const {
   42804:	f3 0f 1e fa          	endbr64 
   42808:	55                   	push   %rbp
   42809:	48 89 e5             	mov    %rsp,%rbp
    }
    return addr;
}

inline uint32_t pcistate::readl(int addr) const {
    assert(addr >= 0 && !(addr & 3));
   4280c:	89 f0                	mov    %esi,%eax
   4280e:	83 c0 0c             	add    $0xc,%eax
   42811:	78 23                	js     42836 <pcistate::next(int) const+0x32>
   42813:	a8 03                	test   $0x3,%al
   42815:	75 1f                	jne    42836 <pcistate::next(int) const+0x32>
    outl(reg_host_bridge_config_addr, 0x80000000U | addr);
   42817:	0d 00 00 00 80       	or     $0x80000000,%eax
    asm volatile("outl %0, %w1" : : "a" (data), "d" (port));
   4281c:	ba f8 0c 00 00       	mov    $0xcf8,%edx
   42821:	ef                   	out    %eax,(%dx)
    asm volatile("inl %w1, %0" : "=a" (data) : "d" (port));
   42822:	ba fc 0c 00 00       	mov    $0xcfc,%edx
   42827:	ed                   	in     (%dx),%eax
   42828:	89 c2                	mov    %eax,%edx
    asm volatile("outl %0, %w1" : : "a" (data), "d" (port));
   4282a:	bf f8 0c 00 00       	mov    $0xcf8,%edi
    asm volatile("inl %w1, %0" : "=a" (data) : "d" (port));
   4282f:	b9 fc 0c 00 00       	mov    $0xcfc,%ecx
   42834:	eb 5b                	jmp    42891 <pcistate::next(int) const+0x8d>
    assert(addr >= 0 && !(addr & 3));
   42836:	b9 00 00 00 00       	mov    $0x0,%ecx
   4283b:	ba dc 49 04 00       	mov    $0x449dc,%edx
   42840:	be 57 00 00 00       	mov    $0x57,%esi
   42845:	bf d3 49 04 00       	mov    $0x449d3,%edi
   4284a:	e8 4e f8 ff ff       	callq  4209d <assert_fail(char const*, int, char const*, char const*)>
    assert(addr >= 0 && addr < 0x1000000);
   4284f:	b9 00 00 00 00       	mov    $0x0,%ecx
   42854:	ba f5 49 04 00       	mov    $0x449f5,%edx
   42859:	be 4a 00 00 00       	mov    $0x4a,%esi
   4285e:	bf d3 49 04 00       	mov    $0x449d3,%edi
   42863:	e8 35 f8 ff ff       	callq  4209d <assert_fail(char const*, int, char const*, char const*)>
            addr += make_addr(0, 0, 1);
   42868:	81 c6 00 01 00 00    	add    $0x100,%esi
        if (addr >= addr_end) {
   4286e:	81 fe ff ff 07 00    	cmp    $0x7ffff,%esi
   42874:	7f 5d                	jg     428d3 <pcistate::next(int) const+0xcf>
        x = readl(addr + config_lthb);
   42876:	8d 46 0c             	lea    0xc(%rsi),%eax
    assert(addr >= 0 && !(addr & 3));
   42879:	40 f6 c6 03          	test   $0x3,%sil
   4287d:	75 37                	jne    428b6 <pcistate::next(int) const+0xb2>
    outl(reg_host_bridge_config_addr, 0x80000000U | addr);
   4287f:	0d 00 00 00 80       	or     $0x80000000,%eax
    asm volatile("outl %0, %w1" : : "a" (data), "d" (port));
   42884:	89 fa                	mov    %edi,%edx
   42886:	ef                   	out    %eax,(%dx)
    asm volatile("inl %w1, %0" : "=a" (data) : "d" (port));
   42887:	89 ca                	mov    %ecx,%edx
   42889:	ed                   	in     (%dx),%eax
   4288a:	89 c2                	mov    %eax,%edx
        if (x != uint32_t(-1)) {
   4288c:	83 f8 ff             	cmp    $0xffffffff,%eax
   4288f:	75 3e                	jne    428cf <pcistate::next(int) const+0xcb>
    assert(addr >= 0 && addr < 0x1000000);
   42891:	81 fe ff ff ff 00    	cmp    $0xffffff,%esi
   42897:	77 b6                	ja     4284f <pcistate::next(int) const+0x4b>
            && (x == uint32_t(-1) || !(x & 0x800000))) {
   42899:	f7 c6 00 07 00 00    	test   $0x700,%esi
   4289f:	75 c7                	jne    42868 <pcistate::next(int) const+0x64>
   428a1:	83 fa ff             	cmp    $0xffffffff,%edx
   428a4:	74 08                	je     428ae <pcistate::next(int) const+0xaa>
   428a6:	f7 c2 00 00 80 00    	test   $0x800000,%edx
   428ac:	75 ba                	jne    42868 <pcistate::next(int) const+0x64>
            addr += make_addr(0, 1, 0);
   428ae:	81 c6 00 08 00 00    	add    $0x800,%esi
   428b4:	eb b8                	jmp    4286e <pcistate::next(int) const+0x6a>
    assert(addr >= 0 && !(addr & 3));
   428b6:	b9 00 00 00 00       	mov    $0x0,%ecx
   428bb:	ba dc 49 04 00       	mov    $0x449dc,%edx
   428c0:	be 57 00 00 00       	mov    $0x57,%esi
   428c5:	bf d3 49 04 00       	mov    $0x449d3,%edi
   428ca:	e8 ce f7 ff ff       	callq  4209d <assert_fail(char const*, int, char const*, char const*)>
   428cf:	89 f0                	mov    %esi,%eax
   428d1:	eb 05                	jmp    428d8 <pcistate::next(int) const+0xd4>
            return -1;
   428d3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
   428d8:	5d                   	pop    %rbp
   428d9:	c3                   	retq   

00000000000428da <poweroff()>:
void poweroff() {
   428da:	f3 0f 1e fa          	endbr64 
   428de:	55                   	push   %rbp
   428df:	48 89 e5             	mov    %rsp,%rbp
   428e2:	53                   	push   %rbx
   428e3:	48 83 ec 08          	sub    $0x8,%rsp
    asm volatile("outl %0, %w1" : : "a" (data), "d" (port));
   428e7:	b8 00 00 00 80       	mov    $0x80000000,%eax
   428ec:	ba f8 0c 00 00       	mov    $0xcf8,%edx
   428f1:	ef                   	out    %eax,(%dx)
    asm volatile("inl %w1, %0" : "=a" (data) : "d" (port));
   428f2:	b8 fc 0c 00 00       	mov    $0xcfc,%eax
   428f7:	89 c2                	mov    %eax,%edx
   428f9:	ed                   	in     (%dx),%eax
    while (addr >= 0 && !predicate(addr)) {
   428fa:	3d 86 80 18 29       	cmp    $0x29188086,%eax
   428ff:	0f 84 c4 00 00 00    	je     429c9 <poweroff()+0xef>
   42905:	3d 86 80 13 71       	cmp    $0x71138086,%eax
   4290a:	0f 84 b9 00 00 00    	je     429c9 <poweroff()+0xef>
   42910:	be 00 00 00 00       	mov    $0x0,%esi
    asm volatile("outl %0, %w1" : : "a" (data), "d" (port));
   42915:	bb f8 0c 00 00       	mov    $0xcf8,%ebx
        addr = next(addr);
   4291a:	bf 00 a0 05 00       	mov    $0x5a000,%edi
   4291f:	e8 e0 fe ff ff       	callq  42804 <pcistate::next(int) const>
   42924:	89 c6                	mov    %eax,%esi
    while (addr >= 0 && !predicate(addr)) {
   42926:	85 c0                	test   %eax,%eax
   42928:	78 52                	js     4297c <poweroff()+0xa2>
    assert(addr >= 0 && !(addr & 3));
   4292a:	40 f6 c6 03          	test   $0x3,%sil
   4292e:	75 67                	jne    42997 <poweroff()+0xbd>
    outl(reg_host_bridge_config_addr, 0x80000000U | addr);
   42930:	89 f0                	mov    %esi,%eax
   42932:	0d 00 00 00 80       	or     $0x80000000,%eax
   42937:	89 da                	mov    %ebx,%edx
   42939:	ef                   	out    %eax,(%dx)
    asm volatile("inl %w1, %0" : "=a" (data) : "d" (port));
   4293a:	b8 fc 0c 00 00       	mov    $0xcfc,%eax
   4293f:	89 c2                	mov    %eax,%edx
   42941:	ed                   	in     (%dx),%eax
    while (addr >= 0 && !predicate(addr)) {
   42942:	3d 86 80 13 71       	cmp    $0x71138086,%eax
   42947:	74 07                	je     42950 <poweroff()+0x76>
   42949:	3d 86 80 18 29       	cmp    $0x29188086,%eax
   4294e:	75 ca                	jne    4291a <poweroff()+0x40>
        int pm_io_base = pci.readl(addr + 0x40) & 0xFFC0;
   42950:	8d 46 40             	lea    0x40(%rsi),%eax
    assert(addr >= 0 && !(addr & 3));
   42953:	40 f6 c6 03          	test   $0x3,%sil
   42957:	75 57                	jne    429b0 <poweroff()+0xd6>
    outl(reg_host_bridge_config_addr, 0x80000000U | addr);
   42959:	0d 00 00 00 80       	or     $0x80000000,%eax
    asm volatile("outl %0, %w1" : : "a" (data), "d" (port));
   4295e:	ba f8 0c 00 00       	mov    $0xcf8,%edx
   42963:	ef                   	out    %eax,(%dx)
    asm volatile("inl %w1, %0" : "=a" (data) : "d" (port));
   42964:	ba fc 0c 00 00       	mov    $0xcfc,%edx
   42969:	ed                   	in     (%dx),%eax
   4296a:	89 c2                	mov    %eax,%edx
   4296c:	81 e2 c0 ff 00 00    	and    $0xffc0,%edx
        outw(pm_io_base + 4, 0x2000);
   42972:	83 c2 04             	add    $0x4,%edx
    asm volatile("outw %0, %w1" : : "a" (data), "d" (port));
   42975:	b8 00 20 00 00       	mov    $0x2000,%eax
   4297a:	66 ef                	out    %ax,(%dx)
    console_printf(CPOS(24, 0), 0xC000, "Cannot power off!\n");
   4297c:	ba 13 4a 04 00       	mov    $0x44a13,%edx
   42981:	be 00 c0 00 00       	mov    $0xc000,%esi
   42986:	bf 80 07 00 00       	mov    $0x780,%edi
   4298b:	b8 00 00 00 00       	mov    $0x0,%eax
   42990:	e8 ca 19 00 00       	callq  4435f <console_printf(int, int, char const*, ...)>
    while (true) {
   42995:	eb fe                	jmp    42995 <poweroff()+0xbb>
    assert(addr >= 0 && !(addr & 3));
   42997:	b9 00 00 00 00       	mov    $0x0,%ecx
   4299c:	ba dc 49 04 00       	mov    $0x449dc,%edx
   429a1:	be 57 00 00 00       	mov    $0x57,%esi
   429a6:	bf d3 49 04 00       	mov    $0x449d3,%edi
   429ab:	e8 ed f6 ff ff       	callq  4209d <assert_fail(char const*, int, char const*, char const*)>
   429b0:	b9 00 00 00 00       	mov    $0x0,%ecx
   429b5:	ba dc 49 04 00       	mov    $0x449dc,%edx
   429ba:	be 57 00 00 00       	mov    $0x57,%esi
   429bf:	bf d3 49 04 00       	mov    $0x449d3,%edi
   429c4:	e8 d4 f6 ff ff       	callq  4209d <assert_fail(char const*, int, char const*, char const*)>
        int pm_io_base = pci.readl(addr + 0x40) & 0xFFC0;
   429c9:	b8 40 00 00 00       	mov    $0x40,%eax
   429ce:	eb 89                	jmp    42959 <poweroff()+0x7f>

00000000000429d0 <check_keyboard()>:
int check_keyboard() {
   429d0:	f3 0f 1e fa          	endbr64 
   429d4:	55                   	push   %rbp
   429d5:	48 89 e5             	mov    %rsp,%rbp
   429d8:	41 54                	push   %r12
   429da:	53                   	push   %rbx
   429db:	48 83 ec 20          	sub    $0x20,%rsp
    int c = keyboard_readc();
   429df:	e8 34 f2 ff ff       	callq  41c18 <keyboard_readc()>
   429e4:	41 89 c4             	mov    %eax,%r12d
    if (c == 'a' || c == 'f' || c == 'e') {
   429e7:	8d 40 9b             	lea    -0x65(%rax),%eax
   429ea:	83 f8 01             	cmp    $0x1,%eax
   429ed:	76 1b                	jbe    42a0a <check_keyboard()+0x3a>
   429ef:	41 83 fc 61          	cmp    $0x61,%r12d
   429f3:	74 15                	je     42a0a <check_keyboard()+0x3a>
    } else if (c == 0x03 || c == 'q') {
   429f5:	41 83 fc 03          	cmp    $0x3,%r12d
   429f9:	74 0a                	je     42a05 <check_keyboard()+0x35>
   429fb:	41 83 fc 71          	cmp    $0x71,%r12d
   429ff:	0f 85 cd 00 00 00    	jne    42ad2 <check_keyboard()+0x102>
        poweroff();
   42a05:	e8 d0 fe ff ff       	callq  428da <poweroff()>
   42a0a:	b8 80 03 e0 fe       	mov    $0xfee00380,%eax
   42a0f:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
        memset(pt, 0, PAGESIZE * 2);
   42a15:	ba 00 20 00 00       	mov    $0x2000,%edx
   42a1a:	be 00 00 00 00       	mov    $0x0,%esi
   42a1f:	bf 00 10 00 00       	mov    $0x1000,%edi
   42a24:	e8 2e 0e 00 00       	callq  43857 <memset>
        pt[0].entry[0] = 0x2000 | PTE_P | PTE_W;
   42a29:	48 c7 04 25 00 10 00 	movq   $0x2003,0x1000
   42a30:	00 03 20 00 00 
        pt[1].entry[0] = PTE_P | PTE_W | PTE_PS;
   42a35:	48 c7 04 25 00 20 00 	movq   $0x83,0x2000
   42a3c:	00 83 00 00 00 
    asm volatile("movq %0, %%cr3" : : "r" (x) : "memory");
   42a41:	b8 00 10 00 00       	mov    $0x1000,%eax
   42a46:	0f 22 d8             	mov    %rax,%cr3
        multiboot_info[0] = 4;
   42a49:	c7 45 dc 04 00 00 00 	movl   $0x4,-0x24(%rbp)
            argument = "allocators";
   42a50:	b8 26 4a 04 00       	mov    $0x44a26,%eax
        if (c == 'a') {
   42a55:	41 83 fc 61          	cmp    $0x61,%r12d
   42a59:	74 12                	je     42a6d <check_keyboard()+0x9d>
            argument = "forkexit";
   42a5b:	41 83 fc 65          	cmp    $0x65,%r12d
   42a5f:	b8 31 4a 04 00       	mov    $0x44a31,%eax
   42a64:	ba 36 4a 04 00       	mov    $0x44a36,%edx
   42a69:	48 0f 44 c2          	cmove  %rdx,%rax
        assert(argument_ptr < 0x100000000L);
   42a6d:	ba ff ff ff ff       	mov    $0xffffffff,%edx
   42a72:	48 39 d0             	cmp    %rdx,%rax
   42a75:	77 67                	ja     42ade <check_keyboard()+0x10e>
        multiboot_info[4] = (uint32_t) argument_ptr;
   42a77:	89 45 ec             	mov    %eax,-0x14(%rbp)
        stash_kernel_data(true);
   42a7a:	bf 01 00 00 00       	mov    $0x1,%edi
   42a7f:	e8 0f ef ff ff       	callq  41993 <stash_kernel_data(bool)>
        uintptr_t zero_size = (uintptr_t) &_kernel_end - (uintptr_t) &_edata;
   42a84:	bb e0 a0 05 00       	mov    $0x5a0e0,%ebx
   42a89:	48 81 eb 60 21 05 00 	sub    $0x52160,%rbx
        uintptr_t data_size = (uintptr_t) &_edata - (uintptr_t) &_data_start;
   42a90:	ba 60 21 05 00       	mov    $0x52160,%edx
   42a95:	48 81 ea 00 60 04 00 	sub    $0x46000,%rdx
        uint8_t* data_stash = (uint8_t*) (SYMTAB_ADDR - data_size);
   42a9c:	be 00 60 04 01       	mov    $0x1046000,%esi
   42aa1:	48 81 ee 60 21 05 00 	sub    $0x52160,%rsi
        memcpy(&_data_start, data_stash, data_size);
   42aa8:	bf 00 60 04 00       	mov    $0x46000,%edi
   42aad:	e8 34 0d 00 00       	callq  437e6 <memcpy>
        memset(&_edata, 0, zero_size);
   42ab2:	48 89 da             	mov    %rbx,%rdx
   42ab5:	be 00 00 00 00       	mov    $0x0,%esi
   42aba:	bf 60 21 05 00       	mov    $0x52160,%edi
   42abf:	e8 93 0d 00 00       	callq  43857 <memset>
                     : : "b" (multiboot_info) : "memory");
   42ac4:	48 8d 5d dc          	lea    -0x24(%rbp),%rbx
   42ac8:	b8 02 b0 ad 2b       	mov    $0x2badb002,%eax
   42acd:	e9 2e d5 ff ff       	jmpq   40000 <_kernel_start>
}
   42ad2:	44 89 e0             	mov    %r12d,%eax
   42ad5:	48 83 c4 20          	add    $0x20,%rsp
   42ad9:	5b                   	pop    %rbx
   42ada:	41 5c                	pop    %r12
   42adc:	5d                   	pop    %rbp
   42add:	c3                   	retq   
        assert(argument_ptr < 0x100000000L);
   42ade:	b9 00 00 00 00       	mov    $0x0,%ecx
   42ae3:	ba 3f 4a 04 00       	mov    $0x44a3f,%edx
   42ae8:	be 07 03 00 00       	mov    $0x307,%esi
   42aed:	bf 91 49 04 00       	mov    $0x44991,%edi
   42af2:	e8 a6 f5 ff ff       	callq  4209d <assert_fail(char const*, int, char const*, char const*)>

0000000000042af7 <panic(char const*, ...)>:
void panic(const char* format, ...) {
   42af7:	f3 0f 1e fa          	endbr64 
   42afb:	55                   	push   %rbp
   42afc:	48 89 e5             	mov    %rsp,%rbp
   42aff:	48 83 ec 50          	sub    $0x50,%rsp
   42b03:	48 89 75 d8          	mov    %rsi,-0x28(%rbp)
   42b07:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
   42b0b:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   42b0f:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   42b13:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_start(val, format);
   42b17:	c7 45 b8 08 00 00 00 	movl   $0x8,-0x48(%rbp)
   42b1e:	48 8d 45 10          	lea    0x10(%rbp),%rax
   42b22:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   42b26:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   42b2a:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    asm volatile("movq %%rbp, %0" : "=r" (x));
   42b2e:	48 89 ee             	mov    %rbp,%rsi
    asm volatile("movq %%rsp, %0" : "=r" (x));
   42b31:	48 89 e0             	mov    %rsp,%rax
    vpanic(rdrsp(), rdrbp(), 0, format, val);
   42b34:	4c 8d 45 b8          	lea    -0x48(%rbp),%r8
   42b38:	48 89 f9             	mov    %rdi,%rcx
   42b3b:	ba 00 00 00 00       	mov    $0x0,%edx
   42b40:	48 89 c7             	mov    %rax,%rdi
   42b43:	e8 49 f4 ff ff       	callq  41f91 <vpanic(unsigned long, unsigned long, unsigned long, char const*, __va_list_tag*)>
        check_keyboard();
   42b48:	e8 83 fe ff ff       	callq  429d0 <check_keyboard()>
    while (true) {
   42b4d:	eb f9                	jmp    42b48 <panic(char const*, ...)+0x51>
   42b4f:	90                   	nop

0000000000042b50 <program_image::program_image(int)>:
program_image::program_image(int program_number) {
   42b50:	f3 0f 1e fa          	endbr64 
    elf_ = nullptr;
   42b54:	48 c7 07 00 00 00 00 	movq   $0x0,(%rdi)
    if (program_number >= 0
   42b5b:	83 fe 05             	cmp    $0x5,%esi
   42b5e:	77 1a                	ja     42b7a <program_image::program_image(int)+0x2a>
        elf_ = (elf_header*) ramimages[program_number].begin;
   42b60:	48 63 f6             	movslq %esi,%rsi
   42b63:	48 8d 04 76          	lea    (%rsi,%rsi,2),%rax
   42b67:	48 8b 04 c5 08 60 04 	mov    0x46008(,%rax,8),%rax
   42b6e:	00 
   42b6f:	48 89 07             	mov    %rax,(%rdi)
        assert(elf_->e_magic == ELF_MAGIC);
   42b72:	81 38 7f 45 4c 46    	cmpl   $0x464c457f,(%rax)
   42b78:	75 01                	jne    42b7b <program_image::program_image(int)+0x2b>
   42b7a:	c3                   	retq   
program_image::program_image(int program_number) {
   42b7b:	55                   	push   %rbp
   42b7c:	48 89 e5             	mov    %rsp,%rbp
        assert(elf_->e_magic == ELF_MAGIC);
   42b7f:	b9 00 00 00 00       	mov    $0x0,%ecx
   42b84:	ba 5b 4a 04 00       	mov    $0x44a5b,%edx
   42b89:	be 8b 03 00 00       	mov    $0x38b,%esi
   42b8e:	bf 91 49 04 00       	mov    $0x44991,%edi
   42b93:	e8 05 f5 ff ff       	callq  4209d <assert_fail(char const*, int, char const*, char const*)>

0000000000042b98 <program_image::program_number(char const*)>:
int program_image::program_number(const char* program_name) {
   42b98:	f3 0f 1e fa          	endbr64 
   42b9c:	55                   	push   %rbp
   42b9d:	48 89 e5             	mov    %rsp,%rbp
   42ba0:	41 54                	push   %r12
   42ba2:	53                   	push   %rbx
   42ba3:	49 89 fc             	mov    %rdi,%r12
    for (size_t i = 0; i != sizeof(ramimages) / sizeof(ramimages[0]); ++i) {
   42ba6:	bb 00 00 00 00       	mov    $0x0,%ebx
        if (strcmp(program_name, ramimages[i].name) == 0) {
   42bab:	48 8d 04 5b          	lea    (%rbx,%rbx,2),%rax
   42baf:	48 8b 34 c5 00 60 04 	mov    0x46000(,%rax,8),%rsi
   42bb6:	00 
   42bb7:	4c 89 e7             	mov    %r12,%rdi
   42bba:	e8 f9 0c 00 00       	callq  438b8 <strcmp>
   42bbf:	85 c0                	test   %eax,%eax
   42bc1:	74 14                	je     42bd7 <program_image::program_number(char const*)+0x3f>
    for (size_t i = 0; i != sizeof(ramimages) / sizeof(ramimages[0]); ++i) {
   42bc3:	48 83 c3 01          	add    $0x1,%rbx
   42bc7:	48 83 fb 06          	cmp    $0x6,%rbx
   42bcb:	75 de                	jne    42bab <program_image::program_number(char const*)+0x13>
    return -1;
   42bcd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
   42bd2:	5b                   	pop    %rbx
   42bd3:	41 5c                	pop    %r12
   42bd5:	5d                   	pop    %rbp
   42bd6:	c3                   	retq   
            return i;
   42bd7:	89 d8                	mov    %ebx,%eax
   42bd9:	eb f7                	jmp    42bd2 <program_image::program_number(char const*)+0x3a>
   42bdb:	90                   	nop

0000000000042bdc <program_image::program_image(char const*)>:
program_image::program_image(const char* program_name)
   42bdc:	f3 0f 1e fa          	endbr64 
   42be0:	55                   	push   %rbp
   42be1:	48 89 e5             	mov    %rsp,%rbp
   42be4:	53                   	push   %rbx
   42be5:	48 83 ec 08          	sub    $0x8,%rsp
   42be9:	48 89 fb             	mov    %rdi,%rbx
   42bec:	48 89 f7             	mov    %rsi,%rdi
    : program_image(program_number(program_name)) {
   42bef:	e8 a4 ff ff ff       	callq  42b98 <program_image::program_number(char const*)>
   42bf4:	89 c6                	mov    %eax,%esi
   42bf6:	48 89 df             	mov    %rbx,%rdi
   42bf9:	e8 52 ff ff ff       	callq  42b50 <program_image::program_image(int)>
}
   42bfe:	48 83 c4 08          	add    $0x8,%rsp
   42c02:	5b                   	pop    %rbx
   42c03:	5d                   	pop    %rbp
   42c04:	c3                   	retq   
   42c05:	90                   	nop

0000000000042c06 <program_image::entry() const>:
uintptr_t program_image::entry() const {
   42c06:	f3 0f 1e fa          	endbr64 
    return elf_ ? elf_->e_entry : 0;
   42c0a:	48 8b 17             	mov    (%rdi),%rdx
   42c0d:	b8 00 00 00 00       	mov    $0x0,%eax
   42c12:	48 85 d2             	test   %rdx,%rdx
   42c15:	74 04                	je     42c1b <program_image::entry() const+0x15>
   42c17:	48 8b 42 18          	mov    0x18(%rdx),%rax
}
   42c1b:	c3                   	retq   

0000000000042c1c <program_image::empty() const>:
bool program_image::empty() const {
   42c1c:	f3 0f 1e fa          	endbr64 
    return !elf_ || elf_->e_phnum == 0;
   42c20:	48 8b 17             	mov    (%rdi),%rdx
   42c23:	b8 01 00 00 00       	mov    $0x1,%eax
   42c28:	48 85 d2             	test   %rdx,%rdx
   42c2b:	74 08                	je     42c35 <program_image::empty() const+0x19>
   42c2d:	66 83 7a 38 00       	cmpw   $0x0,0x38(%rdx)
   42c32:	0f 94 c0             	sete   %al
}
   42c35:	c3                   	retq   

0000000000042c36 <program_image_segment::program_image_segment(elf_program*, elf_header*)>:
program_image_segment::program_image_segment(elf_program* ph, elf_header* elf)
   42c36:	f3 0f 1e fa          	endbr64 
    : ph_(ph), elf_(elf) {
   42c3a:	48 89 37             	mov    %rsi,(%rdi)
   42c3d:	48 89 57 08          	mov    %rdx,0x8(%rdi)
    if (elf) {
   42c41:	48 85 d2             	test   %rdx,%rdx
   42c44:	74 1a                	je     42c60 <program_image_segment::program_image_segment(elf_program*, elf_header*)+0x2a>
        return ph + (end ? elf->e_phnum : 0);
   42c46:	0f b7 4a 38          	movzwl 0x38(%rdx),%ecx
   42c4a:	48 8d 04 cd 00 00 00 	lea    0x0(,%rcx,8),%rax
   42c51:	00 
   42c52:	48 29 c8             	sub    %rcx,%rax
   42c55:	48 8d 04 c2          	lea    (%rdx,%rax,8),%rax
   42c59:	48 03 42 20          	add    0x20(%rdx),%rax
   42c5d:	48 89 c2             	mov    %rax,%rdx
    while (ph_ != eph && ph_->p_type != ELF_PTYPE_LOAD) {
   42c60:	48 39 d6             	cmp    %rdx,%rsi
   42c63:	74 11                	je     42c76 <program_image_segment::program_image_segment(elf_program*, elf_header*)+0x40>
   42c65:	83 3e 01             	cmpl   $0x1,(%rsi)
   42c68:	74 0c                	je     42c76 <program_image_segment::program_image_segment(elf_program*, elf_header*)+0x40>
        ++ph_;
   42c6a:	48 83 c6 38          	add    $0x38,%rsi
   42c6e:	48 89 37             	mov    %rsi,(%rdi)
    while (ph_ != eph && ph_->p_type != ELF_PTYPE_LOAD) {
   42c71:	48 39 d6             	cmp    %rdx,%rsi
   42c74:	75 ef                	jne    42c65 <program_image_segment::program_image_segment(elf_program*, elf_header*)+0x2f>
}
   42c76:	c3                   	retq   
   42c77:	90                   	nop

0000000000042c78 <program_image::begin() const>:
program_image_segment program_image::begin() const {
   42c78:	f3 0f 1e fa          	endbr64 
   42c7c:	55                   	push   %rbp
   42c7d:	48 89 e5             	mov    %rsp,%rbp
   42c80:	48 83 ec 10          	sub    $0x10,%rsp
    return program_image_segment(elf_header_program(elf_, false), elf_);
   42c84:	48 8b 17             	mov    (%rdi),%rdx
    if (elf) {
   42c87:	48 85 d2             	test   %rdx,%rdx
   42c8a:	74 1a                	je     42ca6 <program_image::begin() const+0x2e>
        return ph + (end ? elf->e_phnum : 0);
   42c8c:	48 89 d6             	mov    %rdx,%rsi
   42c8f:	48 03 72 20          	add    0x20(%rdx),%rsi
    return program_image_segment(elf_header_program(elf_, false), elf_);
   42c93:	48 8d 7d f0          	lea    -0x10(%rbp),%rdi
   42c97:	e8 9a ff ff ff       	callq  42c36 <program_image_segment::program_image_segment(elf_program*, elf_header*)>
}
   42c9c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   42ca0:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   42ca4:	c9                   	leaveq 
   42ca5:	c3                   	retq   
        return nullptr;
   42ca6:	48 89 d6             	mov    %rdx,%rsi
   42ca9:	eb e8                	jmp    42c93 <program_image::begin() const+0x1b>
   42cab:	90                   	nop

0000000000042cac <program_image::end() const>:
program_image_segment program_image::end() const {
   42cac:	f3 0f 1e fa          	endbr64 
   42cb0:	55                   	push   %rbp
   42cb1:	48 89 e5             	mov    %rsp,%rbp
   42cb4:	48 83 ec 10          	sub    $0x10,%rsp
    return program_image_segment(elf_header_program(elf_, true), elf_);
   42cb8:	48 8b 17             	mov    (%rdi),%rdx
    if (elf) {
   42cbb:	48 85 d2             	test   %rdx,%rdx
   42cbe:	74 2a                	je     42cea <program_image::end() const+0x3e>
        return ph + (end ? elf->e_phnum : 0);
   42cc0:	0f b7 4a 38          	movzwl 0x38(%rdx),%ecx
   42cc4:	48 8d 04 cd 00 00 00 	lea    0x0(,%rcx,8),%rax
   42ccb:	00 
   42ccc:	48 29 c8             	sub    %rcx,%rax
   42ccf:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   42cd3:	48 03 72 20          	add    0x20(%rdx),%rsi
    return program_image_segment(elf_header_program(elf_, true), elf_);
   42cd7:	48 8d 7d f0          	lea    -0x10(%rbp),%rdi
   42cdb:	e8 56 ff ff ff       	callq  42c36 <program_image_segment::program_image_segment(elf_program*, elf_header*)>
}
   42ce0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   42ce4:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   42ce8:	c9                   	leaveq 
   42ce9:	c3                   	retq   
        return nullptr;
   42cea:	48 89 d6             	mov    %rdx,%rsi
   42ced:	eb e8                	jmp    42cd7 <program_image::end() const+0x2b>
   42cef:	90                   	nop

0000000000042cf0 <program_image_segment::va() const>:
uintptr_t program_image_segment::va() const {
   42cf0:	f3 0f 1e fa          	endbr64 
    return ph_->p_va;
   42cf4:	48 8b 07             	mov    (%rdi),%rax
   42cf7:	48 8b 40 10          	mov    0x10(%rax),%rax
}
   42cfb:	c3                   	retq   

0000000000042cfc <program_image_segment::size() const>:
size_t program_image_segment::size() const {
   42cfc:	f3 0f 1e fa          	endbr64 
    return ph_->p_memsz;
   42d00:	48 8b 07             	mov    (%rdi),%rax
   42d03:	48 8b 40 28          	mov    0x28(%rax),%rax
}
   42d07:	c3                   	retq   

0000000000042d08 <program_image_segment::data() const>:
const char* program_image_segment::data() const {
   42d08:	f3 0f 1e fa          	endbr64 
    return (const char*) elf_ + ph_->p_offset;
   42d0c:	48 8b 07             	mov    (%rdi),%rax
   42d0f:	48 8b 40 08          	mov    0x8(%rax),%rax
   42d13:	48 03 47 08          	add    0x8(%rdi),%rax
}
   42d17:	c3                   	retq   

0000000000042d18 <program_image_segment::data_size() const>:
size_t program_image_segment::data_size() const {
   42d18:	f3 0f 1e fa          	endbr64 
    return ph_->p_filesz;
   42d1c:	48 8b 07             	mov    (%rdi),%rax
   42d1f:	48 8b 40 20          	mov    0x20(%rax),%rax
}
   42d23:	c3                   	retq   

0000000000042d24 <program_image_segment::operator!=(program_image_segment const&) const>:
bool program_image_segment::operator!=(const program_image_segment& x) const {
   42d24:	f3 0f 1e fa          	endbr64 
    return ph_ != x.ph_;
   42d28:	48 8b 06             	mov    (%rsi),%rax
   42d2b:	48 39 07             	cmp    %rax,(%rdi)
   42d2e:	0f 95 c0             	setne  %al
}
   42d31:	c3                   	retq   

0000000000042d32 <program_image_segment::operator++()>:
void program_image_segment::operator++() {
   42d32:	f3 0f 1e fa          	endbr64 
    assert(ph_ != elf_header_program(elf_, true));
   42d36:	48 8b 07             	mov    (%rdi),%rax
   42d39:	48 8b 57 08          	mov    0x8(%rdi),%rdx
    if (elf) {
   42d3d:	48 85 d2             	test   %rdx,%rdx
   42d40:	74 54                	je     42d96 <program_image_segment::operator++()+0x64>
        return ph + (end ? elf->e_phnum : 0);
   42d42:	0f b7 72 38          	movzwl 0x38(%rdx),%esi
   42d46:	48 8d 0c f5 00 00 00 	lea    0x0(,%rsi,8),%rcx
   42d4d:	00 
   42d4e:	48 29 f1             	sub    %rsi,%rcx
   42d51:	48 8d 0c ca          	lea    (%rdx,%rcx,8),%rcx
   42d55:	48 03 4a 20          	add    0x20(%rdx),%rcx
    assert(ph_ != elf_header_program(elf_, true));
   42d59:	48 39 c8             	cmp    %rcx,%rax
   42d5c:	74 46                	je     42da4 <program_image_segment::operator++()+0x72>
    ++ph_;
   42d5e:	48 83 c0 38          	add    $0x38,%rax
   42d62:	48 89 07             	mov    %rax,(%rdi)
        return ph + (end ? elf->e_phnum : 0);
   42d65:	0f b7 72 38          	movzwl 0x38(%rdx),%esi
   42d69:	48 8d 0c f5 00 00 00 	lea    0x0(,%rsi,8),%rcx
   42d70:	00 
   42d71:	48 29 f1             	sub    %rsi,%rcx
   42d74:	48 8d 0c ca          	lea    (%rdx,%rcx,8),%rcx
   42d78:	48 03 4a 20          	add    0x20(%rdx),%rcx
   42d7c:	48 89 ca             	mov    %rcx,%rdx
    while (ph_ != eph && ph_->p_type != ELF_PTYPE_LOAD) {
   42d7f:	48 39 c8             	cmp    %rcx,%rax
   42d82:	74 3d                	je     42dc1 <program_image_segment::operator++()+0x8f>
   42d84:	83 38 01             	cmpl   $0x1,(%rax)
   42d87:	74 38                	je     42dc1 <program_image_segment::operator++()+0x8f>
        ++ph_;
   42d89:	48 83 c0 38          	add    $0x38,%rax
   42d8d:	48 89 07             	mov    %rax,(%rdi)
    while (ph_ != eph && ph_->p_type != ELF_PTYPE_LOAD) {
   42d90:	48 39 d0             	cmp    %rdx,%rax
   42d93:	75 ef                	jne    42d84 <program_image_segment::operator++()+0x52>
   42d95:	c3                   	retq   
    assert(ph_ != elf_header_program(elf_, true));
   42d96:	48 85 c0             	test   %rax,%rax
   42d99:	74 09                	je     42da4 <program_image_segment::operator++()+0x72>
    ++ph_;
   42d9b:	48 83 c0 38          	add    $0x38,%rax
   42d9f:	48 89 07             	mov    %rax,(%rdi)
    if (elf) {
   42da2:	eb e0                	jmp    42d84 <program_image_segment::operator++()+0x52>
void program_image_segment::operator++() {
   42da4:	55                   	push   %rbp
   42da5:	48 89 e5             	mov    %rsp,%rbp
    assert(ph_ != elf_header_program(elf_, true));
   42da8:	b9 00 00 00 00       	mov    $0x0,%ecx
   42dad:	ba 98 4c 04 00       	mov    $0x44c98,%edx
   42db2:	be d1 03 00 00       	mov    $0x3d1,%esi
   42db7:	bf 91 49 04 00       	mov    $0x44991,%edi
   42dbc:	e8 dc f2 ff ff       	callq  4209d <assert_fail(char const*, int, char const*, char const*)>
   42dc1:	c3                   	retq   

0000000000042dc2 <memusage::refresh()>:

// memusage::refresh()
//    Calculate the current physical usage map, using the current process
//    table.

void memusage::refresh() {
   42dc2:	f3 0f 1e fa          	endbr64 
   42dc6:	55                   	push   %rbp
   42dc7:	48 89 e5             	mov    %rsp,%rbp
   42dca:	41 57                	push   %r15
   42dcc:	41 56                	push   %r14
   42dce:	41 55                	push   %r13
   42dd0:	41 54                	push   %r12
   42dd2:	53                   	push   %rbx
   42dd3:	48 83 ec 38          	sub    $0x38,%rsp
   42dd7:	49 89 fe             	mov    %rdi,%r14
    if (!v_) {
   42dda:	48 83 3f 00          	cmpq   $0x0,(%rdi)
   42dde:	74 47                	je     42e27 <memusage::refresh()+0x65>
        v_ = reinterpret_cast<unsigned*>(kalloc(PAGESIZE));
        assert(v_ != nullptr);
    }

    memset(v_, 0, (maxpa / PAGESIZE) * sizeof(*v_));
   42de0:	ba 00 10 00 00       	mov    $0x1000,%edx
   42de5:	be 00 00 00 00       	mov    $0x0,%esi
   42dea:	49 8b 3e             	mov    (%r14),%rdi
   42ded:	e8 65 0a 00 00       	callq  43857 <memset>
inline int vmiter::try_map(void* kp, int perm) {
    return try_map((uintptr_t) kp, perm);
}

inline ptiter::ptiter(x86_64_pagetable* pt)
    : pt_(pt) {
   42df2:	48 c7 45 b0 00 50 05 	movq   $0x55000,-0x50(%rbp)
   42df9:	00 
    go(0);
   42dfa:	be 00 00 00 00       	mov    $0x0,%esi
   42dff:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   42e03:	e8 f0 ea ff ff       	callq  418f8 <ptiter::go(unsigned long)>

    // mark kernel page tables
    for (ptiter it(kernel_pagetable); !it.done(); it.next()) {
   42e08:	48 b8 ff ff ff ff ff 	movabs $0xffffffffffff,%rax
   42e0f:	ff 00 00 
   42e12:	48 39 45 c8          	cmp    %rax,-0x38(%rbp)
   42e16:	77 70                	ja     42e88 <memusage::refresh()+0xc6>
}
inline void ptiter::next() {
    down(true);
}
inline uintptr_t ptiter::pa() const {
    return *pep_ & PTE_PAMASK;
   42e18:	49 bc 00 f0 ff ff ff 	movabs $0xffffffffff000,%r12
   42e1f:	ff 0f 00 
   42e22:	48 89 c3             	mov    %rax,%rbx
   42e25:	eb 3f                	jmp    42e66 <memusage::refresh()+0xa4>
        v_ = reinterpret_cast<unsigned*>(kalloc(PAGESIZE));
   42e27:	bf 00 10 00 00       	mov    $0x1000,%edi
   42e2c:	e8 53 dd ff ff       	callq  40b84 <kalloc(unsigned long)>
   42e31:	49 89 06             	mov    %rax,(%r14)
        assert(v_ != nullptr);
   42e34:	48 85 c0             	test   %rax,%rax
   42e37:	75 a7                	jne    42de0 <memusage::refresh()+0x1e>
   42e39:	b9 00 00 00 00       	mov    $0x0,%ecx
   42e3e:	ba 80 4e 04 00       	mov    $0x44e80,%edx
   42e43:	be 49 00 00 00       	mov    $0x49,%esi
   42e48:	bf 8e 4e 04 00       	mov    $0x44e8e,%edi
   42e4d:	e8 4b f2 ff ff       	callq  4209d <assert_fail(char const*, int, char const*, char const*)>
    down(true);
   42e52:	be 01 00 00 00       	mov    $0x1,%esi
   42e57:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   42e5b:	e8 96 e9 ff ff       	callq  417f6 <ptiter::down(bool)>
    for (ptiter it(kernel_pagetable); !it.done(); it.next()) {
   42e60:	48 39 5d c8          	cmp    %rbx,-0x38(%rbp)
   42e64:	77 22                	ja     42e88 <memusage::refresh()+0xc6>
    return *pep_ & PTE_PAMASK;
   42e66:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   42e6a:	4c 89 e6             	mov    %r12,%rsi
   42e6d:	48 23 30             	and    (%rax),%rsi
   42e70:	48 89 f0             	mov    %rsi,%rax
        if (pa < maxpa) {
   42e73:	48 81 fe ff ff 3f 00 	cmp    $0x3fffff,%rsi
   42e7a:	77 d6                	ja     42e52 <memusage::refresh()+0x90>
            v_[pa / PAGESIZE] |= flags;
   42e7c:	48 c1 e8 0a          	shr    $0xa,%rax
   42e80:	49 03 06             	add    (%r14),%rax
   42e83:	83 08 01             	orl    $0x1,(%rax)
   42e86:	eb ca                	jmp    42e52 <memusage::refresh()+0x90>
// address translation functions for identity-mapped kernels
inline uint64_t kptr2pa(uint64_t kptr) {
    return kptr;
}
template <typename T> inline uint64_t kptr2pa(T* kptr) {
    return reinterpret_cast<uint64_t>(kptr);
   42e88:	b8 00 50 05 00       	mov    $0x55000,%eax
        if (pa < maxpa) {
   42e8d:	48 3d ff ff 3f 00    	cmp    $0x3fffff,%rax
   42e93:	77 0b                	ja     42ea0 <memusage::refresh()+0xde>
            v_[pa / PAGESIZE] |= flags;
   42e95:	48 c1 e8 0c          	shr    $0xc,%rax
   42e99:	49 8b 16             	mov    (%r14),%rdx
   42e9c:	83 0c 82 01          	orl    $0x1,(%rdx,%rax,4)
    }
    mark(kptr2pa(kernel_pagetable), f_kernel);

    // mark pages accessible from each process's page table
    bool any = false;
    for (int pid = 1; pid < NPROC; ++pid) {
   42ea0:	bb f0 32 05 00       	mov    $0x532f0,%ebx
void memusage::refresh() {
   42ea5:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   42eab:	be 00 00 00 00       	mov    $0x0,%esi
        if (p->state != P_FREE
            && p->pagetable
            && p->pagetable != kernel_pagetable) {
            any = true;

            for (ptiter it(p); it.va() < VA_LOWEND; it.next()) {
   42eb0:	49 bd ff ff ff ff ff 	movabs $0x7fffffffffff,%r13
   42eb7:	7f 00 00 
        uintptr_t pa = *pep_ & PTE_PAMASK;
   42eba:	49 bf 00 f0 ff ff ff 	movabs $0xffffffffff000,%r15
   42ec1:	ff 0f 00 
   42ec4:	e9 c2 01 00 00       	jmpq   4308b <memusage::refresh()+0x2c9>
    down(true);
   42ec9:	be 01 00 00 00       	mov    $0x1,%esi
   42ece:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   42ed2:	e8 1f e9 ff ff       	callq  417f6 <ptiter::down(bool)>
    return (1UL << (PAGEOFFBITS + level * PAGEINDEXBITS)) - 1;
   42ed7:	8b 45 c0             	mov    -0x40(%rbp),%eax
   42eda:	8d 4c c0 0c          	lea    0xc(%rax,%rax,8),%ecx
   42ede:	b8 01 00 00 00       	mov    $0x1,%eax
   42ee3:	48 d3 e0             	shl    %cl,%rax
    return va_ & ~pageoffmask(level_);
   42ee6:	48 f7 d8             	neg    %rax
   42ee9:	48 23 45 c8          	and    -0x38(%rbp),%rax
   42eed:	4c 39 e8             	cmp    %r13,%rax
   42ef0:	77 29                	ja     42f1b <memusage::refresh()+0x159>
    return *pep_ & PTE_PAMASK;
   42ef2:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   42ef6:	4c 89 ff             	mov    %r15,%rdi
   42ef9:	48 23 38             	and    (%rax),%rdi
   42efc:	48 89 f8             	mov    %rdi,%rax
        if (pa < maxpa) {
   42eff:	48 81 ff ff ff 3f 00 	cmp    $0x3fffff,%rdi
   42f06:	77 c1                	ja     42ec9 <memusage::refresh()+0x107>
            v_[pa / PAGESIZE] |= flags;
   42f08:	48 c1 e8 0a          	shr    $0xa,%rax
   42f0c:	49 03 06             	add    (%r14),%rax
   42f0f:	8b 55 a0             	mov    -0x60(%rbp),%edx
   42f12:	0b 10                	or     (%rax),%edx
   42f14:	83 ca 01             	or     $0x1,%edx
   42f17:	89 10                	mov    %edx,(%rax)
   42f19:	eb ae                	jmp    42ec9 <memusage::refresh()+0x107>
        } else if (pid >= 1) {
   42f1b:	41 8d 74 24 ff       	lea    -0x1(%r12),%esi
   42f20:	89 75 a0             	mov    %esi,-0x60(%rbp)
            return 2U << pid;
   42f23:	b8 02 00 00 00       	mov    $0x2,%eax
   42f28:	44 89 e1             	mov    %r12d,%ecx
   42f2b:	d3 e0                	shl    %cl,%eax
   42f2d:	83 fe 1d             	cmp    $0x1d,%esi
   42f30:	ba 00 00 00 00       	mov    $0x0,%edx
   42f35:	0f 43 c2             	cmovae %edx,%eax
   42f38:	48 8b 75 a8          	mov    -0x58(%rbp),%rsi
   42f3c:	48 8b 16             	mov    (%rsi),%rdx
        if (pa < maxpa) {
   42f3f:	48 81 fa ff ff 3f 00 	cmp    $0x3fffff,%rdx
   42f46:	77 12                	ja     42f5a <memusage::refresh()+0x198>
            v_[pa / PAGESIZE] |= flags;
   42f48:	48 c1 ea 0c          	shr    $0xc,%rdx
   42f4c:	49 8b 0e             	mov    (%r14),%rcx
   42f4f:	48 8d 14 91          	lea    (%rcx,%rdx,4),%rdx
   42f53:	0b 02                	or     (%rdx),%eax
   42f55:	83 c8 01             	or     $0x1,%eax
   42f58:	89 02                	mov    %eax,(%rdx)
    : vmiter(p->pagetable, va) {
   42f5a:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
   42f5e:	48 8b 00             	mov    (%rax),%rax
    : pt_(pt), pep_(&pt_->entry[0]), level_(3), perm_(initial_perm), va_(0) {
   42f61:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
   42f65:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
   42f69:	c7 45 c0 03 00 00 00 	movl   $0x3,-0x40(%rbp)
   42f70:	c7 45 c4 ff 0f 00 00 	movl   $0xfff,-0x3c(%rbp)
   42f77:	48 c7 45 c8 00 00 00 	movq   $0x0,-0x38(%rbp)
   42f7e:	00 
    real_find(va);
   42f7f:	be 00 00 00 00       	mov    $0x0,%esi
   42f84:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   42f88:	e8 9b e4 ff ff       	callq  41428 <vmiter::real_find(unsigned long)>
    return va_;
   42f8d:	48 8b 75 c8          	mov    -0x38(%rbp),%rsi
                mark(it.pa(), f_kernel | f_process(pid));
            }
            mark(kptr2pa(p->pagetable), f_kernel | f_process(pid));

            for (vmiter it(p); it.va() < VA_LOWEND; ) {
   42f91:	4c 39 ee             	cmp    %r13,%rsi
   42f94:	0f 87 dc 00 00 00    	ja     43076 <memusage::refresh()+0x2b4>
            return 2U << pid;
   42f9a:	b8 02 00 00 00       	mov    $0x2,%eax
   42f9f:	44 89 e1             	mov    %r12d,%ecx
   42fa2:	d3 e0                	shl    %cl,%eax
   42fa4:	83 7d a0 1c          	cmpl   $0x1c,-0x60(%rbp)
   42fa8:	ba 00 00 00 00       	mov    $0x0,%edx
   42fad:	0f 46 d0             	cmovbe %eax,%edx
   42fb0:	89 55 a8             	mov    %edx,-0x58(%rbp)
   42fb3:	eb 16                	jmp    42fcb <memusage::refresh()+0x209>
                if (it.user()) {
                    mark(it.pa(), f_user | f_process(pid));
                    it.next();
   42fb5:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   42fb9:	e8 2e e6 ff ff       	callq  415ec <vmiter::next()>
   42fbe:	48 8b 75 c8          	mov    -0x38(%rbp),%rsi
            for (vmiter it(p); it.va() < VA_LOWEND; ) {
   42fc2:	4c 39 ee             	cmp    %r13,%rsi
   42fc5:	0f 87 ab 00 00 00    	ja     43076 <memusage::refresh()+0x2b4>
    uint64_t ph = *pep_ & perm_;
   42fcb:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   42fcf:	48 8b 08             	mov    (%rax),%rcx
   42fd2:	48 63 45 c4          	movslq -0x3c(%rbp),%rax
   42fd6:	48 21 c8             	and    %rcx,%rax
   42fd9:	48 89 c2             	mov    %rax,%rdx
    return ph & -(ph & PTE_P);
   42fdc:	83 e0 01             	and    $0x1,%eax
   42fdf:	48 f7 d8             	neg    %rax
   42fe2:	48 21 d0             	and    %rdx,%rax
    return (perm() & desired_perm) == desired_perm;
   42fe5:	83 e0 05             	and    $0x5,%eax
                if (it.user()) {
   42fe8:	48 83 f8 05          	cmp    $0x5,%rax
   42fec:	75 60                	jne    4304e <memusage::refresh()+0x28c>
    if (*pep_ & PTE_P) {
   42fee:	f6 c1 01             	test   $0x1,%cl
   42ff1:	74 c2                	je     42fb5 <memusage::refresh()+0x1f3>
        if (level_ > 0) {
   42ff3:	8b 55 c0             	mov    -0x40(%rbp),%edx
        uintptr_t pa = *pep_ & PTE_PAMASK;
   42ff6:	48 89 c8             	mov    %rcx,%rax
   42ff9:	4c 21 f8             	and    %r15,%rax
   42ffc:	48 bf 00 e0 ff ff ff 	movabs $0xfffffffffe000,%rdi
   43003:	ff 0f 00 
   43006:	48 21 f9             	and    %rdi,%rcx
   43009:	85 d2                	test   %edx,%edx
   4300b:	48 0f 4f c1          	cmovg  %rcx,%rax
   4300f:	48 89 c7             	mov    %rax,%rdi
   43012:	8d 4c d2 0c          	lea    0xc(%rdx,%rdx,8),%ecx
        return pa + (va_ & pageoffmask(level_));
   43016:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
   4301d:	48 89 d0             	mov    %rdx,%rax
   43020:	48 d3 e0             	shl    %cl,%rax
   43023:	48 f7 d0             	not    %rax
   43026:	48 21 f0             	and    %rsi,%rax
   43029:	48 01 f8             	add    %rdi,%rax
        if (pa < maxpa) {
   4302c:	48 3d ff ff 3f 00    	cmp    $0x3fffff,%rax
   43032:	77 81                	ja     42fb5 <memusage::refresh()+0x1f3>
            v_[pa / PAGESIZE] |= flags;
   43034:	48 c1 e8 0c          	shr    $0xc,%rax
   43038:	49 8b 16             	mov    (%r14),%rdx
   4303b:	48 8d 14 82          	lea    (%rdx,%rax,4),%rdx
   4303f:	8b 45 a8             	mov    -0x58(%rbp),%eax
   43042:	0b 02                	or     (%rdx),%eax
   43044:	83 c8 02             	or     $0x2,%eax
   43047:	89 02                	mov    %eax,(%rdx)
   43049:	e9 67 ff ff ff       	jmpq   42fb5 <memusage::refresh()+0x1f3>
   4304e:	8b 45 c0             	mov    -0x40(%rbp),%eax
   43051:	8d 4c c0 0c          	lea    0xc(%rax,%rax,8),%ecx
   43055:	b8 01 00 00 00       	mov    $0x1,%eax
   4305a:	48 d3 e0             	shl    %cl,%rax
   4305d:	48 83 e8 01          	sub    $0x1,%rax
    return (va_ | pageoffmask(level_)) + 1;
   43061:	48 09 f0             	or     %rsi,%rax
   43064:	48 8d 70 01          	lea    0x1(%rax),%rsi
    real_find(last_va());
   43068:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   4306c:	e8 b7 e3 ff ff       	callq  41428 <vmiter::real_find(unsigned long)>
}
   43071:	e9 48 ff ff ff       	jmpq   42fbe <memusage::refresh()+0x1fc>
            any = true;
   43076:	0f b6 75 a7          	movzbl -0x59(%rbp),%esi
    for (int pid = 1; pid < NPROC; ++pid) {
   4307a:	41 83 c4 01          	add    $0x1,%r12d
   4307e:	48 81 c3 d0 00 00 00 	add    $0xd0,%rbx
   43085:	41 83 fc 10          	cmp    $0x10,%r12d
   43089:	74 75                	je     43100 <memusage::refresh()+0x33e>
        if (p->state != P_FREE
   4308b:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
   4308f:	83 7b 0c 00          	cmpl   $0x0,0xc(%rbx)
   43093:	74 e5                	je     4307a <memusage::refresh()+0x2b8>
            && p->pagetable
   43095:	48 8b 03             	mov    (%rbx),%rax
            && p->pagetable != kernel_pagetable) {
   43098:	48 3d 00 50 05 00    	cmp    $0x55000,%rax
   4309e:	0f 95 c1             	setne  %cl
            && p->pagetable
   430a1:	48 85 c0             	test   %rax,%rax
   430a4:	0f 95 c2             	setne  %dl
            && p->pagetable != kernel_pagetable) {
   430a7:	20 d1                	and    %dl,%cl
   430a9:	88 4d a7             	mov    %cl,-0x59(%rbp)
   430ac:	74 cc                	je     4307a <memusage::refresh()+0x2b8>
    : pt_(pt) {
   430ae:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
    go(0);
   430b2:	be 00 00 00 00       	mov    $0x0,%esi
   430b7:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   430bb:	e8 38 e8 ff ff       	callq  418f8 <ptiter::go(unsigned long)>
   430c0:	8b 45 c0             	mov    -0x40(%rbp),%eax
   430c3:	8d 4c c0 0c          	lea    0xc(%rax,%rax,8),%ecx
   430c7:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
    return va_ & ~pageoffmask(level_);
   430ce:	48 d3 e0             	shl    %cl,%rax
   430d1:	48 23 45 c8          	and    -0x38(%rbp),%rax
            for (ptiter it(p); it.va() < VA_LOWEND; it.next()) {
   430d5:	4c 39 e8             	cmp    %r13,%rax
   430d8:	0f 87 3d fe ff ff    	ja     42f1b <memusage::refresh()+0x159>
            return 2U << pid;
   430de:	b8 02 00 00 00       	mov    $0x2,%eax
   430e3:	44 89 e1             	mov    %r12d,%ecx
   430e6:	d3 e0                	shl    %cl,%eax
        } else if (pid >= 1) {
   430e8:	41 8d 54 24 ff       	lea    -0x1(%r12),%edx
   430ed:	83 fa 1c             	cmp    $0x1c,%edx
   430f0:	ba 00 00 00 00       	mov    $0x0,%edx
   430f5:	0f 46 d0             	cmovbe %eax,%edx
   430f8:	89 55 a0             	mov    %edx,-0x60(%rbp)
   430fb:	e9 f2 fd ff ff       	jmpq   42ef2 <memusage::refresh()+0x130>
            }
        }
    }

    // if no different process page tables, use physical address instead
    if (!any) {
   43100:	40 84 f6             	test   %sil,%sil
   43103:	74 25                	je     4312a <memusage::refresh()+0x368>
        }
    }

    // mark my own memory
    if (any) {
        mark(kptr2pa(v_), f_kernel);
   43105:	49 8b 06             	mov    (%r14),%rax
        if (pa < maxpa) {
   43108:	48 3d ff ff 3f 00    	cmp    $0x3fffff,%rax
   4310e:	77 0b                	ja     4311b <memusage::refresh()+0x359>
            v_[pa / PAGESIZE] |= flags;
   43110:	48 89 c2             	mov    %rax,%rdx
   43113:	48 c1 ea 0c          	shr    $0xc,%rdx
   43117:	83 0c 90 01          	orl    $0x1,(%rax,%rdx,4)
    }
}
   4311b:	48 83 c4 38          	add    $0x38,%rsp
   4311f:	5b                   	pop    %rbx
   43120:	41 5c                	pop    %r12
   43122:	41 5d                	pop    %r13
   43124:	41 5e                	pop    %r14
   43126:	41 5f                	pop    %r15
   43128:	5d                   	pop    %rbp
   43129:	c3                   	retq   
    : pt_(pt), pep_(&pt_->entry[0]), level_(3), perm_(initial_perm), va_(0) {
   4312a:	48 c7 45 b0 00 50 05 	movq   $0x55000,-0x50(%rbp)
   43131:	00 
   43132:	48 c7 45 b8 00 50 05 	movq   $0x55000,-0x48(%rbp)
   43139:	00 
   4313a:	c7 45 c0 03 00 00 00 	movl   $0x3,-0x40(%rbp)
   43141:	c7 45 c4 ff 0f 00 00 	movl   $0xfff,-0x3c(%rbp)
   43148:	48 c7 45 c8 00 00 00 	movq   $0x0,-0x38(%rbp)
   4314f:	00 
    real_find(va);
   43150:	be 00 00 00 00       	mov    $0x0,%esi
   43155:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   43159:	e8 ca e2 ff ff       	callq  41428 <vmiter::real_find(unsigned long)>
    return va_;
   4315e:	48 8b 7d c8          	mov    -0x38(%rbp),%rdi
   43162:	41 bc 01 00 00 00    	mov    $0x1,%r12d
            pa &= ~0x1000UL;
   43168:	49 bd 00 e0 ff ff ff 	movabs $0xfffffffffe000,%r13
   4316f:	ff 0f 00 
        uintptr_t pa = *pep_ & PTE_PAMASK;
   43172:	49 bf 00 f0 ff ff ff 	movabs $0xffffffffff000,%r15
   43179:	ff 0f 00 
        for (vmiter it(kernel_pagetable); it.va() < VA_LOWEND; ) {
   4317c:	48 bb ff ff ff ff ff 	movabs $0x7fffffffffff,%rbx
   43183:	7f 00 00 
   43186:	48 39 df             	cmp    %rbx,%rdi
   43189:	76 30                	jbe    431bb <memusage::refresh()+0x3f9>
   4318b:	eb 8e                	jmp    4311b <memusage::refresh()+0x359>
   4318d:	8b 45 c0             	mov    -0x40(%rbp),%eax
   43190:	8d 4c c0 0c          	lea    0xc(%rax,%rax,8),%ecx
   43194:	4c 89 e0             	mov    %r12,%rax
   43197:	48 d3 e0             	shl    %cl,%rax
   4319a:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
    return (va_ | pageoffmask(level_)) + 1;
   4319e:	48 09 fe             	or     %rdi,%rsi
   431a1:	48 83 c6 01          	add    $0x1,%rsi
    real_find(last_va());
   431a5:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   431a9:	e8 7a e2 ff ff       	callq  41428 <vmiter::real_find(unsigned long)>
    return va_;
   431ae:	48 8b 7d c8          	mov    -0x38(%rbp),%rdi
   431b2:	48 39 df             	cmp    %rbx,%rdi
   431b5:	0f 87 60 ff ff ff    	ja     4311b <memusage::refresh()+0x359>
    uint64_t ph = *pep_ & perm_;
   431bb:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   431bf:	48 8b 08             	mov    (%rax),%rcx
   431c2:	48 63 45 c4          	movslq -0x3c(%rbp),%rax
   431c6:	48 21 c8             	and    %rcx,%rax
   431c9:	48 89 c2             	mov    %rax,%rdx
    return ph & -(ph & PTE_P);
   431cc:	83 e0 01             	and    $0x1,%eax
   431cf:	48 f7 d8             	neg    %rax
   431d2:	48 21 d0             	and    %rdx,%rax
    return (perm() & desired_perm) == desired_perm;
   431d5:	83 e0 05             	and    $0x5,%eax
                && pages[it.pa() / PAGESIZE].used()) {
   431d8:	48 83 f8 05          	cmp    $0x5,%rax
   431dc:	75 af                	jne    4318d <memusage::refresh()+0x3cb>
    if (*pep_ & PTE_P) {
   431de:	f6 c1 01             	test   $0x1,%cl
   431e1:	74 aa                	je     4318d <memusage::refresh()+0x3cb>
        if (level_ > 0) {
   431e3:	8b 75 c0             	mov    -0x40(%rbp),%esi
            pa &= ~0x1000UL;
   431e6:	48 89 c8             	mov    %rcx,%rax
        uintptr_t pa = *pep_ & PTE_PAMASK;
   431e9:	4c 21 f8             	and    %r15,%rax
   431ec:	4c 21 e9             	and    %r13,%rcx
   431ef:	85 f6                	test   %esi,%esi
   431f1:	48 0f 4f c1          	cmovg  %rcx,%rax
   431f5:	48 89 c2             	mov    %rax,%rdx
   431f8:	8d 4c f6 0c          	lea    0xc(%rsi,%rsi,8),%ecx
        return pa + (va_ & pageoffmask(level_));
   431fc:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   43203:	48 d3 e0             	shl    %cl,%rax
   43206:	48 f7 d0             	not    %rax
   43209:	48 21 f8             	and    %rdi,%rax
   4320c:	48 01 d0             	add    %rdx,%rax
                && it.pa() < MEMSIZE_PHYSICAL
   4320f:	48 3d ff ff 1f 00    	cmp    $0x1fffff,%rax
   43215:	0f 87 72 ff ff ff    	ja     4318d <memusage::refresh()+0x3cb>
                && pages[it.pa() / PAGESIZE].used()) {
   4321b:	48 89 c6             	mov    %rax,%rsi
   4321e:	48 c1 ee 0c          	shr    $0xc,%rsi
   43222:	80 be 00 30 05 00 00 	cmpb   $0x0,0x53000(%rsi)
   43229:	0f 84 5e ff ff ff    	je     4318d <memusage::refresh()+0x3cb>
                unsigned owner = (it.pa() - PROC_START_ADDR) / 0x40000;
   4322f:	48 2d 00 00 10 00    	sub    $0x100000,%rax
   43235:	48 c1 e8 12          	shr    $0x12,%rax
            return 0;
   43239:	ba 00 00 00 00       	mov    $0x0,%edx
        } else if (pid >= 1) {
   4323e:	83 f8 1c             	cmp    $0x1c,%eax
   43241:	76 1c                	jbe    4325f <memusage::refresh()+0x49d>
            v_[pa / PAGESIZE] |= flags;
   43243:	49 8b 06             	mov    (%r14),%rax
   43246:	48 8d 04 b0          	lea    (%rax,%rsi,4),%rax
   4324a:	0b 10                	or     (%rax),%edx
   4324c:	83 ca 02             	or     $0x2,%edx
   4324f:	89 10                	mov    %edx,(%rax)
                it.next();
   43251:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   43255:	e8 92 e3 ff ff       	callq  415ec <vmiter::next()>
   4325a:	e9 4f ff ff ff       	jmpq   431ae <memusage::refresh()+0x3ec>
                mark(it.pa(), f_user | f_process(owner + 1));
   4325f:	8d 48 01             	lea    0x1(%rax),%ecx
            return 2U << pid;
   43262:	ba 02 00 00 00       	mov    $0x2,%edx
   43267:	d3 e2                	shl    %cl,%edx
   43269:	eb d8                	jmp    43243 <memusage::refresh()+0x481>
   4326b:	90                   	nop

000000000004326c <memusage::page_error(unsigned long, char const*, int) const>:

void memusage::page_error(uintptr_t pa, const char* desc, int pid) const {
   4326c:	f3 0f 1e fa          	endbr64 
   43270:	55                   	push   %rbp
   43271:	48 89 e5             	mov    %rsp,%rbp
   43274:	41 56                	push   %r14
   43276:	41 55                	push   %r13
   43278:	41 54                	push   %r12
   4327a:	53                   	push   %rbx
   4327b:	49 89 f5             	mov    %rsi,%r13
   4327e:	49 89 d6             	mov    %rdx,%r14
   43281:	89 cb                	mov    %ecx,%ebx
    const char* fmt = pid >= 0
        ? "PAGE TABLE ERROR: %lx: %s (pid %d)\n"
   43283:	85 c9                	test   %ecx,%ecx
   43285:	41 bc 58 4f 04 00    	mov    $0x44f58,%r12d
   4328b:	b8 9d 4e 04 00       	mov    $0x44e9d,%eax
   43290:	4c 0f 48 e0          	cmovs  %rax,%r12
        : "PAGE TABLE ERROR: %lx: %s\n";
    error_printf(CPOS(22, 0), COLOR_ERROR, fmt, pa, desc, pid);
   43294:	41 89 c9             	mov    %ecx,%r9d
   43297:	49 89 d0             	mov    %rdx,%r8
   4329a:	48 89 f1             	mov    %rsi,%rcx
   4329d:	4c 89 e2             	mov    %r12,%rdx
   432a0:	be 00 c0 00 00       	mov    $0xc000,%esi
   432a5:	bf e0 06 00 00       	mov    $0x6e0,%edi
   432aa:	b0 00                	mov    $0x0,%al
   432ac:	e8 e8 10 00 00       	callq  44399 <error_printf(int, int, char const*, ...)>
    log_printf(fmt, pa, desc, pid);
   432b1:	89 d9                	mov    %ebx,%ecx
   432b3:	4c 89 f2             	mov    %r14,%rdx
   432b6:	4c 89 ee             	mov    %r13,%rsi
   432b9:	4c 89 e7             	mov    %r12,%rdi
   432bc:	b0 00                	mov    $0x0,%al
   432be:	e8 b4 ea ff ff       	callq  41d77 <log_printf(char const*, ...)>
}
   432c3:	5b                   	pop    %rbx
   432c4:	41 5c                	pop    %r12
   432c6:	41 5d                	pop    %r13
   432c8:	41 5e                	pop    %r14
   432ca:	5d                   	pop    %rbp
   432cb:	c3                   	retq   

00000000000432cc <memusage::symbol_at(unsigned long) const>:

static memusage global_mu;

uint16_t memusage::symbol_at(uintptr_t pa) const {
   432cc:	f3 0f 1e fa          	endbr64 
   432d0:	55                   	push   %rbp
   432d1:	48 89 e5             	mov    %rsp,%rbp
   432d4:	41 55                	push   %r13
   432d6:	41 54                	push   %r12
   432d8:	53                   	push   %rbx
   432d9:	48 83 ec 08          	sub    $0x8,%rsp
   432dd:	49 89 fd             	mov    %rdi,%r13
   432e0:	48 89 f3             	mov    %rsi,%rbx
    bool is_reserved = reserved_physical_address(pa);
   432e3:	48 89 f7             	mov    %rsi,%rdi
   432e6:	e8 d9 e7 ff ff       	callq  41ac4 <reserved_physical_address(unsigned long)>
   432eb:	41 89 c4             	mov    %eax,%r12d
    bool is_kernel = !is_reserved && !allocatable_physical_address(pa);
   432ee:	84 c0                	test   %al,%al
   432f0:	74 3e                	je     43330 <memusage::symbol_at(unsigned long) const+0x64>

    if (pa >= maxpa) {
        if (is_kernel) {
            return 'K' | 0x4000;
        } else if (is_reserved) {
            return '?' | 0x4000;
   432f2:	b8 3f 40 00 00       	mov    $0x403f,%eax
    if (pa >= maxpa) {
   432f7:	48 81 fb ff ff 3f 00 	cmp    $0x3fffff,%rbx
   432fe:	77 56                	ja     43356 <memusage::symbol_at(unsigned long) const+0x8a>
        } else {
            return '?' | 0xF000;
        }
    }

    auto v = v_[pa / PAGESIZE];
   43300:	48 89 da             	mov    %rbx,%rdx
   43303:	48 c1 ea 0c          	shr    $0xc,%rdx
   43307:	49 8b 45 00          	mov    0x0(%r13),%rax
   4330b:	8b 34 90             	mov    (%rax,%rdx,4),%esi
    if (pa >= (uintptr_t) console && pa < (uintptr_t) console + PAGESIZE) {
   4330e:	b8 00 80 0b 00       	mov    $0xb8000,%eax
   43313:	48 39 d8             	cmp    %rbx,%rax
   43316:	77 49                	ja     43361 <memusage::symbol_at(unsigned long) const+0x95>
    bool is_kernel = !is_reserved && !allocatable_physical_address(pa);
   43318:	ba 00 00 00 00       	mov    $0x0,%edx
    if (pa >= (uintptr_t) console && pa < (uintptr_t) console + PAGESIZE) {
   4331d:	48 8d 88 00 10 00 00 	lea    0x1000(%rax),%rcx
        return 'C' | 0x0700;
   43324:	b8 43 07 00 00       	mov    $0x743,%eax
    if (pa >= (uintptr_t) console && pa < (uintptr_t) console + PAGESIZE) {
   43329:	48 39 d9             	cmp    %rbx,%rcx
   4332c:	76 38                	jbe    43366 <memusage::symbol_at(unsigned long) const+0x9a>
   4332e:	eb 26                	jmp    43356 <memusage::symbol_at(unsigned long) const+0x8a>
    bool is_kernel = !is_reserved && !allocatable_physical_address(pa);
   43330:	48 89 df             	mov    %rbx,%rdi
   43333:	e8 ad e7 ff ff       	callq  41ae5 <allocatable_physical_address(unsigned long)>
   43338:	83 f0 01             	xor    $0x1,%eax
   4333b:	89 c2                	mov    %eax,%edx
    if (pa >= maxpa) {
   4333d:	48 81 fb ff ff 3f 00 	cmp    $0x3fffff,%rbx
   43344:	0f 86 90 01 00 00    	jbe    434da <memusage::symbol_at(unsigned long) const+0x20e>
            return 'K' | 0x4000;
   4334a:	3c 01                	cmp    $0x1,%al
   4334c:	19 c0                	sbb    %eax,%eax
   4334e:	66 25 f4 af          	and    $0xaff4,%ax
   43352:	66 05 4b 40          	add    $0x404b,%ax
                ch |= names[pid];
            }
            return ch;
        }
    }
}
   43356:	48 83 c4 08          	add    $0x8,%rsp
   4335a:	5b                   	pop    %rbx
   4335b:	41 5c                	pop    %r12
   4335d:	41 5d                	pop    %r13
   4335f:	5d                   	pop    %rbp
   43360:	c3                   	retq   
    bool is_kernel = !is_reserved && !allocatable_physical_address(pa);
   43361:	ba 00 00 00 00       	mov    $0x0,%edx
    } else if (is_reserved && v > (f_kernel | f_user)) {
   43366:	83 fe 03             	cmp    $0x3,%esi
   43369:	0f 97 c1             	seta   %cl
   4336c:	76 09                	jbe    43377 <memusage::symbol_at(unsigned long) const+0xab>
   4336e:	45 84 e4             	test   %r12b,%r12b
   43371:	0f 85 d2 00 00 00    	jne    43449 <memusage::symbol_at(unsigned long) const+0x17d>
        return 'R' | 0x0700;
   43377:	b8 52 07 00 00       	mov    $0x752,%eax
    } else if (is_reserved) {
   4337c:	45 84 e4             	test   %r12b,%r12b
   4337f:	75 d5                	jne    43356 <memusage::symbol_at(unsigned long) const+0x8a>
    } else if (is_kernel && v > (f_kernel | f_user)) {
   43381:	84 c9                	test   %cl,%cl
   43383:	74 08                	je     4338d <memusage::symbol_at(unsigned long) const+0xc1>
   43385:	84 d2                	test   %dl,%dl
   43387:	0f 85 e9 00 00 00    	jne    43476 <memusage::symbol_at(unsigned long) const+0x1aa>
        return 'K' | 0x0D00;
   4338d:	b8 4b 0d 00 00       	mov    $0xd4b,%eax
    } else if (is_kernel) {
   43392:	84 d2                	test   %dl,%dl
   43394:	75 c0                	jne    43356 <memusage::symbol_at(unsigned long) const+0x8a>
        return ' ' | 0x0700;
   43396:	b8 20 07 00 00       	mov    $0x720,%eax
    } else if (pa >= MEMSIZE_PHYSICAL) {
   4339b:	48 81 fb ff ff 1f 00 	cmp    $0x1fffff,%rbx
   433a2:	77 b2                	ja     43356 <memusage::symbol_at(unsigned long) const+0x8a>
            return '.' | 0x0700;
   433a4:	b8 2e 07 00 00       	mov    $0x72e,%eax
        if (v == 0) {
   433a9:	85 f6                	test   %esi,%esi
   433ab:	74 a9                	je     43356 <memusage::symbol_at(unsigned long) const+0x8a>
        } else if (v == f_kernel) {
   433ad:	83 fe 01             	cmp    $0x1,%esi
   433b0:	0f 84 1a 01 00 00    	je     434d0 <memusage::symbol_at(unsigned long) const+0x204>
        } else if (v == f_user) {
   433b6:	83 fe 02             	cmp    $0x2,%esi
   433b9:	74 9b                	je     43356 <memusage::symbol_at(unsigned long) const+0x8a>
        } else if ((v & f_kernel) && (v & f_user)) {
   433bb:	89 f0                	mov    %esi,%eax
   433bd:	83 e0 03             	and    $0x3,%eax
   433c0:	83 f8 03             	cmp    $0x3,%eax
   433c3:	0f 84 da 00 00 00    	je     434a3 <memusage::symbol_at(unsigned long) const+0x1d7>
        return lsb(v >> 2);
   433c9:	89 f1                	mov    %esi,%ecx
   433cb:	c1 e9 02             	shr    $0x2,%ecx
    return __builtin_ffs(x);
   433ce:	0f bc c9             	bsf    %ecx,%ecx
   433d1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   433d6:	0f 44 c8             	cmove  %eax,%ecx
   433d9:	83 c1 01             	add    $0x1,%ecx
            uint16_t ch = colors[pid % 5] << 8;
   433dc:	48 63 c1             	movslq %ecx,%rax
   433df:	48 69 c0 67 66 66 66 	imul   $0x66666667,%rax,%rax
   433e6:	48 c1 f8 21          	sar    $0x21,%rax
   433ea:	89 ca                	mov    %ecx,%edx
   433ec:	c1 fa 1f             	sar    $0x1f,%edx
   433ef:	29 d0                	sub    %edx,%eax
   433f1:	8d 04 80             	lea    (%rax,%rax,4),%eax
   433f4:	89 cb                	mov    %ecx,%ebx
   433f6:	29 c3                	sub    %eax,%ebx
   433f8:	89 d8                	mov    %ebx,%eax
   433fa:	48 98                	cltq   
   433fc:	0f b6 b8 21 50 04 00 	movzbl 0x45021(%rax),%edi
   43403:	c1 e7 08             	shl    $0x8,%edi
                ch |= 0x4000;
   43406:	89 f8                	mov    %edi,%eax
   43408:	80 cc 40             	or     $0x40,%ah
   4340b:	40 f6 c6 01          	test   $0x1,%sil
   4340f:	0f 45 f8             	cmovne %eax,%edi
        } else if (pid >= 1) {
   43412:	8d 51 ff             	lea    -0x1(%rcx),%edx
            return 2U << pid;
   43415:	b8 02 00 00 00       	mov    $0x2,%eax
   4341a:	d3 e0                	shl    %cl,%eax
   4341c:	83 fa 1d             	cmp    $0x1d,%edx
   4341f:	ba 00 00 00 00       	mov    $0x0,%edx
   43424:	0f 42 d0             	cmovb  %eax,%edx
            if (v > (f_process(pid) | f_kernel | f_user)) {
   43427:	83 ca 03             	or     $0x3,%edx
                ch = 0x0F00 | 'S';
   4342a:	b8 53 0f 00 00       	mov    $0xf53,%eax
            if (v > (f_process(pid) | f_kernel | f_user)) {
   4342f:	39 f2                	cmp    %esi,%edx
   43431:	0f 82 1f ff ff ff    	jb     43356 <memusage::symbol_at(unsigned long) const+0x8a>
                ch |= names[pid];
   43437:	48 63 c9             	movslq %ecx,%rcx
   4343a:	66 0f be 81 00 50 04 	movsbw 0x45000(%rcx),%ax
   43441:	00 
   43442:	09 f8                	or     %edi,%eax
   43444:	e9 0d ff ff ff       	jmpq   43356 <memusage::symbol_at(unsigned long) const+0x8a>
        return lsb(v >> 2);
   43449:	89 f1                	mov    %esi,%ecx
   4344b:	c1 e9 02             	shr    $0x2,%ecx
   4344e:	0f bc c9             	bsf    %ecx,%ecx
   43451:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   43456:	0f 44 c8             	cmove  %eax,%ecx
   43459:	83 c1 01             	add    $0x1,%ecx
        page_error(pa, "reserved page mapped for user", marked_pid(v));
   4345c:	ba b8 4e 04 00       	mov    $0x44eb8,%edx
   43461:	48 89 de             	mov    %rbx,%rsi
   43464:	4c 89 ef             	mov    %r13,%rdi
   43467:	e8 00 fe ff ff       	callq  4326c <memusage::page_error(unsigned long, char const*, int) const>
        return 'R' | 0x0C00;
   4346c:	b8 52 0c 00 00       	mov    $0xc52,%eax
   43471:	e9 e0 fe ff ff       	jmpq   43356 <memusage::symbol_at(unsigned long) const+0x8a>
        return lsb(v >> 2);
   43476:	89 f1                	mov    %esi,%ecx
   43478:	c1 e9 02             	shr    $0x2,%ecx
   4347b:	0f bc c9             	bsf    %ecx,%ecx
   4347e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   43483:	0f 44 c8             	cmove  %eax,%ecx
   43486:	83 c1 01             	add    $0x1,%ecx
        page_error(pa, "kernel data page mapped for user", marked_pid(v));
   43489:	ba 80 4f 04 00       	mov    $0x44f80,%edx
   4348e:	48 89 de             	mov    %rbx,%rsi
   43491:	4c 89 ef             	mov    %r13,%rdi
   43494:	e8 d3 fd ff ff       	callq  4326c <memusage::page_error(unsigned long, char const*, int) const>
        return 'K' | 0xCD00;
   43499:	b8 4b cd ff ff       	mov    $0xffffcd4b,%eax
   4349e:	e9 b3 fe ff ff       	jmpq   43356 <memusage::symbol_at(unsigned long) const+0x8a>
        return lsb(v >> 2);
   434a3:	89 f1                	mov    %esi,%ecx
   434a5:	c1 e9 02             	shr    $0x2,%ecx
   434a8:	0f bc c9             	bsf    %ecx,%ecx
   434ab:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   434b0:	0f 44 c8             	cmove  %eax,%ecx
   434b3:	83 c1 01             	add    $0x1,%ecx
            page_error(pa, "kernel allocated page mapped for user",
   434b6:	ba a8 4f 04 00       	mov    $0x44fa8,%edx
   434bb:	48 89 de             	mov    %rbx,%rsi
   434be:	4c 89 ef             	mov    %r13,%rdi
   434c1:	e8 a6 fd ff ff       	callq  4326c <memusage::page_error(unsigned long, char const*, int) const>
            return '*' | 0xF400;
   434c6:	b8 2a f4 ff ff       	mov    $0xfffff42a,%eax
   434cb:	e9 86 fe ff ff       	jmpq   43356 <memusage::symbol_at(unsigned long) const+0x8a>
            return 'K' | 0x0D00;
   434d0:	b8 4b 0d 00 00       	mov    $0xd4b,%eax
   434d5:	e9 7c fe ff ff       	jmpq   43356 <memusage::symbol_at(unsigned long) const+0x8a>
    auto v = v_[pa / PAGESIZE];
   434da:	48 89 d9             	mov    %rbx,%rcx
   434dd:	48 c1 e9 0c          	shr    $0xc,%rcx
   434e1:	49 8b 45 00          	mov    0x0(%r13),%rax
   434e5:	8b 34 88             	mov    (%rax,%rcx,4),%esi
    if (pa >= (uintptr_t) console && pa < (uintptr_t) console + PAGESIZE) {
   434e8:	b8 00 80 0b 00       	mov    $0xb8000,%eax
   434ed:	48 39 c3             	cmp    %rax,%rbx
   434f0:	0f 83 27 fe ff ff    	jae    4331d <memusage::symbol_at(unsigned long) const+0x51>
    } else if (is_reserved && v > (f_kernel | f_user)) {
   434f6:	83 fe 03             	cmp    $0x3,%esi
   434f9:	0f 97 c1             	seta   %cl
   434fc:	e9 80 fe ff ff       	jmpq   43381 <memusage::symbol_at(unsigned long) const+0xb5>

0000000000043501 <console_memviewer(proc*)>:
        }
        console[CPOS(11 + pn/64, 12 + pn%64)] = ch;
    }
}

void console_memviewer(proc* vmp) {
   43501:	f3 0f 1e fa          	endbr64 
   43505:	55                   	push   %rbp
   43506:	48 89 e5             	mov    %rsp,%rbp
   43509:	41 57                	push   %r15
   4350b:	41 56                	push   %r14
   4350d:	41 55                	push   %r13
   4350f:	41 54                	push   %r12
   43511:	53                   	push   %rbx
   43512:	48 83 ec 28          	sub    $0x28,%rsp
    // Process 0 must never be used.
    assert(ptable[0].state == P_FREE);
   43516:	83 3d 0f fd 00 00 00 	cmpl   $0x0,0xfd0f(%rip)        # 5322c <ptable+0xc>
   4351d:	75 31                	jne    43550 <console_memviewer(proc*)+0x4f>
   4351f:	49 89 fe             	mov    %rdi,%r14

    // track physical memory
    global_mu.refresh();
   43522:	bf d8 a0 05 00       	mov    $0x5a0d8,%edi
   43527:	e8 96 f8 ff ff       	callq  42dc2 <memusage::refresh()>

    // print physical memory
    console_printf(CPOS(0, 32), 0x0F00, "PHYSICAL MEMORY\n");
   4352c:	ba f0 4e 04 00       	mov    $0x44ef0,%edx
   43531:	be 00 0f 00 00       	mov    $0xf00,%esi
   43536:	bf 20 00 00 00       	mov    $0x20,%edi
   4353b:	b8 00 00 00 00       	mov    $0x0,%eax
   43540:	e8 1a 0e 00 00       	callq  4435f <console_printf(int, int, char const*, ...)>
   43545:	41 bc 00 00 00 00    	mov    $0x0,%r12d
   4354b:	e9 96 00 00 00       	jmpq   435e6 <console_memviewer(proc*)+0xe5>
    assert(ptable[0].state == P_FREE);
   43550:	b9 00 00 00 00       	mov    $0x0,%ecx
   43555:	ba d6 4e 04 00       	mov    $0x44ed6,%edx
   4355a:	be ea 00 00 00       	mov    $0xea,%esi
   4355f:	bf 8e 4e 04 00       	mov    $0x44e8e,%edi
   43564:	e8 34 eb ff ff       	callq  4209d <assert_fail(char const*, int, char const*, char const*)>

    for (int pn = 0; pn * PAGESIZE < memusage::max_view_pa; ++pn) {
        if (pn % 64 == 0) {
            console_printf(CPOS(1 + pn/64, 3), 0x0F00, "0x%06X ", pn << 12);
   43569:	44 89 e1             	mov    %r12d,%ecx
   4356c:	c1 e1 0c             	shl    $0xc,%ecx
   4356f:	41 8d 44 24 3f       	lea    0x3f(%r12),%eax
   43574:	45 85 e4             	test   %r12d,%r12d
   43577:	41 0f 49 c4          	cmovns %r12d,%eax
   4357b:	c1 f8 06             	sar    $0x6,%eax
   4357e:	8d 7c 80 05          	lea    0x5(%rax,%rax,4),%edi
   43582:	c1 e7 04             	shl    $0x4,%edi
   43585:	83 c7 03             	add    $0x3,%edi
   43588:	ba 01 4f 04 00       	mov    $0x44f01,%edx
   4358d:	be 00 0f 00 00       	mov    $0xf00,%esi
   43592:	b8 00 00 00 00       	mov    $0x0,%eax
   43597:	e8 c3 0d 00 00       	callq  4435f <console_printf(int, int, char const*, ...)>
        }
        console[CPOS(1 + pn/64, 12 + pn%64)] = global_mu.symbol_at(pn * PAGESIZE);
   4359c:	8d 43 3f             	lea    0x3f(%rbx),%eax
   4359f:	85 db                	test   %ebx,%ebx
   435a1:	0f 49 c3             	cmovns %ebx,%eax
   435a4:	c1 f8 06             	sar    $0x6,%eax
   435a7:	8d 54 80 05          	lea    0x5(%rax,%rax,4),%edx
   435ab:	c1 e2 04             	shl    $0x4,%edx
   435ae:	89 d8                	mov    %ebx,%eax
   435b0:	c1 f8 1f             	sar    $0x1f,%eax
   435b3:	c1 e8 1a             	shr    $0x1a,%eax
   435b6:	01 c3                	add    %eax,%ebx
   435b8:	83 e3 3f             	and    $0x3f,%ebx
   435bb:	29 c3                	sub    %eax,%ebx
   435bd:	8d 5c 1a 0c          	lea    0xc(%rdx,%rbx,1),%ebx
   435c1:	4c 89 ee             	mov    %r13,%rsi
   435c4:	bf d8 a0 05 00       	mov    $0x5a0d8,%edi
   435c9:	e8 fe fc ff ff       	callq  432cc <memusage::symbol_at(unsigned long) const>
   435ce:	48 63 db             	movslq %ebx,%rbx
   435d1:	66 89 84 1b 00 80 0b 	mov    %ax,0xb8000(%rbx,%rbx,1)
   435d8:	00 
    for (int pn = 0; pn * PAGESIZE < memusage::max_view_pa; ++pn) {
   435d9:	49 83 c4 01          	add    $0x1,%r12
   435dd:	49 81 fc 00 02 00 00 	cmp    $0x200,%r12
   435e4:	74 15                	je     435fb <console_memviewer(proc*)+0xfa>
   435e6:	4d 89 e5             	mov    %r12,%r13
   435e9:	49 c1 e5 0c          	shl    $0xc,%r13
   435ed:	44 89 e3             	mov    %r12d,%ebx
        if (pn % 64 == 0) {
   435f0:	41 f6 c4 3f          	test   $0x3f,%r12b
   435f4:	75 a6                	jne    4359c <console_memviewer(proc*)+0x9b>
   435f6:	e9 6e ff ff ff       	jmpq   43569 <console_memviewer(proc*)+0x68>
    }

    // print virtual memory
    if (vmp) {
   435fb:	4d 85 f6             	test   %r14,%r14
   435fe:	0f 84 c3 01 00 00    	je     437c7 <console_memviewer(proc*)+0x2c6>
    assert(vmp->pagetable);
   43604:	49 83 3e 00          	cmpq   $0x0,(%r14)
   43608:	74 7d                	je     43687 <console_memviewer(proc*)+0x186>
    console_printf(CPOS(10, 26), 0x0F00,
   4360a:	41 8b 4e 08          	mov    0x8(%r14),%ecx
   4360e:	ba 18 4f 04 00       	mov    $0x44f18,%edx
   43613:	be 00 0f 00 00       	mov    $0xf00,%esi
   43618:	bf 3a 03 00 00       	mov    $0x33a,%edi
   4361d:	b8 00 00 00 00       	mov    $0x0,%eax
   43622:	e8 38 0d 00 00       	callq  4435f <console_printf(int, int, char const*, ...)>
    : vmiter(p->pagetable, va) {
   43627:	49 8b 06             	mov    (%r14),%rax
    : pt_(pt), pep_(&pt_->entry[0]), level_(3), perm_(initial_perm), va_(0) {
   4362a:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
   4362e:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
   43632:	c7 45 c0 03 00 00 00 	movl   $0x3,-0x40(%rbp)
   43639:	c7 45 c4 ff 0f 00 00 	movl   $0xfff,-0x3c(%rbp)
   43640:	48 c7 45 c8 00 00 00 	movq   $0x0,-0x38(%rbp)
   43647:	00 
    real_find(va);
   43648:	be 00 00 00 00       	mov    $0x0,%esi
   4364d:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   43651:	e8 d2 dd ff ff       	callq  41428 <vmiter::real_find(unsigned long)>
    return va_;
   43656:	48 8b 5d c8          	mov    -0x38(%rbp),%rbx
         it.va() < memusage::max_view_va;
   4365a:	48 81 fb ff ff 2f 00 	cmp    $0x2fffff,%rbx
   43661:	0f 87 60 01 00 00    	ja     437c7 <console_memviewer(proc*)+0x2c6>
        return -1;
   43667:	49 c7 c5 ff ff ff ff 	mov    $0xffffffffffffffff,%r13
            pa &= ~0x1000UL;
   4366e:	49 be 00 e0 ff ff ff 	movabs $0xfffffffffe000,%r14
   43675:	ff 0f 00 
        uintptr_t pa = *pep_ & PTE_PAMASK;
   43678:	49 bf 00 f0 ff ff ff 	movabs $0xffffffffff000,%r15
   4367f:	ff 0f 00 
   43682:	e9 86 00 00 00       	jmpq   4370d <console_memviewer(proc*)+0x20c>
    assert(vmp->pagetable);
   43687:	b9 00 00 00 00       	mov    $0x0,%ecx
   4368c:	ba 09 4f 04 00       	mov    $0x44f09,%edx
   43691:	be cd 00 00 00       	mov    $0xcd,%esi
   43696:	bf 8e 4e 04 00       	mov    $0x44e8e,%edi
   4369b:	e8 fd e9 ff ff       	callq  4209d <assert_fail(char const*, int, char const*, char const*)>
            console_printf(CPOS(11 + pn / 64, 3), 0x0F00,
   436a0:	48 89 d8             	mov    %rbx,%rax
   436a3:	48 c1 e8 12          	shr    $0x12,%rax
   436a7:	8d 3c 80             	lea    (%rax,%rax,4),%edi
   436aa:	c1 e7 04             	shl    $0x4,%edi
   436ad:	81 c7 73 03 00 00    	add    $0x373,%edi
   436b3:	48 89 d9             	mov    %rbx,%rcx
   436b6:	ba 01 4f 04 00       	mov    $0x44f01,%edx
   436bb:	be 00 0f 00 00       	mov    $0xf00,%esi
   436c0:	b8 00 00 00 00       	mov    $0x0,%eax
   436c5:	e8 95 0c 00 00       	callq  4435f <console_printf(int, int, char const*, ...)>
   436ca:	eb 4e                	jmp    4371a <console_memviewer(proc*)+0x219>
        console[CPOS(11 + pn/64, 12 + pn%64)] = ch;
   436cc:	48 c1 eb 12          	shr    $0x12,%rbx
   436d0:	48 8d 14 9b          	lea    (%rbx,%rbx,4),%rdx
   436d4:	48 c1 e2 04          	shl    $0x4,%rdx
   436d8:	49 8d 94 14 7c 03 00 	lea    0x37c(%r12,%rdx,1),%rdx
   436df:	00 
   436e0:	66 89 84 12 00 80 0b 	mov    %ax,0xb8000(%rdx,%rdx,1)
   436e7:	00 
    return find(va_ + delta);
   436e8:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   436ec:	48 8d b0 00 10 00 00 	lea    0x1000(%rax),%rsi
    real_find(va);
   436f3:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   436f7:	e8 2c dd ff ff       	callq  41428 <vmiter::real_find(unsigned long)>
    return va_;
   436fc:	48 8b 5d c8          	mov    -0x38(%rbp),%rbx
         it.va() < memusage::max_view_va;
   43700:	48 81 fb ff ff 2f 00 	cmp    $0x2fffff,%rbx
   43707:	0f 87 ba 00 00 00    	ja     437c7 <console_memviewer(proc*)+0x2c6>
        unsigned long pn = it.va() / PAGESIZE;
   4370d:	49 89 dc             	mov    %rbx,%r12
   43710:	49 c1 ec 0c          	shr    $0xc,%r12
        if (pn % 64 == 0) {
   43714:	41 83 e4 3f          	and    $0x3f,%r12d
   43718:	74 86                	je     436a0 <console_memviewer(proc*)+0x19f>
    uint64_t ph = *pep_ & perm_;
   4371a:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   4371e:	48 8b 08             	mov    (%rax),%rcx
   43721:	48 63 55 c4          	movslq -0x3c(%rbp),%rdx
   43725:	48 89 d0             	mov    %rdx,%rax
   43728:	48 21 c8             	and    %rcx,%rax
    return ph & -(ph & PTE_P);
   4372b:	48 89 c2             	mov    %rax,%rdx
   4372e:	83 e2 01             	and    $0x1,%edx
   43731:	48 f7 da             	neg    %rdx
   43734:	48 21 c2             	and    %rax,%rdx
            ch = ' ';
   43737:	b8 20 00 00 00       	mov    $0x20,%eax
        if (!it.present()) {
   4373c:	f6 c2 01             	test   $0x1,%dl
   4373f:	74 8b                	je     436cc <console_memviewer(proc*)+0x1cb>
        return -1;
   43741:	4c 89 ee             	mov    %r13,%rsi
    if (*pep_ & PTE_P) {
   43744:	f6 c1 01             	test   $0x1,%cl
   43747:	74 2f                	je     43778 <console_memviewer(proc*)+0x277>
        if (level_ > 0) {
   43749:	8b 55 c0             	mov    -0x40(%rbp),%edx
            pa &= ~0x1000UL;
   4374c:	48 89 c8             	mov    %rcx,%rax
   4374f:	4c 21 f0             	and    %r14,%rax
        uintptr_t pa = *pep_ & PTE_PAMASK;
   43752:	48 89 ce             	mov    %rcx,%rsi
   43755:	4c 21 fe             	and    %r15,%rsi
   43758:	48 89 c1             	mov    %rax,%rcx
   4375b:	85 d2                	test   %edx,%edx
   4375d:	48 89 f0             	mov    %rsi,%rax
   43760:	48 0f 4f c1          	cmovg  %rcx,%rax
   43764:	8d 4c d2 0c          	lea    0xc(%rdx,%rdx,8),%ecx
        return pa + (va_ & pageoffmask(level_));
   43768:	4c 89 ee             	mov    %r13,%rsi
   4376b:	48 d3 e6             	shl    %cl,%rsi
   4376e:	48 f7 d6             	not    %rsi
   43771:	48 23 75 c8          	and    -0x38(%rbp),%rsi
   43775:	48 01 c6             	add    %rax,%rsi
            ch = mu.symbol_at(it.pa());
   43778:	bf d8 a0 05 00       	mov    $0x5a0d8,%edi
   4377d:	e8 4a fb ff ff       	callq  432cc <memusage::symbol_at(unsigned long) const>
    uint64_t ph = *pep_ & perm_;
   43782:	48 63 55 c4          	movslq -0x3c(%rbp),%rdx
   43786:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
   4378a:	48 23 11             	and    (%rcx),%rdx
   4378d:	48 89 d1             	mov    %rdx,%rcx
    return ph & -(ph & PTE_P);
   43790:	83 e2 01             	and    $0x1,%edx
   43793:	48 f7 da             	neg    %rdx
   43796:	48 21 ca             	and    %rcx,%rdx
    return (perm() & desired_perm) == desired_perm;
   43799:	83 e2 05             	and    $0x5,%edx
            if (it.user()) { // switch foreground & background colors
   4379c:	48 83 fa 05          	cmp    $0x5,%rdx
   437a0:	0f 85 26 ff ff ff    	jne    436cc <console_memviewer(proc*)+0x1cb>
                uint16_t z = (ch & 0x0F00) ^ ((ch & 0xF000) >> 4);
   437a6:	89 c2                	mov    %eax,%edx
   437a8:	66 c1 ea 04          	shr    $0x4,%dx
   437ac:	31 c2                	xor    %eax,%edx
   437ae:	89 d1                	mov    %edx,%ecx
   437b0:	66 81 e1 00 0f       	and    $0xf00,%cx
                ch ^= z | (z << 4);
   437b5:	81 e2 00 0f 00 00    	and    $0xf00,%edx
   437bb:	c1 e2 04             	shl    $0x4,%edx
   437be:	09 ca                	or     %ecx,%edx
   437c0:	31 d0                	xor    %edx,%eax
   437c2:	e9 05 ff ff ff       	jmpq   436cc <console_memviewer(proc*)+0x1cb>
        console_memviewer_virtual(global_mu, vmp);
    }
}
   437c7:	48 83 c4 28          	add    $0x28,%rsp
   437cb:	5b                   	pop    %rbx
   437cc:	41 5c                	pop    %r12
   437ce:	41 5d                	pop    %r13
   437d0:	41 5e                	pop    %r14
   437d2:	41 5f                	pop    %r15
   437d4:	5d                   	pop    %rbp
   437d5:	c3                   	retq   

00000000000437d6 <_GLOBAL__sub_I__ZN8memusage7refreshEv>:
    for (uint32_t pid = 0; pid < NPROC; pid++) {
        if (ptable[pid].state != P_FREE) {
            memdump_virtual(global_mu, &ptable[pid]);
        }
    }
   437d6:	f3 0f 1e fa          	endbr64 
        : v_(nullptr) {
   437da:	48 c7 05 f3 68 01 00 	movq   $0x0,0x168f3(%rip)        # 5a0d8 <global_mu>
   437e1:	00 00 00 00 
   437e5:	c3                   	retq   

00000000000437e6 <memcpy>:

// memcpy, memmove, memset, memcmp, memchr, strlen, strnlen, strcpy, strcmp,
// strncmp, strchr, strtoul, strtol
//    We must provide our own implementations.

void* memcpy(void* dst, const void* src, size_t n) {
   437e6:	f3 0f 1e fa          	endbr64 
   437ea:	48 89 f8             	mov    %rdi,%rax
    const char* s = (const char*) src;
    for (char* d = (char*) dst; n > 0; --n, ++s, ++d) {
   437ed:	48 85 d2             	test   %rdx,%rdx
   437f0:	74 17                	je     43809 <memcpy+0x23>
   437f2:	b9 00 00 00 00       	mov    $0x0,%ecx
        *d = *s;
   437f7:	44 0f b6 04 0e       	movzbl (%rsi,%rcx,1),%r8d
   437fc:	44 88 04 08          	mov    %r8b,(%rax,%rcx,1)
    for (char* d = (char*) dst; n > 0; --n, ++s, ++d) {
   43800:	48 83 c1 01          	add    $0x1,%rcx
   43804:	48 39 d1             	cmp    %rdx,%rcx
   43807:	75 ee                	jne    437f7 <memcpy+0x11>
    }
    return dst;
}
   43809:	c3                   	retq   

000000000004380a <memmove>:

void* memmove(void* dst, const void* src, size_t n) {
   4380a:	f3 0f 1e fa          	endbr64 
   4380e:	48 89 f8             	mov    %rdi,%rax
    const char* s = (const char*) src;
    char* d = (char*) dst;
    if (s < d && s + n > d) {
   43811:	48 39 fe             	cmp    %rdi,%rsi
   43814:	73 09                	jae    4381f <memmove+0x15>
   43816:	48 8d 0c 16          	lea    (%rsi,%rdx,1),%rcx
   4381a:	48 39 cf             	cmp    %rcx,%rdi
   4381d:	72 1d                	jb     4383c <memmove+0x32>
        s += n, d += n;
        while (n-- > 0) {
            *--d = *--s;
        }
    } else {
        while (n-- > 0) {
   4381f:	b9 00 00 00 00       	mov    $0x0,%ecx
   43824:	48 85 d2             	test   %rdx,%rdx
   43827:	74 12                	je     4383b <memmove+0x31>
            *d++ = *s++;
   43829:	0f b6 3c 0e          	movzbl (%rsi,%rcx,1),%edi
   4382d:	40 88 3c 08          	mov    %dil,(%rax,%rcx,1)
        while (n-- > 0) {
   43831:	48 83 c1 01          	add    $0x1,%rcx
   43835:	48 39 d1             	cmp    %rdx,%rcx
   43838:	75 ef                	jne    43829 <memmove+0x1f>
        }
    }
    return dst;
}
   4383a:	c3                   	retq   
   4383b:	c3                   	retq   
        while (n-- > 0) {
   4383c:	48 8d 4a ff          	lea    -0x1(%rdx),%rcx
   43840:	48 85 d2             	test   %rdx,%rdx
   43843:	74 f5                	je     4383a <memmove+0x30>
            *--d = *--s;
   43845:	0f b6 14 0e          	movzbl (%rsi,%rcx,1),%edx
   43849:	88 14 08             	mov    %dl,(%rax,%rcx,1)
        while (n-- > 0) {
   4384c:	48 83 e9 01          	sub    $0x1,%rcx
   43850:	48 83 f9 ff          	cmp    $0xffffffffffffffff,%rcx
   43854:	75 ef                	jne    43845 <memmove+0x3b>
   43856:	c3                   	retq   

0000000000043857 <memset>:

void* memset(void* v, int c, size_t n) {
   43857:	f3 0f 1e fa          	endbr64 
   4385b:	48 89 f8             	mov    %rdi,%rax
    for (char* p = (char*) v; n > 0; ++p, --n) {
   4385e:	48 85 d2             	test   %rdx,%rdx
   43861:	74 13                	je     43876 <memset+0x1f>
   43863:	48 8d 0c 17          	lea    (%rdi,%rdx,1),%rcx
   43867:	48 89 fa             	mov    %rdi,%rdx
        *p = c;
   4386a:	40 88 32             	mov    %sil,(%rdx)
    for (char* p = (char*) v; n > 0; ++p, --n) {
   4386d:	48 83 c2 01          	add    $0x1,%rdx
   43871:	48 39 d1             	cmp    %rdx,%rcx
   43874:	75 f4                	jne    4386a <memset+0x13>
    }
    return v;
}
   43876:	c3                   	retq   

0000000000043877 <strlen>:
        }
    }
    return nullptr;
}

size_t strlen(const char* s) {
   43877:	f3 0f 1e fa          	endbr64 
    size_t n;
    for (n = 0; *s != '\0'; ++s) {
   4387b:	80 3f 00             	cmpb   $0x0,(%rdi)
   4387e:	74 10                	je     43890 <strlen+0x19>
   43880:	b8 00 00 00 00       	mov    $0x0,%eax
        ++n;
   43885:	48 83 c0 01          	add    $0x1,%rax
    for (n = 0; *s != '\0'; ++s) {
   43889:	80 3c 07 00          	cmpb   $0x0,(%rdi,%rax,1)
   4388d:	75 f6                	jne    43885 <strlen+0xe>
   4388f:	c3                   	retq   
   43890:	b8 00 00 00 00       	mov    $0x0,%eax
    }
    return n;
}
   43895:	c3                   	retq   

0000000000043896 <strnlen>:

size_t strnlen(const char* s, size_t maxlen) {
   43896:	f3 0f 1e fa          	endbr64 
    size_t n;
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
   4389a:	48 85 f6             	test   %rsi,%rsi
   4389d:	74 15                	je     438b4 <strnlen+0x1e>
   4389f:	b8 00 00 00 00       	mov    $0x0,%eax
   438a4:	80 3c 07 00          	cmpb   $0x0,(%rdi,%rax,1)
   438a8:	74 0d                	je     438b7 <strnlen+0x21>
        ++n;
   438aa:	48 83 c0 01          	add    $0x1,%rax
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
   438ae:	48 39 c6             	cmp    %rax,%rsi
   438b1:	75 f1                	jne    438a4 <strnlen+0xe>
   438b3:	c3                   	retq   
   438b4:	48 89 f0             	mov    %rsi,%rax
    }
    return n;
}
   438b7:	c3                   	retq   

00000000000438b8 <strcmp>:
        --maxlen;
    }
    return dst;
}

int strcmp(const char* a, const char* b) {
   438b8:	f3 0f 1e fa          	endbr64 
    while (true) {
        unsigned char ac = *a, bc = *b;
   438bc:	0f b6 17             	movzbl (%rdi),%edx
   438bf:	0f b6 0e             	movzbl (%rsi),%ecx
        if (ac == 0 || bc == 0 || ac != bc) {
   438c2:	84 d2                	test   %dl,%dl
   438c4:	41 0f 94 c0          	sete   %r8b
   438c8:	38 ca                	cmp    %cl,%dl
   438ca:	0f 95 c0             	setne  %al
   438cd:	41 08 c0             	or     %al,%r8b
   438d0:	75 2a                	jne    438fc <strcmp+0x44>
   438d2:	b8 01 00 00 00       	mov    $0x1,%eax
   438d7:	84 c9                	test   %cl,%cl
   438d9:	74 21                	je     438fc <strcmp+0x44>
        unsigned char ac = *a, bc = *b;
   438db:	0f b6 14 07          	movzbl (%rdi,%rax,1),%edx
   438df:	0f b6 0c 06          	movzbl (%rsi,%rax,1),%ecx
        if (ac == 0 || bc == 0 || ac != bc) {
   438e3:	48 83 c0 01          	add    $0x1,%rax
   438e7:	84 d2                	test   %dl,%dl
   438e9:	41 0f 94 c1          	sete   %r9b
   438ed:	84 c9                	test   %cl,%cl
   438ef:	41 0f 94 c0          	sete   %r8b
   438f3:	45 08 c1             	or     %r8b,%r9b
   438f6:	75 04                	jne    438fc <strcmp+0x44>
   438f8:	38 ca                	cmp    %cl,%dl
   438fa:	74 df                	je     438db <strcmp+0x23>
            return (ac > bc) - (ac < bc);
   438fc:	38 ca                	cmp    %cl,%dl
   438fe:	0f 97 c0             	seta   %al
   43901:	0f b6 c0             	movzbl %al,%eax
   43904:	83 d8 00             	sbb    $0x0,%eax
        }
        ++a, ++b;
    }
}
   43907:	c3                   	retq   

0000000000043908 <strchr>:
        }
        ++a, ++b, --n;
    }
}

char* strchr(const char* s, int c) {
   43908:	f3 0f 1e fa          	endbr64 
    while (*s && *s != (char) c) {
   4390c:	0f b6 07             	movzbl (%rdi),%eax
   4390f:	84 c0                	test   %al,%al
   43911:	74 10                	je     43923 <strchr+0x1b>
   43913:	40 38 f0             	cmp    %sil,%al
   43916:	74 18                	je     43930 <strchr+0x28>
        ++s;
   43918:	48 83 c7 01          	add    $0x1,%rdi
    while (*s && *s != (char) c) {
   4391c:	0f b6 07             	movzbl (%rdi),%eax
   4391f:	84 c0                	test   %al,%al
   43921:	75 f0                	jne    43913 <strchr+0xb>
    }
    if (*s == (char) c) {
        return (char*) s;
    } else {
        return nullptr;
   43923:	40 84 f6             	test   %sil,%sil
   43926:	b8 00 00 00 00       	mov    $0x0,%eax
   4392b:	48 0f 44 c7          	cmove  %rdi,%rax
   4392f:	c3                   	retq   
   43930:	48 89 f8             	mov    %rdi,%rax
    }
}
   43933:	c3                   	retq   

0000000000043934 <printer::vprintf(int, char const*, __va_list_tag*)>:
#define FLAG_NUMERIC            (1<<5)
#define FLAG_SIGNED             (1<<6)
#define FLAG_NEGATIVE           (1<<7)
#define FLAG_ALT2               (1<<8)

void printer::vprintf(int color, const char* format, va_list val) {
   43934:	f3 0f 1e fa          	endbr64 
   43938:	55                   	push   %rbp
   43939:	48 89 e5             	mov    %rsp,%rbp
   4393c:	41 57                	push   %r15
   4393e:	41 56                	push   %r14
   43940:	41 55                	push   %r13
   43942:	41 54                	push   %r12
   43944:	53                   	push   %rbx
   43945:	48 83 ec 58          	sub    $0x58,%rsp
   43949:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
#define NUMBUFSIZ 24
    char numbuf[NUMBUFSIZ];

    for (; *format; ++format) {
   4394d:	0f b6 02             	movzbl (%rdx),%eax
   43950:	84 c0                	test   %al,%al
   43952:	0f 84 c6 07 00 00    	je     4411e <printer::vprintf(int, char const*, __va_list_tag*)+0x7ea>
   43958:	49 89 fe             	mov    %rdi,%r14
   4395b:	41 89 f7             	mov    %esi,%r15d
   4395e:	48 89 d3             	mov    %rdx,%rbx
   43961:	e9 b9 03 00 00       	jmpq   43d1f <printer::vprintf(int, char const*, __va_list_tag*)+0x3eb>
            continue;
        }

        // process flags
        int flags = 0;
        for (++format; *format; ++format) {
   43966:	4c 8d 63 01          	lea    0x1(%rbx),%r12
   4396a:	0f b6 5b 01          	movzbl 0x1(%rbx),%ebx
   4396e:	84 db                	test   %bl,%bl
   43970:	0f 84 8a 07 00 00    	je     44100 <printer::vprintf(int, char const*, __va_list_tag*)+0x7cc>
        int flags = 0;
   43976:	41 bd 00 00 00 00    	mov    $0x0,%r13d
            const char* flagc = strchr(flag_chars, *format);
   4397c:	0f be f3             	movsbl %bl,%esi
   4397f:	bf 10 57 04 00       	mov    $0x45710,%edi
   43984:	e8 7f ff ff ff       	callq  43908 <strchr>
   43989:	48 89 c1             	mov    %rax,%rcx
            if (flagc) {
   4398c:	48 85 c0             	test   %rax,%rax
   4398f:	74 74                	je     43a05 <printer::vprintf(int, char const*, __va_list_tag*)+0xd1>
                flags |= 1 << (flagc - flag_chars);
   43991:	48 81 e9 10 57 04 00 	sub    $0x45710,%rcx
   43998:	b8 01 00 00 00       	mov    $0x1,%eax
   4399d:	d3 e0                	shl    %cl,%eax
   4399f:	41 09 c5             	or     %eax,%r13d
        for (++format; *format; ++format) {
   439a2:	49 83 c4 01          	add    $0x1,%r12
   439a6:	41 0f b6 1c 24       	movzbl (%r12),%ebx
   439ab:	84 db                	test   %bl,%bl
   439ad:	75 cd                	jne    4397c <printer::vprintf(int, char const*, __va_list_tag*)+0x48>
                break;
            }
        }

        // process width
        int width = -1;
   439af:	c7 45 98 ff ff ff ff 	movl   $0xffffffff,-0x68(%rbp)
            width = va_arg(val, int);
            ++format;
        }

        // process precision
        int precision = -1;
   439b6:	c7 45 a4 ff ff ff ff 	movl   $0xffffffff,-0x5c(%rbp)
        if (*format == '.') {
   439bd:	41 80 3c 24 2e       	cmpb   $0x2e,(%r12)
   439c2:	0f 84 cc 00 00 00    	je     43a94 <printer::vprintf(int, char const*, __va_list_tag*)+0x160>
            }
        }

        // process length
        int length = 0;
        switch (*format) {
   439c8:	41 0f b6 04 24       	movzbl (%r12),%eax
   439cd:	3c 6c                	cmp    $0x6c,%al
   439cf:	0f 84 54 01 00 00    	je     43b29 <printer::vprintf(int, char const*, __va_list_tag*)+0x1f5>
   439d5:	0f 8f 42 01 00 00    	jg     43b1d <printer::vprintf(int, char const*, __va_list_tag*)+0x1e9>
   439db:	3c 68                	cmp    $0x68,%al
   439dd:	0f 85 68 01 00 00    	jne    43b4b <printer::vprintf(int, char const*, __va_list_tag*)+0x217>
        case 'z': // size_t, ssize_t
            length = 1;
            ++format;
            break;
        case 'h':
            ++format;
   439e3:	49 8d 4c 24 01       	lea    0x1(%r12),%rcx
        // process main conversion character
        int base = 10;
        unsigned long num = 0;
        const char* data = "";

        switch (*format) {
   439e8:	41 0f b6 44 24 01    	movzbl 0x1(%r12),%eax
   439ee:	8d 50 bd             	lea    -0x43(%rax),%edx
   439f1:	80 fa 35             	cmp    $0x35,%dl
   439f4:	0f 87 aa 05 00 00    	ja     43fa4 <printer::vprintf(int, char const*, __va_list_tag*)+0x670>
   439fa:	0f b6 d2             	movzbl %dl,%edx
   439fd:	3e ff 24 d5 50 50 04 	notrack jmpq *0x45050(,%rdx,8)
   43a04:	00 
        if (*format >= '1' && *format <= '9') {
   43a05:	8d 43 cf             	lea    -0x31(%rbx),%eax
   43a08:	3c 08                	cmp    $0x8,%al
   43a0a:	77 35                	ja     43a41 <printer::vprintf(int, char const*, __va_list_tag*)+0x10d>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
   43a0c:	41 0f b6 04 24       	movzbl (%r12),%eax
   43a11:	8d 50 d0             	lea    -0x30(%rax),%edx
   43a14:	80 fa 09             	cmp    $0x9,%dl
   43a17:	77 63                	ja     43a7c <printer::vprintf(int, char const*, __va_list_tag*)+0x148>
   43a19:	ba 00 00 00 00       	mov    $0x0,%edx
                width = 10 * width + *format++ - '0';
   43a1e:	49 83 c4 01          	add    $0x1,%r12
   43a22:	8d 14 92             	lea    (%rdx,%rdx,4),%edx
   43a25:	0f be c0             	movsbl %al,%eax
   43a28:	8d 54 50 d0          	lea    -0x30(%rax,%rdx,2),%edx
            for (width = 0; *format >= '0' && *format <= '9'; ) {
   43a2c:	41 0f b6 04 24       	movzbl (%r12),%eax
   43a31:	8d 48 d0             	lea    -0x30(%rax),%ecx
   43a34:	80 f9 09             	cmp    $0x9,%cl
   43a37:	76 e5                	jbe    43a1e <printer::vprintf(int, char const*, __va_list_tag*)+0xea>
   43a39:	89 55 98             	mov    %edx,-0x68(%rbp)
   43a3c:	e9 75 ff ff ff       	jmpq   439b6 <printer::vprintf(int, char const*, __va_list_tag*)+0x82>
        } else if (*format == '*') {
   43a41:	80 fb 2a             	cmp    $0x2a,%bl
   43a44:	75 42                	jne    43a88 <printer::vprintf(int, char const*, __va_list_tag*)+0x154>
            width = va_arg(val, int);
   43a46:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   43a4a:	8b 07                	mov    (%rdi),%eax
   43a4c:	83 f8 2f             	cmp    $0x2f,%eax
   43a4f:	77 19                	ja     43a6a <printer::vprintf(int, char const*, __va_list_tag*)+0x136>
   43a51:	89 c2                	mov    %eax,%edx
   43a53:	48 03 57 10          	add    0x10(%rdi),%rdx
   43a57:	83 c0 08             	add    $0x8,%eax
   43a5a:	89 07                	mov    %eax,(%rdi)
   43a5c:	8b 02                	mov    (%rdx),%eax
   43a5e:	89 45 98             	mov    %eax,-0x68(%rbp)
            ++format;
   43a61:	49 83 c4 01          	add    $0x1,%r12
   43a65:	e9 4c ff ff ff       	jmpq   439b6 <printer::vprintf(int, char const*, __va_list_tag*)+0x82>
            width = va_arg(val, int);
   43a6a:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   43a6e:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   43a72:	48 8d 42 08          	lea    0x8(%rdx),%rax
   43a76:	48 89 47 08          	mov    %rax,0x8(%rdi)
   43a7a:	eb e0                	jmp    43a5c <printer::vprintf(int, char const*, __va_list_tag*)+0x128>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
   43a7c:	c7 45 98 00 00 00 00 	movl   $0x0,-0x68(%rbp)
   43a83:	e9 2e ff ff ff       	jmpq   439b6 <printer::vprintf(int, char const*, __va_list_tag*)+0x82>
        int width = -1;
   43a88:	c7 45 98 ff ff ff ff 	movl   $0xffffffff,-0x68(%rbp)
   43a8f:	e9 22 ff ff ff       	jmpq   439b6 <printer::vprintf(int, char const*, __va_list_tag*)+0x82>
            ++format;
   43a94:	49 8d 54 24 01       	lea    0x1(%r12),%rdx
            if (*format >= '0' && *format <= '9') {
   43a99:	41 0f b6 44 24 01    	movzbl 0x1(%r12),%eax
   43a9f:	8d 48 d0             	lea    -0x30(%rax),%ecx
   43aa2:	80 f9 09             	cmp    $0x9,%cl
   43aa5:	76 13                	jbe    43aba <printer::vprintf(int, char const*, __va_list_tag*)+0x186>
            } else if (*format == '*') {
   43aa7:	3c 2a                	cmp    $0x2a,%al
   43aa9:	74 32                	je     43add <printer::vprintf(int, char const*, __va_list_tag*)+0x1a9>
            ++format;
   43aab:	49 89 d4             	mov    %rdx,%r12
                precision = 0;
   43aae:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%rbp)
   43ab5:	e9 0e ff ff ff       	jmpq   439c8 <printer::vprintf(int, char const*, __va_list_tag*)+0x94>
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
   43aba:	be 00 00 00 00       	mov    $0x0,%esi
                    precision = 10 * precision + *format++ - '0';
   43abf:	48 83 c2 01          	add    $0x1,%rdx
   43ac3:	8d 0c b6             	lea    (%rsi,%rsi,4),%ecx
   43ac6:	0f be c0             	movsbl %al,%eax
   43ac9:	8d 74 48 d0          	lea    -0x30(%rax,%rcx,2),%esi
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
   43acd:	0f b6 02             	movzbl (%rdx),%eax
   43ad0:	8d 48 d0             	lea    -0x30(%rax),%ecx
   43ad3:	80 f9 09             	cmp    $0x9,%cl
   43ad6:	76 e7                	jbe    43abf <printer::vprintf(int, char const*, __va_list_tag*)+0x18b>
                    precision = 10 * precision + *format++ - '0';
   43ad8:	49 89 d4             	mov    %rdx,%r12
   43adb:	eb 1c                	jmp    43af9 <printer::vprintf(int, char const*, __va_list_tag*)+0x1c5>
                precision = va_arg(val, int);
   43add:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   43ae1:	8b 01                	mov    (%rcx),%eax
   43ae3:	83 f8 2f             	cmp    $0x2f,%eax
   43ae6:	77 23                	ja     43b0b <printer::vprintf(int, char const*, __va_list_tag*)+0x1d7>
   43ae8:	89 c2                	mov    %eax,%edx
   43aea:	48 03 51 10          	add    0x10(%rcx),%rdx
   43aee:	83 c0 08             	add    $0x8,%eax
   43af1:	89 01                	mov    %eax,(%rcx)
   43af3:	8b 32                	mov    (%rdx),%esi
                ++format;
   43af5:	49 83 c4 02          	add    $0x2,%r12
            if (precision < 0) {
   43af9:	85 f6                	test   %esi,%esi
   43afb:	b8 00 00 00 00       	mov    $0x0,%eax
   43b00:	0f 49 c6             	cmovns %esi,%eax
   43b03:	89 45 a4             	mov    %eax,-0x5c(%rbp)
   43b06:	e9 bd fe ff ff       	jmpq   439c8 <printer::vprintf(int, char const*, __va_list_tag*)+0x94>
                precision = va_arg(val, int);
   43b0b:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   43b0f:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   43b13:	48 8d 42 08          	lea    0x8(%rdx),%rax
   43b17:	48 89 47 08          	mov    %rax,0x8(%rdi)
   43b1b:	eb d6                	jmp    43af3 <printer::vprintf(int, char const*, __va_list_tag*)+0x1bf>
        switch (*format) {
   43b1d:	3c 74                	cmp    $0x74,%al
   43b1f:	74 08                	je     43b29 <printer::vprintf(int, char const*, __va_list_tag*)+0x1f5>
   43b21:	3c 7a                	cmp    $0x7a,%al
   43b23:	0f 85 e2 05 00 00    	jne    4410b <printer::vprintf(int, char const*, __va_list_tag*)+0x7d7>
            ++format;
   43b29:	49 8d 4c 24 01       	lea    0x1(%r12),%rcx
        switch (*format) {
   43b2e:	41 0f b6 44 24 01    	movzbl 0x1(%r12),%eax
   43b34:	8d 50 bd             	lea    -0x43(%rax),%edx
   43b37:	80 fa 35             	cmp    $0x35,%dl
   43b3a:	0f 87 64 04 00 00    	ja     43fa4 <printer::vprintf(int, char const*, __va_list_tag*)+0x670>
   43b40:	0f b6 d2             	movzbl %dl,%edx
   43b43:	3e ff 24 d5 00 52 04 	notrack jmpq *0x45200(,%rdx,8)
   43b4a:	00 
   43b4b:	8d 50 bd             	lea    -0x43(%rax),%edx
   43b4e:	80 fa 35             	cmp    $0x35,%dl
   43b51:	0f 87 4a 04 00 00    	ja     43fa1 <printer::vprintf(int, char const*, __va_list_tag*)+0x66d>
   43b57:	0f b6 d2             	movzbl %dl,%edx
   43b5a:	3e ff 24 d5 b0 53 04 	notrack jmpq *0x453b0(,%rdx,8)
   43b61:	00 
        case 'd':
        case 'i': {
            long x = length ? va_arg(val, long) : va_arg(val, int);
   43b62:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   43b66:	8b 07                	mov    (%rdi),%eax
   43b68:	83 f8 2f             	cmp    $0x2f,%eax
   43b6b:	0f 87 c9 01 00 00    	ja     43d3a <printer::vprintf(int, char const*, __va_list_tag*)+0x406>
   43b71:	89 c2                	mov    %eax,%edx
   43b73:	48 03 57 10          	add    0x10(%rdi),%rdx
   43b77:	83 c0 08             	add    $0x8,%eax
   43b7a:	89 07                	mov    %eax,(%rdi)
   43b7c:	48 8b 12             	mov    (%rdx),%rdx
   43b7f:	49 89 cc             	mov    %rcx,%r12
            int negative = x < 0 ? FLAG_NEGATIVE : 0;
   43b82:	48 89 d0             	mov    %rdx,%rax
   43b85:	48 c1 f8 38          	sar    $0x38,%rax
            num = negative ? -x : x;
   43b89:	49 89 d0             	mov    %rdx,%r8
   43b8c:	49 f7 d8             	neg    %r8
   43b8f:	25 80 00 00 00       	and    $0x80,%eax
   43b94:	4c 0f 44 c2          	cmove  %rdx,%r8
            flags |= FLAG_NUMERIC | FLAG_SIGNED | negative;
   43b98:	41 09 c5             	or     %eax,%r13d
   43b9b:	41 83 cd 60          	or     $0x60,%r13d
        const char* data = "";
   43b9f:	bb b7 46 04 00       	mov    $0x446b7,%ebx
                format--;
            }
            break;
        }

        if (flags & FLAG_NUMERIC) {
   43ba4:	44 89 e8             	mov    %r13d,%eax
   43ba7:	83 e0 20             	and    $0x20,%eax
   43baa:	89 45 9c             	mov    %eax,-0x64(%rbp)
   43bad:	41 b9 0a 00 00 00    	mov    $0xa,%r9d
   43bb3:	0f 85 0e 04 00 00    	jne    43fc7 <printer::vprintf(int, char const*, __va_list_tag*)+0x693>
            data = fill_numbuf(numbuf + NUMBUFSIZ, num, base);
        }

        const char* prefix = "";
        if ((flags & FLAG_NUMERIC) && (flags & FLAG_SIGNED)) {
   43bb9:	44 89 6d 8c          	mov    %r13d,-0x74(%rbp)
   43bbd:	44 89 e8             	mov    %r13d,%eax
   43bc0:	83 e0 60             	and    $0x60,%eax
   43bc3:	83 f8 60             	cmp    $0x60,%eax
   43bc6:	0f 84 3e 04 00 00    	je     4400a <printer::vprintf(int, char const*, __va_list_tag*)+0x6d6>
            } else if (flags & FLAG_PLUSPOSITIVE) {
                prefix = "+";
            } else if (flags & FLAG_SPACEPOSITIVE) {
                prefix = " ";
            }
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
   43bcc:	44 89 e8             	mov    %r13d,%eax
   43bcf:	83 e0 21             	and    $0x21,%eax
        const char* prefix = "";
   43bd2:	48 c7 45 a8 b7 46 04 	movq   $0x446b7,-0x58(%rbp)
   43bd9:	00 
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
   43bda:	83 f8 21             	cmp    $0x21,%eax
   43bdd:	0f 84 66 04 00 00    	je     44049 <printer::vprintf(int, char const*, __va_list_tag*)+0x715>
                   && (num || (flags & FLAG_ALT2))) {
            prefix = (base == -16 ? "0x" : "0X");
        }

        int datalen;
        if (precision >= 0 && !(flags & FLAG_NUMERIC)) {
   43be3:	8b 4d a4             	mov    -0x5c(%rbp),%ecx
   43be6:	89 c8                	mov    %ecx,%eax
   43be8:	f7 d0                	not    %eax
   43bea:	c1 e8 1f             	shr    $0x1f,%eax
   43bed:	89 45 88             	mov    %eax,-0x78(%rbp)
   43bf0:	83 7d 9c 00          	cmpl   $0x0,-0x64(%rbp)
   43bf4:	0f 85 8b 04 00 00    	jne    44085 <printer::vprintf(int, char const*, __va_list_tag*)+0x751>
   43bfa:	84 c0                	test   %al,%al
   43bfc:	0f 84 83 04 00 00    	je     44085 <printer::vprintf(int, char const*, __va_list_tag*)+0x751>
            datalen = strnlen(data, precision);
   43c02:	48 63 f1             	movslq %ecx,%rsi
   43c05:	48 89 df             	mov    %rbx,%rdi
   43c08:	e8 89 fc ff ff       	callq  43896 <strnlen>
   43c0d:	89 45 a0             	mov    %eax,-0x60(%rbp)
        if ((flags & FLAG_NUMERIC)
            && precision >= 0) {
            zeros = precision > datalen ? precision - datalen : 0;
        } else if ((flags & FLAG_NUMERIC)
                   && (flags & FLAG_ZERO)
                   && !(flags & FLAG_LEFTJUSTIFY)
   43c10:	8b 45 8c             	mov    -0x74(%rbp),%eax
   43c13:	83 e0 26             	and    $0x26,%eax
                   && datalen + (int) strlen(prefix) < width) {
            zeros = width - datalen - strlen(prefix);
        } else {
            zeros = 0;
   43c16:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%rbp)
                   && datalen + (int) strlen(prefix) < width) {
   43c1d:	83 f8 22             	cmp    $0x22,%eax
   43c20:	0f 84 97 04 00 00    	je     440bd <printer::vprintf(int, char const*, __va_list_tag*)+0x789>
        }

        width -= datalen + zeros + strlen(prefix);
   43c26:	48 8b 7d a8          	mov    -0x58(%rbp),%rdi
   43c2a:	e8 48 fc ff ff       	callq  43877 <strlen>
   43c2f:	8b 55 a4             	mov    -0x5c(%rbp),%edx
   43c32:	03 55 a0             	add    -0x60(%rbp),%edx
   43c35:	8b 7d 98             	mov    -0x68(%rbp),%edi
   43c38:	29 d7                	sub    %edx,%edi
   43c3a:	89 fa                	mov    %edi,%edx
   43c3c:	29 c2                	sub    %eax,%edx
   43c3e:	89 55 98             	mov    %edx,-0x68(%rbp)
   43c41:	89 55 9c             	mov    %edx,-0x64(%rbp)
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
   43c44:	41 f6 c5 04          	test   $0x4,%r13b
   43c48:	75 32                	jne    43c7c <printer::vprintf(int, char const*, __va_list_tag*)+0x348>
        width -= datalen + zeros + strlen(prefix);
   43c4a:	41 89 d5             	mov    %edx,%r13d
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
   43c4d:	85 d2                	test   %edx,%edx
   43c4f:	7e 2b                	jle    43c7c <printer::vprintf(int, char const*, __va_list_tag*)+0x348>
            putc(' ', color);
   43c51:	49 8b 06             	mov    (%r14),%rax
   43c54:	44 89 fa             	mov    %r15d,%edx
   43c57:	be 20 00 00 00       	mov    $0x20,%esi
   43c5c:	4c 89 f7             	mov    %r14,%rdi
   43c5f:	ff 10                	callq  *(%rax)
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
   43c61:	41 83 ed 01          	sub    $0x1,%r13d
   43c65:	45 85 ed             	test   %r13d,%r13d
   43c68:	7f e7                	jg     43c51 <printer::vprintf(int, char const*, __va_list_tag*)+0x31d>
   43c6a:	8b 7d 98             	mov    -0x68(%rbp),%edi
   43c6d:	85 ff                	test   %edi,%edi
   43c6f:	b8 01 00 00 00       	mov    $0x1,%eax
   43c74:	0f 4f c7             	cmovg  %edi,%eax
   43c77:	29 c7                	sub    %eax,%edi
   43c79:	89 7d 9c             	mov    %edi,-0x64(%rbp)
        }
        for (; *prefix; ++prefix) {
   43c7c:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
   43c80:	0f b6 00             	movzbl (%rax),%eax
   43c83:	4c 8b 6d a8          	mov    -0x58(%rbp),%r13
   43c87:	84 c0                	test   %al,%al
   43c89:	74 1b                	je     43ca6 <printer::vprintf(int, char const*, __va_list_tag*)+0x372>
            putc(*prefix, color);
   43c8b:	0f b6 f0             	movzbl %al,%esi
   43c8e:	49 8b 06             	mov    (%r14),%rax
   43c91:	44 89 fa             	mov    %r15d,%edx
   43c94:	4c 89 f7             	mov    %r14,%rdi
   43c97:	ff 10                	callq  *(%rax)
        for (; *prefix; ++prefix) {
   43c99:	49 83 c5 01          	add    $0x1,%r13
   43c9d:	41 0f b6 45 00       	movzbl 0x0(%r13),%eax
   43ca2:	84 c0                	test   %al,%al
   43ca4:	75 e5                	jne    43c8b <printer::vprintf(int, char const*, __va_list_tag*)+0x357>
        }
        for (; zeros > 0; --zeros) {
   43ca6:	44 8b 6d a4          	mov    -0x5c(%rbp),%r13d
   43caa:	83 7d a4 00          	cmpl   $0x0,-0x5c(%rbp)
   43cae:	7e 16                	jle    43cc6 <printer::vprintf(int, char const*, __va_list_tag*)+0x392>
            putc('0', color);
   43cb0:	49 8b 06             	mov    (%r14),%rax
   43cb3:	44 89 fa             	mov    %r15d,%edx
   43cb6:	be 30 00 00 00       	mov    $0x30,%esi
   43cbb:	4c 89 f7             	mov    %r14,%rdi
   43cbe:	ff 10                	callq  *(%rax)
        for (; zeros > 0; --zeros) {
   43cc0:	41 83 ed 01          	sub    $0x1,%r13d
   43cc4:	75 ea                	jne    43cb0 <printer::vprintf(int, char const*, __va_list_tag*)+0x37c>
        }
        for (; datalen > 0; ++data, --datalen) {
   43cc6:	83 7d a0 00          	cmpl   $0x0,-0x60(%rbp)
   43cca:	7e 22                	jle    43cee <printer::vprintf(int, char const*, __va_list_tag*)+0x3ba>
   43ccc:	8b 45 a0             	mov    -0x60(%rbp),%eax
   43ccf:	8d 40 ff             	lea    -0x1(%rax),%eax
   43cd2:	4c 8d 6c 03 01       	lea    0x1(%rbx,%rax,1),%r13
            putc(*data, color);
   43cd7:	0f b6 33             	movzbl (%rbx),%esi
   43cda:	49 8b 06             	mov    (%r14),%rax
   43cdd:	44 89 fa             	mov    %r15d,%edx
   43ce0:	4c 89 f7             	mov    %r14,%rdi
   43ce3:	ff 10                	callq  *(%rax)
        for (; datalen > 0; ++data, --datalen) {
   43ce5:	48 83 c3 01          	add    $0x1,%rbx
   43ce9:	4c 39 eb             	cmp    %r13,%rbx
   43cec:	75 e9                	jne    43cd7 <printer::vprintf(int, char const*, __va_list_tag*)+0x3a3>
        }
        for (; width > 0; --width) {
   43cee:	8b 5d 9c             	mov    -0x64(%rbp),%ebx
   43cf1:	83 7d 9c 00          	cmpl   $0x0,-0x64(%rbp)
   43cf5:	7e 15                	jle    43d0c <printer::vprintf(int, char const*, __va_list_tag*)+0x3d8>
            putc(' ', color);
   43cf7:	49 8b 06             	mov    (%r14),%rax
   43cfa:	44 89 fa             	mov    %r15d,%edx
   43cfd:	be 20 00 00 00       	mov    $0x20,%esi
   43d02:	4c 89 f7             	mov    %r14,%rdi
   43d05:	ff 10                	callq  *(%rax)
        for (; width > 0; --width) {
   43d07:	83 eb 01             	sub    $0x1,%ebx
   43d0a:	75 eb                	jne    43cf7 <printer::vprintf(int, char const*, __va_list_tag*)+0x3c3>
    for (; *format; ++format) {
   43d0c:	49 8d 5c 24 01       	lea    0x1(%r12),%rbx
   43d11:	41 0f b6 44 24 01    	movzbl 0x1(%r12),%eax
   43d17:	84 c0                	test   %al,%al
   43d19:	0f 84 ff 03 00 00    	je     4411e <printer::vprintf(int, char const*, __va_list_tag*)+0x7ea>
        if (*format != '%') {
   43d1f:	3c 25                	cmp    $0x25,%al
   43d21:	0f 84 3f fc ff ff    	je     43966 <printer::vprintf(int, char const*, __va_list_tag*)+0x32>
            putc(*format, color);
   43d27:	0f b6 f0             	movzbl %al,%esi
   43d2a:	49 8b 06             	mov    (%r14),%rax
   43d2d:	44 89 fa             	mov    %r15d,%edx
   43d30:	4c 89 f7             	mov    %r14,%rdi
   43d33:	ff 10                	callq  *(%rax)
            continue;
   43d35:	49 89 dc             	mov    %rbx,%r12
   43d38:	eb d2                	jmp    43d0c <printer::vprintf(int, char const*, __va_list_tag*)+0x3d8>
            long x = length ? va_arg(val, long) : va_arg(val, int);
   43d3a:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   43d3e:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   43d42:	48 8d 42 08          	lea    0x8(%rdx),%rax
   43d46:	48 89 47 08          	mov    %rax,0x8(%rdi)
   43d4a:	e9 2d fe ff ff       	jmpq   43b7c <printer::vprintf(int, char const*, __va_list_tag*)+0x248>
        switch (*format) {
   43d4f:	49 89 cc             	mov    %rcx,%r12
            long x = length ? va_arg(val, long) : va_arg(val, int);
   43d52:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   43d56:	8b 01                	mov    (%rcx),%eax
   43d58:	83 f8 2f             	cmp    $0x2f,%eax
   43d5b:	77 13                	ja     43d70 <printer::vprintf(int, char const*, __va_list_tag*)+0x43c>
   43d5d:	89 c2                	mov    %eax,%edx
   43d5f:	48 03 51 10          	add    0x10(%rcx),%rdx
   43d63:	83 c0 08             	add    $0x8,%eax
   43d66:	89 01                	mov    %eax,(%rcx)
   43d68:	48 63 12             	movslq (%rdx),%rdx
   43d6b:	e9 12 fe ff ff       	jmpq   43b82 <printer::vprintf(int, char const*, __va_list_tag*)+0x24e>
   43d70:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   43d74:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   43d78:	48 8d 42 08          	lea    0x8(%rdx),%rax
   43d7c:	48 89 41 08          	mov    %rax,0x8(%rcx)
   43d80:	eb e6                	jmp    43d68 <printer::vprintf(int, char const*, __va_list_tag*)+0x434>
        switch (*format) {
   43d82:	49 89 cc             	mov    %rcx,%r12
   43d85:	b8 01 00 00 00       	mov    $0x1,%eax
   43d8a:	be 0a 00 00 00       	mov    $0xa,%esi
   43d8f:	e9 a8 00 00 00       	jmpq   43e3c <printer::vprintf(int, char const*, __va_list_tag*)+0x508>
   43d94:	49 89 cc             	mov    %rcx,%r12
   43d97:	b8 00 00 00 00       	mov    $0x0,%eax
   43d9c:	be 0a 00 00 00       	mov    $0xa,%esi
   43da1:	e9 96 00 00 00       	jmpq   43e3c <printer::vprintf(int, char const*, __va_list_tag*)+0x508>
        switch (*format) {
   43da6:	b8 00 00 00 00       	mov    $0x0,%eax
   43dab:	be 0a 00 00 00       	mov    $0xa,%esi
   43db0:	e9 87 00 00 00       	jmpq   43e3c <printer::vprintf(int, char const*, __va_list_tag*)+0x508>
   43db5:	b8 00 00 00 00       	mov    $0x0,%eax
   43dba:	be 0a 00 00 00       	mov    $0xa,%esi
   43dbf:	eb 7b                	jmp    43e3c <printer::vprintf(int, char const*, __va_list_tag*)+0x508>
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
   43dc1:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   43dc5:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   43dc9:	48 8d 42 08          	lea    0x8(%rdx),%rax
   43dcd:	48 89 47 08          	mov    %rax,0x8(%rdi)
   43dd1:	e9 84 00 00 00       	jmpq   43e5a <printer::vprintf(int, char const*, __va_list_tag*)+0x526>
   43dd6:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   43dda:	8b 01                	mov    (%rcx),%eax
   43ddc:	83 f8 2f             	cmp    $0x2f,%eax
   43ddf:	77 10                	ja     43df1 <printer::vprintf(int, char const*, __va_list_tag*)+0x4bd>
   43de1:	89 c2                	mov    %eax,%edx
   43de3:	48 03 51 10          	add    0x10(%rcx),%rdx
   43de7:	83 c0 08             	add    $0x8,%eax
   43dea:	89 01                	mov    %eax,(%rcx)
   43dec:	44 8b 02             	mov    (%rdx),%r8d
   43def:	eb 6c                	jmp    43e5d <printer::vprintf(int, char const*, __va_list_tag*)+0x529>
   43df1:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   43df5:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   43df9:	48 8d 42 08          	lea    0x8(%rdx),%rax
   43dfd:	48 89 41 08          	mov    %rax,0x8(%rcx)
   43e01:	eb e9                	jmp    43dec <printer::vprintf(int, char const*, __va_list_tag*)+0x4b8>
   43e03:	41 89 f1             	mov    %esi,%r9d
        if (flags & FLAG_NUMERIC) {
   43e06:	c7 45 9c 20 00 00 00 	movl   $0x20,-0x64(%rbp)
    const char* digits = upper_digits;
   43e0d:	bf 40 57 04 00       	mov    $0x45740,%edi
   43e12:	e9 c0 01 00 00       	jmpq   43fd7 <printer::vprintf(int, char const*, __va_list_tag*)+0x6a3>
        switch (*format) {
   43e17:	49 89 cc             	mov    %rcx,%r12
   43e1a:	b8 01 00 00 00       	mov    $0x1,%eax
   43e1f:	eb 16                	jmp    43e37 <printer::vprintf(int, char const*, __va_list_tag*)+0x503>
   43e21:	49 89 cc             	mov    %rcx,%r12
   43e24:	b8 00 00 00 00       	mov    $0x0,%eax
   43e29:	eb 0c                	jmp    43e37 <printer::vprintf(int, char const*, __va_list_tag*)+0x503>
        switch (*format) {
   43e2b:	b8 00 00 00 00       	mov    $0x0,%eax
   43e30:	eb 05                	jmp    43e37 <printer::vprintf(int, char const*, __va_list_tag*)+0x503>
   43e32:	b8 00 00 00 00       	mov    $0x0,%eax
            base = -16;
   43e37:	be f0 ff ff ff       	mov    $0xfffffff0,%esi
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
   43e3c:	85 c0                	test   %eax,%eax
   43e3e:	74 96                	je     43dd6 <printer::vprintf(int, char const*, __va_list_tag*)+0x4a2>
   43e40:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   43e44:	8b 01                	mov    (%rcx),%eax
   43e46:	83 f8 2f             	cmp    $0x2f,%eax
   43e49:	0f 87 72 ff ff ff    	ja     43dc1 <printer::vprintf(int, char const*, __va_list_tag*)+0x48d>
   43e4f:	89 c2                	mov    %eax,%edx
   43e51:	48 03 51 10          	add    0x10(%rcx),%rdx
   43e55:	83 c0 08             	add    $0x8,%eax
   43e58:	89 01                	mov    %eax,(%rcx)
   43e5a:	4c 8b 02             	mov    (%rdx),%r8
            flags |= FLAG_NUMERIC;
   43e5d:	41 83 cd 20          	or     $0x20,%r13d
    if (base < 0) {
   43e61:	85 f6                	test   %esi,%esi
   43e63:	79 9e                	jns    43e03 <printer::vprintf(int, char const*, __va_list_tag*)+0x4cf>
        base = -base;
   43e65:	41 89 f1             	mov    %esi,%r9d
   43e68:	f7 de                	neg    %esi
   43e6a:	c7 45 9c 20 00 00 00 	movl   $0x20,-0x64(%rbp)
        digits = lower_digits;
   43e71:	bf 20 57 04 00       	mov    $0x45720,%edi
   43e76:	e9 5c 01 00 00       	jmpq   43fd7 <printer::vprintf(int, char const*, __va_list_tag*)+0x6a3>
        switch (*format) {
   43e7b:	49 89 cc             	mov    %rcx,%r12
   43e7e:	b8 01 00 00 00       	mov    $0x1,%eax
   43e83:	eb 16                	jmp    43e9b <printer::vprintf(int, char const*, __va_list_tag*)+0x567>
   43e85:	49 89 cc             	mov    %rcx,%r12
   43e88:	b8 00 00 00 00       	mov    $0x0,%eax
   43e8d:	eb 0c                	jmp    43e9b <printer::vprintf(int, char const*, __va_list_tag*)+0x567>
        switch (*format) {
   43e8f:	b8 00 00 00 00       	mov    $0x0,%eax
   43e94:	eb 05                	jmp    43e9b <printer::vprintf(int, char const*, __va_list_tag*)+0x567>
   43e96:	b8 00 00 00 00       	mov    $0x0,%eax
            base = 16;
   43e9b:	be 10 00 00 00       	mov    $0x10,%esi
            goto format_unsigned;
   43ea0:	eb 9a                	jmp    43e3c <printer::vprintf(int, char const*, __va_list_tag*)+0x508>
        switch (*format) {
   43ea2:	49 89 cc             	mov    %rcx,%r12
            num = (uintptr_t) va_arg(val, void*);
   43ea5:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   43ea9:	8b 01                	mov    (%rcx),%eax
   43eab:	83 f8 2f             	cmp    $0x2f,%eax
   43eae:	77 21                	ja     43ed1 <printer::vprintf(int, char const*, __va_list_tag*)+0x59d>
   43eb0:	89 c2                	mov    %eax,%edx
   43eb2:	48 03 51 10          	add    0x10(%rcx),%rdx
   43eb6:	83 c0 08             	add    $0x8,%eax
   43eb9:	89 01                	mov    %eax,(%rcx)
   43ebb:	4c 8b 02             	mov    (%rdx),%r8
            flags |= FLAG_ALT | FLAG_ALT2 | FLAG_NUMERIC;
   43ebe:	41 81 cd 21 01 00 00 	or     $0x121,%r13d
            base = -16;
   43ec5:	be f0 ff ff ff       	mov    $0xfffffff0,%esi
   43eca:	eb 99                	jmp    43e65 <printer::vprintf(int, char const*, __va_list_tag*)+0x531>
        switch (*format) {
   43ecc:	49 89 cc             	mov    %rcx,%r12
   43ecf:	eb d4                	jmp    43ea5 <printer::vprintf(int, char const*, __va_list_tag*)+0x571>
            num = (uintptr_t) va_arg(val, void*);
   43ed1:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   43ed5:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   43ed9:	48 8d 42 08          	lea    0x8(%rdx),%rax
   43edd:	48 89 47 08          	mov    %rax,0x8(%rdi)
   43ee1:	eb d8                	jmp    43ebb <printer::vprintf(int, char const*, __va_list_tag*)+0x587>
        switch (*format) {
   43ee3:	49 89 cc             	mov    %rcx,%r12
            data = va_arg(val, char*);
   43ee6:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   43eea:	8b 07                	mov    (%rdi),%eax
   43eec:	83 f8 2f             	cmp    $0x2f,%eax
   43eef:	77 1e                	ja     43f0f <printer::vprintf(int, char const*, __va_list_tag*)+0x5db>
   43ef1:	89 c2                	mov    %eax,%edx
   43ef3:	48 03 57 10          	add    0x10(%rdi),%rdx
   43ef7:	83 c0 08             	add    $0x8,%eax
   43efa:	89 07                	mov    %eax,(%rdi)
   43efc:	48 8b 1a             	mov    (%rdx),%rbx
        unsigned long num = 0;
   43eff:	41 b8 00 00 00 00    	mov    $0x0,%r8d
            break;
   43f05:	e9 9a fc ff ff       	jmpq   43ba4 <printer::vprintf(int, char const*, __va_list_tag*)+0x270>
        switch (*format) {
   43f0a:	49 89 cc             	mov    %rcx,%r12
   43f0d:	eb d7                	jmp    43ee6 <printer::vprintf(int, char const*, __va_list_tag*)+0x5b2>
            data = va_arg(val, char*);
   43f0f:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   43f13:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   43f17:	48 8d 42 08          	lea    0x8(%rdx),%rax
   43f1b:	48 89 41 08          	mov    %rax,0x8(%rcx)
   43f1f:	eb db                	jmp    43efc <printer::vprintf(int, char const*, __va_list_tag*)+0x5c8>
        switch (*format) {
   43f21:	49 89 cc             	mov    %rcx,%r12
            color = va_arg(val, int);
   43f24:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   43f28:	8b 01                	mov    (%rcx),%eax
   43f2a:	83 f8 2f             	cmp    $0x2f,%eax
   43f2d:	77 18                	ja     43f47 <printer::vprintf(int, char const*, __va_list_tag*)+0x613>
   43f2f:	89 c2                	mov    %eax,%edx
   43f31:	48 03 51 10          	add    0x10(%rcx),%rdx
   43f35:	83 c0 08             	add    $0x8,%eax
   43f38:	89 01                	mov    %eax,(%rcx)
   43f3a:	44 8b 3a             	mov    (%rdx),%r15d
            continue;
   43f3d:	e9 ca fd ff ff       	jmpq   43d0c <printer::vprintf(int, char const*, __va_list_tag*)+0x3d8>
        switch (*format) {
   43f42:	49 89 cc             	mov    %rcx,%r12
   43f45:	eb dd                	jmp    43f24 <printer::vprintf(int, char const*, __va_list_tag*)+0x5f0>
            color = va_arg(val, int);
   43f47:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   43f4b:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   43f4f:	48 8d 42 08          	lea    0x8(%rdx),%rax
   43f53:	48 89 47 08          	mov    %rax,0x8(%rdi)
   43f57:	eb e1                	jmp    43f3a <printer::vprintf(int, char const*, __va_list_tag*)+0x606>
        switch (*format) {
   43f59:	49 89 cc             	mov    %rcx,%r12
            numbuf[0] = va_arg(val, int);
   43f5c:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   43f60:	8b 07                	mov    (%rdi),%eax
   43f62:	83 f8 2f             	cmp    $0x2f,%eax
   43f65:	77 28                	ja     43f8f <printer::vprintf(int, char const*, __va_list_tag*)+0x65b>
   43f67:	89 c2                	mov    %eax,%edx
   43f69:	48 03 57 10          	add    0x10(%rdi),%rdx
   43f6d:	83 c0 08             	add    $0x8,%eax
   43f70:	89 07                	mov    %eax,(%rdi)
   43f72:	8b 02                	mov    (%rdx),%eax
   43f74:	88 45 b8             	mov    %al,-0x48(%rbp)
            numbuf[1] = '\0';
   43f77:	c6 45 b9 00          	movb   $0x0,-0x47(%rbp)
            data = numbuf;
   43f7b:	48 8d 5d b8          	lea    -0x48(%rbp),%rbx
        unsigned long num = 0;
   43f7f:	41 b8 00 00 00 00    	mov    $0x0,%r8d
            break;
   43f85:	e9 1a fc ff ff       	jmpq   43ba4 <printer::vprintf(int, char const*, __va_list_tag*)+0x270>
        switch (*format) {
   43f8a:	49 89 cc             	mov    %rcx,%r12
   43f8d:	eb cd                	jmp    43f5c <printer::vprintf(int, char const*, __va_list_tag*)+0x628>
            numbuf[0] = va_arg(val, int);
   43f8f:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   43f93:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   43f97:	48 8d 42 08          	lea    0x8(%rdx),%rax
   43f9b:	48 89 41 08          	mov    %rax,0x8(%rcx)
   43f9f:	eb d1                	jmp    43f72 <printer::vprintf(int, char const*, __va_list_tag*)+0x63e>
        switch (*format) {
   43fa1:	4c 89 e1             	mov    %r12,%rcx
            numbuf[0] = (*format ? *format : '%');
   43fa4:	84 c0                	test   %al,%al
   43fa6:	0f 85 3b 01 00 00    	jne    440e7 <printer::vprintf(int, char const*, __va_list_tag*)+0x7b3>
   43fac:	c6 45 b8 25          	movb   $0x25,-0x48(%rbp)
            numbuf[1] = '\0';
   43fb0:	c6 45 b9 00          	movb   $0x0,-0x47(%rbp)
                format--;
   43fb4:	4c 8d 61 ff          	lea    -0x1(%rcx),%r12
            data = numbuf;
   43fb8:	48 8d 5d b8          	lea    -0x48(%rbp),%rbx
        unsigned long num = 0;
   43fbc:	41 b8 00 00 00 00    	mov    $0x0,%r8d
   43fc2:	e9 dd fb ff ff       	jmpq   43ba4 <printer::vprintf(int, char const*, __va_list_tag*)+0x270>
        if (flags & FLAG_NUMERIC) {
   43fc7:	41 b9 0a 00 00 00    	mov    $0xa,%r9d
    const char* digits = upper_digits;
   43fcd:	bf 40 57 04 00       	mov    $0x45740,%edi
        if (flags & FLAG_NUMERIC) {
   43fd2:	be 0a 00 00 00       	mov    $0xa,%esi
    *--numbuf_end = '\0';
   43fd7:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
   43fdb:	4c 89 c1             	mov    %r8,%rcx
   43fde:	48 8d 5d cf          	lea    -0x31(%rbp),%rbx
        *--numbuf_end = digits[val % base];
   43fe2:	48 63 f6             	movslq %esi,%rsi
   43fe5:	48 83 eb 01          	sub    $0x1,%rbx
   43fe9:	48 89 c8             	mov    %rcx,%rax
   43fec:	ba 00 00 00 00       	mov    $0x0,%edx
   43ff1:	48 f7 f6             	div    %rsi
   43ff4:	0f b6 14 17          	movzbl (%rdi,%rdx,1),%edx
   43ff8:	88 13                	mov    %dl,(%rbx)
        val /= base;
   43ffa:	48 89 ca             	mov    %rcx,%rdx
   43ffd:	48 89 c1             	mov    %rax,%rcx
    } while (val != 0);
   44000:	48 39 d6             	cmp    %rdx,%rsi
   44003:	76 e0                	jbe    43fe5 <printer::vprintf(int, char const*, __va_list_tag*)+0x6b1>
   44005:	e9 af fb ff ff       	jmpq   43bb9 <printer::vprintf(int, char const*, __va_list_tag*)+0x285>
                prefix = "-";
   4400a:	48 c7 45 a8 3d 50 04 	movq   $0x4503d,-0x58(%rbp)
   44011:	00 
            if (flags & FLAG_NEGATIVE) {
   44012:	41 f6 c5 80          	test   $0x80,%r13b
   44016:	0f 85 c7 fb ff ff    	jne    43be3 <printer::vprintf(int, char const*, __va_list_tag*)+0x2af>
                prefix = "+";
   4401c:	48 c7 45 a8 3b 50 04 	movq   $0x4503b,-0x58(%rbp)
   44023:	00 
            } else if (flags & FLAG_PLUSPOSITIVE) {
   44024:	41 f6 c5 10          	test   $0x10,%r13b
   44028:	0f 85 b5 fb ff ff    	jne    43be3 <printer::vprintf(int, char const*, __va_list_tag*)+0x2af>
                prefix = " ";
   4402e:	41 f6 c5 08          	test   $0x8,%r13b
   44032:	ba b7 46 04 00       	mov    $0x446b7,%edx
   44037:	b8 26 49 04 00       	mov    $0x44926,%eax
   4403c:	48 0f 44 c2          	cmove  %rdx,%rax
   44040:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
   44044:	e9 9a fb ff ff       	jmpq   43be3 <printer::vprintf(int, char const*, __va_list_tag*)+0x2af>
                   && (base == 16 || base == -16)
   44049:	41 8d 41 10          	lea    0x10(%r9),%eax
   4404d:	a9 df ff ff ff       	test   $0xffffffdf,%eax
   44052:	0f 85 8b fb ff ff    	jne    43be3 <printer::vprintf(int, char const*, __va_list_tag*)+0x2af>
                   && (num || (flags & FLAG_ALT2))) {
   44058:	4d 85 c0             	test   %r8,%r8
   4405b:	75 0d                	jne    4406a <printer::vprintf(int, char const*, __va_list_tag*)+0x736>
   4405d:	41 f7 c5 00 01 00 00 	test   $0x100,%r13d
   44064:	0f 84 79 fb ff ff    	je     43be3 <printer::vprintf(int, char const*, __va_list_tag*)+0x2af>
            prefix = (base == -16 ? "0x" : "0X");
   4406a:	41 83 f9 f0          	cmp    $0xfffffff0,%r9d
   4406e:	ba 38 50 04 00       	mov    $0x45038,%edx
   44073:	b8 3f 50 04 00       	mov    $0x4503f,%eax
   44078:	48 0f 44 c2          	cmove  %rdx,%rax
   4407c:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
   44080:	e9 5e fb ff ff       	jmpq   43be3 <printer::vprintf(int, char const*, __va_list_tag*)+0x2af>
            datalen = strlen(data);
   44085:	48 89 df             	mov    %rbx,%rdi
   44088:	e8 ea f7 ff ff       	callq  43877 <strlen>
   4408d:	89 45 a0             	mov    %eax,-0x60(%rbp)
            && precision >= 0) {
   44090:	83 7d 9c 00          	cmpl   $0x0,-0x64(%rbp)
   44094:	0f 84 76 fb ff ff    	je     43c10 <printer::vprintf(int, char const*, __va_list_tag*)+0x2dc>
   4409a:	80 7d 88 00          	cmpb   $0x0,-0x78(%rbp)
   4409e:	0f 84 6c fb ff ff    	je     43c10 <printer::vprintf(int, char const*, __va_list_tag*)+0x2dc>
            zeros = precision > datalen ? precision - datalen : 0;
   440a4:	8b 4d a4             	mov    -0x5c(%rbp),%ecx
   440a7:	89 ca                	mov    %ecx,%edx
   440a9:	29 c2                	sub    %eax,%edx
   440ab:	39 c1                	cmp    %eax,%ecx
   440ad:	b8 00 00 00 00       	mov    $0x0,%eax
   440b2:	0f 4f c2             	cmovg  %edx,%eax
   440b5:	89 45 a4             	mov    %eax,-0x5c(%rbp)
   440b8:	e9 69 fb ff ff       	jmpq   43c26 <printer::vprintf(int, char const*, __va_list_tag*)+0x2f2>
                   && datalen + (int) strlen(prefix) < width) {
   440bd:	48 8b 7d a8          	mov    -0x58(%rbp),%rdi
   440c1:	e8 b1 f7 ff ff       	callq  43877 <strlen>
   440c6:	8b 75 a0             	mov    -0x60(%rbp),%esi
   440c9:	8d 14 06             	lea    (%rsi,%rax,1),%edx
            zeros = width - datalen - strlen(prefix);
   440cc:	8b 7d 98             	mov    -0x68(%rbp),%edi
   440cf:	89 f9                	mov    %edi,%ecx
   440d1:	29 f1                	sub    %esi,%ecx
   440d3:	29 c1                	sub    %eax,%ecx
   440d5:	39 fa                	cmp    %edi,%edx
   440d7:	b8 00 00 00 00       	mov    $0x0,%eax
   440dc:	0f 4c c1             	cmovl  %ecx,%eax
   440df:	89 45 a4             	mov    %eax,-0x5c(%rbp)
   440e2:	e9 3f fb ff ff       	jmpq   43c26 <printer::vprintf(int, char const*, __va_list_tag*)+0x2f2>
   440e7:	49 89 cc             	mov    %rcx,%r12
            numbuf[0] = (*format ? *format : '%');
   440ea:	88 45 b8             	mov    %al,-0x48(%rbp)
            numbuf[1] = '\0';
   440ed:	c6 45 b9 00          	movb   $0x0,-0x47(%rbp)
            data = numbuf;
   440f1:	48 8d 5d b8          	lea    -0x48(%rbp),%rbx
        unsigned long num = 0;
   440f5:	41 b8 00 00 00 00    	mov    $0x0,%r8d
   440fb:	e9 a4 fa ff ff       	jmpq   43ba4 <printer::vprintf(int, char const*, __va_list_tag*)+0x270>
        int flags = 0;
   44100:	41 bd 00 00 00 00    	mov    $0x0,%r13d
   44106:	e9 a4 f8 ff ff       	jmpq   439af <printer::vprintf(int, char const*, __va_list_tag*)+0x7b>
        switch (*format) {
   4410b:	8d 50 bd             	lea    -0x43(%rax),%edx
   4410e:	80 fa 35             	cmp    $0x35,%dl
   44111:	77 d7                	ja     440ea <printer::vprintf(int, char const*, __va_list_tag*)+0x7b6>
   44113:	0f b6 d2             	movzbl %dl,%edx
   44116:	3e ff 24 d5 60 55 04 	notrack jmpq *0x45560(,%rdx,8)
   4411d:	00 
        }
    }
}
   4411e:	48 83 c4 58          	add    $0x58,%rsp
   44122:	5b                   	pop    %rbx
   44123:	41 5c                	pop    %r12
   44125:	41 5d                	pop    %r13
   44127:	41 5e                	pop    %r14
   44129:	41 5f                	pop    %r15
   4412b:	5d                   	pop    %rbp
   4412c:	c3                   	retq   

000000000004412d <console_clear()>:


// console_clear
//    Erases the console and moves the cursor to the upper left (CPOS(0, 0)).

void console_clear() {
   4412d:	f3 0f 1e fa          	endbr64 
    for (int i = 0; i < CONSOLE_ROWS * CONSOLE_COLUMNS; ++i) {
   44131:	b8 00 80 0b 00       	mov    $0xb8000,%eax
   44136:	ba a0 8f 0b 00       	mov    $0xb8fa0,%edx
        console[i] = ' ' | 0x0700;
   4413b:	66 c7 00 20 07       	movw   $0x720,(%rax)
    for (int i = 0; i < CONSOLE_ROWS * CONSOLE_COLUMNS; ++i) {
   44140:	48 83 c0 02          	add    $0x2,%rax
   44144:	48 39 d0             	cmp    %rdx,%rax
   44147:	75 f2                	jne    4413b <console_clear()+0xe>
    }
    cursorpos = 0;
   44149:	c7 05 a9 4e 07 00 00 	movl   $0x0,0x74ea9(%rip)        # b8ffc <cursorpos>
   44150:	00 00 00 
}
   44153:	c3                   	retq   

0000000000044154 <console_printer::console_printer(int, bool)>:
    void scroll();
    void move_cursor();
};

__noinline
console_printer::console_printer(int cpos, bool scroll)
   44154:	f3 0f 1e fa          	endbr64 
    : cell_(console), scroll_(scroll) {
   44158:	48 c7 07 c8 57 04 00 	movq   $0x457c8,(%rdi)
   4415f:	48 c7 47 08 00 80 0b 	movq   $0xb8000,0x8(%rdi)
   44166:	00 
   44167:	88 57 10             	mov    %dl,0x10(%rdi)
    if (cpos < 0) {
   4416a:	85 f6                	test   %esi,%esi
   4416c:	78 18                	js     44186 <console_printer::console_printer(int, bool)+0x32>
        cell_ += cursorpos;
    } else if (cpos <= CONSOLE_ROWS * CONSOLE_COLUMNS) {
   4416e:	81 fe d0 07 00 00    	cmp    $0x7d0,%esi
   44174:	7f 0f                	jg     44185 <console_printer::console_printer(int, bool)+0x31>
        cell_ += cpos;
   44176:	48 63 f6             	movslq %esi,%rsi
   44179:	48 8d 84 36 00 80 0b 	lea    0xb8000(%rsi,%rsi,1),%rax
   44180:	00 
   44181:	48 89 47 08          	mov    %rax,0x8(%rdi)
    }
}
   44185:	c3                   	retq   
        cell_ += cursorpos;
   44186:	8b 05 70 4e 07 00    	mov    0x74e70(%rip),%eax        # b8ffc <cursorpos>
   4418c:	48 98                	cltq   
   4418e:	48 8d 84 00 00 80 0b 	lea    0xb8000(%rax,%rax,1),%rax
   44195:	00 
   44196:	48 89 47 08          	mov    %rax,0x8(%rdi)
   4419a:	c3                   	retq   
   4419b:	90                   	nop

000000000004419c <console_printer::scroll()>:

__noinline
void console_printer::scroll() {
   4419c:	f3 0f 1e fa          	endbr64 
   441a0:	55                   	push   %rbp
   441a1:	48 89 e5             	mov    %rsp,%rbp
   441a4:	53                   	push   %rbx
   441a5:	48 83 ec 08          	sub    $0x8,%rsp
    assert(cell_ >= console + CONSOLE_ROWS * CONSOLE_COLUMNS);
   441a9:	48 81 7f 08 a0 8f 0b 	cmpq   $0xb8fa0,0x8(%rdi)
   441b0:	00 
   441b1:	72 18                	jb     441cb <console_printer::scroll()+0x2f>
   441b3:	48 89 fb             	mov    %rdi,%rbx
    if (scroll_) {
   441b6:	80 7f 10 00          	cmpb   $0x0,0x10(%rdi)
   441ba:	75 28                	jne    441e4 <console_printer::scroll()+0x48>
                (CONSOLE_ROWS - 1) * CONSOLE_COLUMNS * sizeof(*console));
        memset(console + (CONSOLE_ROWS - 1) * CONSOLE_COLUMNS,
               0, CONSOLE_COLUMNS * sizeof(*console));
        cell_ -= CONSOLE_COLUMNS;
    } else {
        cell_ = console;
   441bc:	48 c7 47 08 00 80 0b 	movq   $0xb8000,0x8(%rdi)
   441c3:	00 
    }
}
   441c4:	48 83 c4 08          	add    $0x8,%rsp
   441c8:	5b                   	pop    %rbx
   441c9:	5d                   	pop    %rbp
   441ca:	c3                   	retq   
    assert(cell_ >= console + CONSOLE_ROWS * CONSOLE_COLUMNS);
   441cb:	b9 00 00 00 00       	mov    $0x0,%ecx
   441d0:	ba 58 57 04 00       	mov    $0x45758,%edx
   441d5:	be 2c 02 00 00       	mov    $0x22c,%esi
   441da:	bf 31 50 04 00       	mov    $0x45031,%edi
   441df:	e8 b9 de ff ff       	callq  4209d <assert_fail(char const*, int, char const*, char const*)>
        memmove(console, console + CONSOLE_COLUMNS,
   441e4:	ba 00 0f 00 00       	mov    $0xf00,%edx
   441e9:	be a0 80 0b 00       	mov    $0xb80a0,%esi
   441ee:	bf 00 80 0b 00       	mov    $0xb8000,%edi
   441f3:	e8 12 f6 ff ff       	callq  4380a <memmove>
        memset(console + (CONSOLE_ROWS - 1) * CONSOLE_COLUMNS,
   441f8:	ba a0 00 00 00       	mov    $0xa0,%edx
   441fd:	be 00 00 00 00       	mov    $0x0,%esi
   44202:	bf 00 8f 0b 00       	mov    $0xb8f00,%edi
   44207:	e8 4b f6 ff ff       	callq  43857 <memset>
        cell_ -= CONSOLE_COLUMNS;
   4420c:	48 81 6b 08 a0 00 00 	subq   $0xa0,0x8(%rbx)
   44213:	00 
   44214:	eb ae                	jmp    441c4 <console_printer::scroll()+0x28>

0000000000044216 <console_printer::putc(unsigned char, int)>:
    extern void console_show_cursor(int);
    console_show_cursor(cursorpos);
#endif
}

inline void console_printer::putc(unsigned char c, int color) {
   44216:	f3 0f 1e fa          	endbr64 
   4421a:	55                   	push   %rbp
   4421b:	48 89 e5             	mov    %rsp,%rbp
   4421e:	41 55                	push   %r13
   44220:	41 54                	push   %r12
   44222:	53                   	push   %rbx
   44223:	48 83 ec 08          	sub    $0x8,%rsp
   44227:	48 89 fb             	mov    %rdi,%rbx
   4422a:	41 89 f5             	mov    %esi,%r13d
   4422d:	41 89 d4             	mov    %edx,%r12d
    while (cell_ >= console + CONSOLE_ROWS * CONSOLE_COLUMNS) {
   44230:	48 8b 47 08          	mov    0x8(%rdi),%rax
   44234:	48 3d a0 8f 0b 00    	cmp    $0xb8fa0,%rax
   4423a:	72 14                	jb     44250 <console_printer::putc(unsigned char, int)+0x3a>
        scroll();
   4423c:	48 89 df             	mov    %rbx,%rdi
   4423f:	e8 58 ff ff ff       	callq  4419c <console_printer::scroll()>
    while (cell_ >= console + CONSOLE_ROWS * CONSOLE_COLUMNS) {
   44244:	48 8b 43 08          	mov    0x8(%rbx),%rax
   44248:	48 3d a0 8f 0b 00    	cmp    $0xb8fa0,%rax
   4424e:	73 ec                	jae    4423c <console_printer::putc(unsigned char, int)+0x26>
    }
    if (c == '\n') {
   44250:	41 80 fd 0a          	cmp    $0xa,%r13b
   44254:	74 1e                	je     44274 <console_printer::putc(unsigned char, int)+0x5e>
        while (pos != 80) {
            *cell_++ = ' ' | color;
            ++pos;
        }
    } else {
        *cell_++ = c | color;
   44256:	48 8d 50 02          	lea    0x2(%rax),%rdx
   4425a:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   4425e:	45 0f b6 ed          	movzbl %r13b,%r13d
   44262:	45 09 ec             	or     %r13d,%r12d
   44265:	66 44 89 20          	mov    %r12w,(%rax)
    }
}
   44269:	48 83 c4 08          	add    $0x8,%rsp
   4426d:	5b                   	pop    %rbx
   4426e:	41 5c                	pop    %r12
   44270:	41 5d                	pop    %r13
   44272:	5d                   	pop    %rbp
   44273:	c3                   	retq   
        int pos = (cell_ - console) % 80;
   44274:	48 2d 00 80 0b 00    	sub    $0xb8000,%rax
   4427a:	48 89 c1             	mov    %rax,%rcx
   4427d:	48 89 c6             	mov    %rax,%rsi
   44280:	48 d1 fe             	sar    %rsi
   44283:	48 ba 67 66 66 66 66 	movabs $0x6666666666666667,%rdx
   4428a:	66 66 66 
   4428d:	48 89 f0             	mov    %rsi,%rax
   44290:	48 f7 ea             	imul   %rdx
   44293:	48 c1 fa 05          	sar    $0x5,%rdx
   44297:	48 89 c8             	mov    %rcx,%rax
   4429a:	48 c1 f8 3f          	sar    $0x3f,%rax
   4429e:	48 29 c2             	sub    %rax,%rdx
   442a1:	48 8d 04 92          	lea    (%rdx,%rdx,4),%rax
   442a5:	48 c1 e0 04          	shl    $0x4,%rax
   442a9:	89 f2                	mov    %esi,%edx
   442ab:	29 c2                	sub    %eax,%edx
   442ad:	89 d0                	mov    %edx,%eax
            *cell_++ = ' ' | color;
   442af:	41 83 cc 20          	or     $0x20,%r12d
   442b3:	48 8b 4b 08          	mov    0x8(%rbx),%rcx
   442b7:	48 8d 71 02          	lea    0x2(%rcx),%rsi
   442bb:	48 89 73 08          	mov    %rsi,0x8(%rbx)
   442bf:	66 44 89 21          	mov    %r12w,(%rcx)
            ++pos;
   442c3:	83 c0 01             	add    $0x1,%eax
        while (pos != 80) {
   442c6:	83 f8 50             	cmp    $0x50,%eax
   442c9:	75 e8                	jne    442b3 <console_printer::putc(unsigned char, int)+0x9d>
   442cb:	eb 9c                	jmp    44269 <console_printer::putc(unsigned char, int)+0x53>
   442cd:	90                   	nop

00000000000442ce <console_printer::move_cursor()>:
void console_printer::move_cursor() {
   442ce:	f3 0f 1e fa          	endbr64 
   442d2:	55                   	push   %rbp
   442d3:	48 89 e5             	mov    %rsp,%rbp
    cursorpos = cell_ - console;
   442d6:	48 8b 47 08          	mov    0x8(%rdi),%rax
   442da:	48 2d 00 80 0b 00    	sub    $0xb8000,%rax
   442e0:	48 d1 f8             	sar    %rax
   442e3:	89 05 13 4d 07 00    	mov    %eax,0x74d13(%rip)        # b8ffc <cursorpos>
    console_show_cursor(cursorpos);
   442e9:	8b 3d 0d 4d 07 00    	mov    0x74d0d(%rip),%edi        # b8ffc <cursorpos>
   442ef:	e8 d3 d8 ff ff       	callq  41bc7 <console_show_cursor(int)>
}
   442f4:	5d                   	pop    %rbp
   442f5:	c3                   	retq   

00000000000442f6 <console_vprintf(int, int, char const*, __va_list_tag*)>:

// console_vprintf, console_printf
//    Print a message onto the console, starting at the given cursor position.

__noinline
int console_vprintf(int cpos, int color, const char* format, va_list val) {
   442f6:	f3 0f 1e fa          	endbr64 
   442fa:	55                   	push   %rbp
   442fb:	48 89 e5             	mov    %rsp,%rbp
   442fe:	41 56                	push   %r14
   44300:	41 55                	push   %r13
   44302:	41 54                	push   %r12
   44304:	53                   	push   %rbx
   44305:	48 83 ec 20          	sub    $0x20,%rsp
   44309:	89 fb                	mov    %edi,%ebx
   4430b:	41 89 f4             	mov    %esi,%r12d
   4430e:	49 89 d5             	mov    %rdx,%r13
   44311:	49 89 ce             	mov    %rcx,%r14
    console_printer cp(cpos, cpos < 0);
   44314:	89 fa                	mov    %edi,%edx
   44316:	c1 ea 1f             	shr    $0x1f,%edx
   44319:	89 fe                	mov    %edi,%esi
   4431b:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
   4431f:	e8 30 fe ff ff       	callq  44154 <console_printer::console_printer(int, bool)>
    cp.vprintf(color, format, val);
   44324:	4c 89 f1             	mov    %r14,%rcx
   44327:	4c 89 ea             	mov    %r13,%rdx
   4432a:	44 89 e6             	mov    %r12d,%esi
   4432d:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
   44331:	e8 fe f5 ff ff       	callq  43934 <printer::vprintf(int, char const*, __va_list_tag*)>
    if (cpos < 0) {
   44336:	85 db                	test   %ebx,%ebx
   44338:	78 1a                	js     44354 <console_vprintf(int, int, char const*, __va_list_tag*)+0x5e>
        cp.move_cursor();
    }
    return cp.cell_ - console;
   4433a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   4433e:	48 2d 00 80 0b 00    	sub    $0xb8000,%rax
   44344:	48 d1 f8             	sar    %rax
}
   44347:	48 83 c4 20          	add    $0x20,%rsp
   4434b:	5b                   	pop    %rbx
   4434c:	41 5c                	pop    %r12
   4434e:	41 5d                	pop    %r13
   44350:	41 5e                	pop    %r14
   44352:	5d                   	pop    %rbp
   44353:	c3                   	retq   
        cp.move_cursor();
   44354:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
   44358:	e8 71 ff ff ff       	callq  442ce <console_printer::move_cursor()>
   4435d:	eb db                	jmp    4433a <console_vprintf(int, int, char const*, __va_list_tag*)+0x44>

000000000004435f <console_printf(int, int, char const*, ...)>:

__noinline
int console_printf(int cpos, int color, const char* format, ...) {
   4435f:	f3 0f 1e fa          	endbr64 
   44363:	55                   	push   %rbp
   44364:	48 89 e5             	mov    %rsp,%rbp
   44367:	48 83 ec 50          	sub    $0x50,%rsp
   4436b:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   4436f:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   44373:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
   44377:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
   4437e:	48 8d 45 10          	lea    0x10(%rbp),%rax
   44382:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   44386:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   4438a:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    cpos = console_vprintf(cpos, color, format, val);
   4438e:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
   44392:	e8 5f ff ff ff       	callq  442f6 <console_vprintf(int, int, char const*, __va_list_tag*)>
    va_end(val);
    return cpos;
}
   44397:	c9                   	leaveq 
   44398:	c3                   	retq   

0000000000044399 <error_printf(int, int, char const*, ...)>:


// k-hardware.cc/u-lib.cc supply error_vprintf

__noinline
int error_printf(int cpos, int color, const char* format, ...) {
   44399:	f3 0f 1e fa          	endbr64 
   4439d:	55                   	push   %rbp
   4439e:	48 89 e5             	mov    %rsp,%rbp
   443a1:	48 83 ec 50          	sub    $0x50,%rsp
   443a5:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   443a9:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   443ad:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
   443b1:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
   443b8:	48 8d 45 10          	lea    0x10(%rbp),%rax
   443bc:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   443c0:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   443c4:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    cpos = error_vprintf(cpos, color, format, val);
   443c8:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
   443cc:	e8 67 db ff ff       	callq  41f38 <error_vprintf(int, int, char const*, __va_list_tag*)>
    va_end(val);
    return cpos;
}
   443d1:	c9                   	leaveq 
   443d2:	c3                   	retq   

00000000000443d3 <error_printf(char const*, ...)>:
    error_vprintf(-1, color, format, val);
    va_end(val);
}

__noinline
void error_printf(const char* format, ...) {
   443d3:	f3 0f 1e fa          	endbr64 
   443d7:	55                   	push   %rbp
   443d8:	48 89 e5             	mov    %rsp,%rbp
   443db:	48 83 ec 50          	sub    $0x50,%rsp
   443df:	48 89 75 d8          	mov    %rsi,-0x28(%rbp)
   443e3:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
   443e7:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   443eb:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   443ef:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
   443f3:	c7 45 b8 08 00 00 00 	movl   $0x8,-0x48(%rbp)
   443fa:	48 8d 45 10          	lea    0x10(%rbp),%rax
   443fe:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   44402:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   44406:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    error_vprintf(-1, COLOR_ERROR, format, val);
   4440a:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
   4440e:	48 89 fa             	mov    %rdi,%rdx
   44411:	be 00 c0 00 00       	mov    $0xc000,%esi
   44416:	bf ff ff ff ff       	mov    $0xffffffff,%edi
   4441b:	e8 18 db ff ff       	callq  41f38 <error_vprintf(int, int, char const*, __va_list_tag*)>
    va_end(val);
}
   44420:	c9                   	leaveq 
   44421:	c3                   	retq   

0000000000044422 <memory_foreach>:
#include "util.h"

extern "C" {
    void memory_foreach(x86_64_pagetable *table, uintptr_t upper_bound, iteration_func_t iter) {
   44422:	f3 0f 1e fa          	endbr64 
   44426:	55                   	push   %rbp
   44427:	48 89 e5             	mov    %rsp,%rbp
   4442a:	41 55                	push   %r13
   4442c:	41 54                	push   %r12
   4442e:	53                   	push   %rbx
   4442f:	48 83 ec 28          	sub    $0x28,%rsp
   44433:	48 89 fb             	mov    %rdi,%rbx
   44436:	49 89 f4             	mov    %rsi,%r12
   44439:	49 89 d5             	mov    %rdx,%r13
    : pt_(pt), pep_(&pt_->entry[0]), level_(3), perm_(initial_perm), va_(0) {
   4443c:	48 89 7d c0          	mov    %rdi,-0x40(%rbp)
   44440:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
   44444:	c7 45 d0 03 00 00 00 	movl   $0x3,-0x30(%rbp)
   4444b:	c7 45 d4 ff 0f 00 00 	movl   $0xfff,-0x2c(%rbp)
   44452:	48 c7 45 d8 00 00 00 	movq   $0x0,-0x28(%rbp)
   44459:	00 
    real_find(va);
   4445a:	be 00 00 00 00       	mov    $0x0,%esi
   4445f:	48 8d 7d c0          	lea    -0x40(%rbp),%rdi
   44463:	e8 c0 cf ff ff       	callq  41428 <vmiter::real_find(unsigned long)>
    return va_;
   44468:	48 8b 75 d8          	mov    -0x28(%rbp),%rsi
        for (vmiter it(table, 0); it.va() < upper_bound; it += PAGESIZE) {
   4446c:	49 39 f4             	cmp    %rsi,%r12
   4446f:	76 27                	jbe    44498 <memory_foreach+0x76>
            bool ret = iter(table, it.va());
   44471:	48 89 df             	mov    %rbx,%rdi
   44474:	41 ff d5             	callq  *%r13
            if (!ret) {
   44477:	84 c0                	test   %al,%al
   44479:	74 1d                	je     44498 <memory_foreach+0x76>
    return find(va_ + delta);
   4447b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   4447f:	48 8d b0 00 10 00 00 	lea    0x1000(%rax),%rsi
    real_find(va);
   44486:	48 8d 7d c0          	lea    -0x40(%rbp),%rdi
   4448a:	e8 99 cf ff ff       	callq  41428 <vmiter::real_find(unsigned long)>
    return va_;
   4448f:	48 8b 75 d8          	mov    -0x28(%rbp),%rsi
        for (vmiter it(table, 0); it.va() < upper_bound; it += PAGESIZE) {
   44493:	4c 39 e6             	cmp    %r12,%rsi
   44496:	72 d9                	jb     44471 <memory_foreach+0x4f>
                break;
            }
        }
    }
   44498:	48 83 c4 28          	add    $0x28,%rsp
   4449c:	5b                   	pop    %rbx
   4449d:	41 5c                	pop    %r12
   4449f:	41 5d                	pop    %r13
   444a1:	5d                   	pop    %rbp
   444a2:	c3                   	retq   

00000000000444a3 <memory_map>:

    int memory_map(x86_64_pagetable *table, uintptr_t virtual_address, uintptr_t physical_address, int permissions) {
   444a3:	f3 0f 1e fa          	endbr64 
   444a7:	55                   	push   %rbp
   444a8:	48 89 e5             	mov    %rsp,%rbp
   444ab:	41 54                	push   %r12
   444ad:	53                   	push   %rbx
   444ae:	48 83 ec 20          	sub    $0x20,%rsp
   444b2:	48 89 d3             	mov    %rdx,%rbx
   444b5:	41 89 cc             	mov    %ecx,%r12d
    : pt_(pt), pep_(&pt_->entry[0]), level_(3), perm_(initial_perm), va_(0) {
   444b8:	48 89 7d d0          	mov    %rdi,-0x30(%rbp)
   444bc:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
   444c0:	c7 45 e0 03 00 00 00 	movl   $0x3,-0x20(%rbp)
   444c7:	c7 45 e4 ff 0f 00 00 	movl   $0xfff,-0x1c(%rbp)
   444ce:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
   444d5:	00 
    real_find(va);
   444d6:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
   444da:	e8 49 cf ff ff       	callq  41428 <vmiter::real_find(unsigned long)>
        return vmiter(table, virtual_address).try_map(physical_address, permissions);
   444df:	44 89 e2             	mov    %r12d,%edx
   444e2:	48 89 de             	mov    %rbx,%rsi
   444e5:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
   444e9:	e8 52 d1 ff ff       	callq  41640 <vmiter::try_map(unsigned long, int)>
    }
   444ee:	48 83 c4 20          	add    $0x20,%rsp
   444f2:	5b                   	pop    %rbx
   444f3:	41 5c                	pop    %r12
   444f5:	5d                   	pop    %rbp
   444f6:	c3                   	retq   

00000000000444f7 <memory_virtual_to_physical>:

    void * memory_virtual_to_physical(x86_64_pagetable *table, uintptr_t virtual_address) {
   444f7:	f3 0f 1e fa          	endbr64 
   444fb:	55                   	push   %rbp
   444fc:	48 89 e5             	mov    %rsp,%rbp
   444ff:	48 83 ec 20          	sub    $0x20,%rsp
    : pt_(pt), pep_(&pt_->entry[0]), level_(3), perm_(initial_perm), va_(0) {
   44503:	48 89 7d e0          	mov    %rdi,-0x20(%rbp)
   44507:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   4450b:	c7 45 f0 03 00 00 00 	movl   $0x3,-0x10(%rbp)
   44512:	c7 45 f4 ff 0f 00 00 	movl   $0xfff,-0xc(%rbp)
   44519:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
   44520:	00 
    real_find(va);
   44521:	48 8d 7d e0          	lea    -0x20(%rbp),%rdi
   44525:	e8 fe ce ff ff       	callq  41428 <vmiter::real_find(unsigned long)>
    if (*pep_ & PTE_P) {
   4452a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4452e:	48 8b 08             	mov    (%rax),%rcx
        return -1;
   44531:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
    if (*pep_ & PTE_P) {
   44538:	f6 c1 01             	test   $0x1,%cl
   4453b:	74 33                	je     44570 <memory_virtual_to_physical+0x79>
        if (level_ > 0) {
   4453d:	8b 55 f0             	mov    -0x10(%rbp),%edx
            pa &= ~0x1000UL;
   44540:	48 b8 00 e0 ff ff ff 	movabs $0xfffffffffe000,%rax
   44547:	ff 0f 00 
   4454a:	48 21 c8             	and    %rcx,%rax
   4454d:	48 89 c6             	mov    %rax,%rsi
        if (level_ > 0) {
   44550:	85 d2                	test   %edx,%edx
   44552:	7e 1e                	jle    44572 <memory_virtual_to_physical+0x7b>
   44554:	8d 4c d2 0c          	lea    0xc(%rdx,%rdx,8),%ecx
        return pa + (va_ & pageoffmask(level_));
   44558:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
   4455f:	48 d3 e2             	shl    %cl,%rdx
   44562:	48 89 d0             	mov    %rdx,%rax
   44565:	48 f7 d0             	not    %rax
   44568:	48 23 45 f8          	and    -0x8(%rbp),%rax
   4456c:	48 8d 04 30          	lea    (%rax,%rsi,1),%rax
        return (void *)vmiter(table, virtual_address).pa();
    }
   44570:	c9                   	leaveq 
   44571:	c3                   	retq   
        uintptr_t pa = *pep_ & PTE_PAMASK;
   44572:	48 b8 00 f0 ff ff ff 	movabs $0xffffffffff000,%rax
   44579:	ff 0f 00 
   4457c:	48 21 c1             	and    %rax,%rcx
   4457f:	48 89 ce             	mov    %rcx,%rsi
   44582:	eb d0                	jmp    44554 <memory_virtual_to_physical+0x5d>

0000000000044584 <map_to_nobody>:
    uintptr_t memory_permissions(x86_64_pagetable *table, uintptr_t virtual_address) {
        return vmiter(table, virtual_address).perm();
    }


    bool map_to_nobody(x86_64_pagetable *table, uintptr_t va) {
   44584:	f3 0f 1e fa          	endbr64 
   44588:	55                   	push   %rbp
   44589:	48 89 e5             	mov    %rsp,%rbp
       memory_map(table, va, va, 0); 
   4458c:	b9 00 00 00 00       	mov    $0x0,%ecx
   44591:	48 89 f2             	mov    %rsi,%rdx
   44594:	e8 0a ff ff ff       	callq  444a3 <memory_map>
       return true;
    }
   44599:	b8 01 00 00 00       	mov    $0x1,%eax
   4459e:	5d                   	pop    %rbp
   4459f:	c3                   	retq   

00000000000445a0 <map_to_kernel_space>:

    bool map_to_kernel_space(x86_64_pagetable *table, uintptr_t va) {
   445a0:	f3 0f 1e fa          	endbr64 
   445a4:	55                   	push   %rbp
   445a5:	48 89 e5             	mov    %rsp,%rbp
       memory_map(table, va, va, PTE_P | PTE_W); 
   445a8:	b9 03 00 00 00       	mov    $0x3,%ecx
   445ad:	48 89 f2             	mov    %rsi,%rdx
   445b0:	e8 ee fe ff ff       	callq  444a3 <memory_map>
       return true;
    }
   445b5:	b8 01 00 00 00       	mov    $0x1,%eax
   445ba:	5d                   	pop    %rbp
   445bb:	c3                   	retq   

00000000000445bc <map_to_user_space>:

    bool map_to_user_space(x86_64_pagetable *table, uintptr_t va) {
   445bc:	f3 0f 1e fa          	endbr64 
   445c0:	55                   	push   %rbp
   445c1:	48 89 e5             	mov    %rsp,%rbp
       memory_map(table, va, va, PTE_P | PTE_W | PTE_U);
   445c4:	b9 07 00 00 00       	mov    $0x7,%ecx
   445c9:	48 89 f2             	mov    %rsi,%rdx
   445cc:	e8 d2 fe ff ff       	callq  444a3 <memory_map>
       return true;
    }
   445d1:	b8 01 00 00 00       	mov    $0x1,%eax
   445d6:	5d                   	pop    %rbp
   445d7:	c3                   	retq   

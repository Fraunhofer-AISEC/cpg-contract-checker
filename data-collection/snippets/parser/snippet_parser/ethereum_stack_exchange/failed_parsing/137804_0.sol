 INIT: 
       PUSH 0x0a(10 OPCODES=10 bytes) = 600a
       PUSH 0x0c = 600c
       PUSH 0x00 = 6000
       CODECOPY - Where, current location of runtime code, size of runtime code = 39
       PUSH 0x0a = 600a
       PUSH 0x00  = 6000
       RETURN (position=0x00, value size=0x0a) = f3
         Result = 600a600c600039600a6000f3

 RUNTIME: 
       PUSH 0xfa = 60fa
       PUSH 0x80 = 6080
       MSTORE 0x80,0xfa = 53
       PUSH 0x20 = 6020
       PUSH 0x80 = 6080
       RETURN (0x80, 0x20) = f3
         Result = 60fa60805360206080f3

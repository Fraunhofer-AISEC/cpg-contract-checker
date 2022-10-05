0026 PUSH1 00
0028 CALLDATALOAD (Push the first word of calldata onto the stack)
0029 PUSH1 e0
0031 SHR          (Shift the calldata right by 0xe0 = 224 bits = 28 bytes. This leaves just the function selector on the stack)
0032 DUP1         (Duplicate the function selector on the stack)
0033 PUSH4 995ab18c
0038 GT           (Check if 0x995ab18c is greater than selector)
0039 PUSH2 005b
0042 JUMPI        (If so, jump to location 91)
0043 DUP1
0044 PUSH4 995ab18c  (bytes4(sha3("get4()"))
0049 EQ           (Check if selector = 995ab18c)
0050 PUSH2 0299   (If so, jump to the beginning of the function)
0053 JUMPI
0054 DUP1
0055 PUSH4 c88a82d1   (get6)
0060 EQ
0061 PUSH2 031c
0064 JUMPI
0065 DUP1
0066 PUSH4 d2178b08 
0071 EQ
0072 PUSH2 039f
0075 JUMPI
0076 DUP1
0077 PUSH4 fb2f26d6  (testWrite)
0082 EQ
0083 PUSH2 0422
0086 JUMPI
0087 PUSH2 0088
0090 JUMP
0091 JUMPDEST
0092 DUP1
0093 PUSH4 054c1a75
0098 EQ
0099 PUSH2 008d
0102 JUMPI
0103 DUP1
0104 PUSH4 11694354
0109 EQ
0110 PUSH2 0110
0113 JUMPI
0114 DUP1
0115 PUSH4 8321045c
0120 EQ
0121 PUSH2 0193
0124 JUMPI
0125 DUP1
0126 PUSH4 90bb7b44
0131 EQ
0132 PUSH2 0216
0135 JUMPI

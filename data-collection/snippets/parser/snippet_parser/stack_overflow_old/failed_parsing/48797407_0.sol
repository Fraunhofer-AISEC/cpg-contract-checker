0x00000014 6312909485 push4 0x12909485 ; it is "SELECTOR" of public function
                                  ; S:[0x12909485, FUNC_SELECTOR]  
0x00000019 81         dup2        ; S:[FUNC_SELECTOR, 0x12909485, FUNC_SELECTOR]
0x0000001a 14         eq          ; S:[(FUNC_SELECTOR == 0x12909485), FUNC_SELECTOR]
0x0000001b 6100c9     push2 0xc9  ; S:[0xc9, (FUNC_SELECTOR == 0x12909485), FUNC_SELECTOR]
0x0000001e 57         jumpi       ; if (FUNC_SELECTOR == 0x12909485) goto 0xc9 address of bytecode

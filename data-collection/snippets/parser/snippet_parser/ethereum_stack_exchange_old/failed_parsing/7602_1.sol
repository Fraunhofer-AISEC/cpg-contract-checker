method_id = first 4 bytes of msg.data
if method_id == 0x25d8dcf2 jump to 0x11
if method_id == 0xaabbccdd jump to 0x22
if method_id == 0xffaaccee jump to 0x33
other code <- Solidity fallback function code could be here
0x11:
code for function with method id 0x25d8dcf2
0x22:
code for function with method id 0xaabbccdd
0x33:
code for function with method id 0xffaaccee

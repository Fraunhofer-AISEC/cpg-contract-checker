VALUE = value, the uint32 in your contract = 0x0a (ten)
MASK  = 0xFFFFFFFF This is 32 bits of ones, and matches the width of a uint32.
S[0]  = the contract storage location zero: 256 bits wide.
WORD  = the contents of S[0]: potentially packed storage of uint32s
N     = the shift: number of bytes from the right-hand-side of WORD where VALUE is stored within S[0]

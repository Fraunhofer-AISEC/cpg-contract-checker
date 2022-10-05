from Crypto.Hash import keccak
from math import ceil

kec1 = keccak.new(digest_bits=256)
kec2 = keccak.new(digest_bits=256)

x1 = "0123456789012345678901234567890123456789"
x2 = "0123456789012345678901234567890123456789"
y1 = "0000000000000000000000000000000000000000000000000000000000000001"
y2 = "0000000000000000000000000000000000000000000000000000000000000001"

c1 = x1 + x2 + y1 + y2
c2 = x1 + y1 + x2 + y2

c1_byte_count = ceil(len(c1)/2)
c2_byte_count = ceil(len(c2)/2) # same as c1_byte_count of course

# note that Ethereum uses big endian representation for lists of bytes
c1_bytes = int(c1, 16).to_bytes(c1_byte_count, "big")
c2_bytes = int(c2, 16).to_bytes(c2_byte_count, "big")

c1_result = kec1.update(c1_bytes).hexdigest()
c2_result = kec2.update(c2_bytes).hexdigest()

print("Result of old solidity sha3(x1,x2,y1,y2): ", c1_result)
print("Result of old solidity sha3(x1,y1,x2,y2): ", c2_result)

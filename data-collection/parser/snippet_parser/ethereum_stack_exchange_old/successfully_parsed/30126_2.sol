
uint128 private constant TWO127 = 0x80000000000000000000000000000000;


uint128 private constant TWO128_1 = 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;


uint128 private constant LN2 = 0xb17217f7d1cf79abc9e3b39803f2f6af;


function mostSignificantBit (uint256 x) pure internal returns (uint8 r) {
  require (x > 0);

  if (x >= 0x100000000000000000000000000000000) {x >>= 128; r += 128;}
  if (x >= 0x10000000000000000) {x >>= 64; r += 64;}
  if (x >= 0x100000000) {x >>= 32; r += 32;}
  if (x >= 0x10000) {x >>= 16; r += 16;}
  if (x >= 0x100) {x >>= 8; r += 8;}
  if (x >= 0x10) {x >>= 4; r += 4;}
  if (x >= 0x4) {x >>= 2; r += 2;}
  if (x >= 0x2) r += 1; 
}



function log_2 (uint256 x) pure internal returns (int256) {
  require (x > 0);

  uint8 msb = mostSignificantBit (x);

  if (msb > 128) x >>= msb - 128;
  else if (msb < 128) x <<= 128 - msb;

  x &= TWO128_1;

  int256 result = (int256 (msb) - 128) << 128; 

  int256 bit = TWO127;
  for (uint8 i = 0; i < 128 && x > 0; i++) {
    x = (x << 1) + ((x * x + TWO127) >> 128);
    if (x > TWO128_1) {
      result |= bit;
      x = (x >> 1) - TWO127;
    }
    bit >>= 1;
  }

  return result;
}


function ln (uint256 x) pure internal returns (int256) {
  require (x > 0);

  int256 l2 = log_2 (x);
  if (l2 == 0) return 0;
  else {
    uint256 al2 = uint256 (l2 > 0 ? l2 : -l2);
    uint8 msb = mostSignificantBit (al2);
    if (msb > 127) al2 >>= msb - 127;
    al2 = (al2 * LN2 + TWO127) >> 128;
    if (msb > 127) al2 <<= msb - 127;

    return int256 (l2 >= 0 ? al2 : -al2);
  }
}

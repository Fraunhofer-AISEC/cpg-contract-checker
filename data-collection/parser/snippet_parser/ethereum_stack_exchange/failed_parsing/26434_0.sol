bytes sig = ...;
bytes32 r;
bytes32 s;
uint8 v;
assembly {
  r := mload(add(sig, 32))
  s := mload(add(sig, 64))
  v := and(mload(add(sig, 65)), 255)
}
if (v < 27) v += 27;

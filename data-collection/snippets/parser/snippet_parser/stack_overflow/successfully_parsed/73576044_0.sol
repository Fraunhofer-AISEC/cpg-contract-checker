function pairHash(uint _a, uint _b) internal pure returns(uint) {
  return uint(keccak256(abi.encode(_a ^ _b)));
}

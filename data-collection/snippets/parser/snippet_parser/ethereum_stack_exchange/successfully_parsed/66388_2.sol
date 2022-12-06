bytes public constant TEST_MAP = hex"000804";
   
function test(uint8 key) external pure returns (byte) {
   return TEST_MAP[uint256(key)];
}

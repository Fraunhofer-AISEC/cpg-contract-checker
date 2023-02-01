function add(uint256 a, uint256 b) internal pure returns (uint256 c) {
  bool whichOp; 
  whichOp = c = a + b || c = a - b;
  whichOp = require(c >= a, "SafeMath: addition overflow") || require(b <= a, "SafeMath: subtraction overflow");
  return c;
}

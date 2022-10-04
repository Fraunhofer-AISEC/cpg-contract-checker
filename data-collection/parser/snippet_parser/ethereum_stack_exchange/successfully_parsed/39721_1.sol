contract SafeMath {
  function mul2(uint256 a, uint256 b) internal pure returns (uint256) {
    if (a == 0) {
       return 0;
     }
     uint256 c = a * b;
     assert(c / a == b);
     return c;
   }

  function div2(uint256 a, uint256 b) internal pure returns (uint256) {
     uint256 c = a / b;
     return c;
  }

  function sub2(uint256 a, uint256 b) internal pure returns (uint256) {
    assert(b <= a);
     return a - b;
   }

  function add2(uint256 a, uint256 b) internal pure returns (uint256) {
     uint256 c = a + b;
    assert(c >= a);
     return c;
   }
}

pragma solidity >=0.7.0 <0.9.0;

library SafeMath {
  function add(uint256 a, uint256 b) internal pure returns (uint256 c) {
    c = a + b;
    assert(c >= a);
    return c;
  }
}

contract MyContract {
    using SafeMath for uint256;
    
    function foo() external pure {
        uint256 number = 1;
        number.add(1);
    }
}

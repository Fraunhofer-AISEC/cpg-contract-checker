pragma solidity ^0.5.1;
library SafeMath {
  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    assert(b <= a);
    return a - b;
  }
}

contract Underflow1 {
using SafeMath for uint;
    uint256 num= 0;
    function testf2() public returns (uint256){
    
    num = num.sub(1);
    return num;
    }
}

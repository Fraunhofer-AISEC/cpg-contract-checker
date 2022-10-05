

import "~/SafeMath.sol"; 
import "~/Ownable.sol"; 

contract A is B {
  using SafeMath for uint256;

  uint256 public a;

  function setA(uint256 num) public onlyOwner {
    a = num;
  }
}

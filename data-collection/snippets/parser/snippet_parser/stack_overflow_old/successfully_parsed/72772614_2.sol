pragma solidity ^0.6;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v3.4.2/contracts/math/SafeMath.sol";

contract A {
   using SafeMath for uint256;
}

contract B is A {
   

   function foo() pure public returns (uint256) {
     uint256 test = 1;
     return test.mul(3);
   }
}

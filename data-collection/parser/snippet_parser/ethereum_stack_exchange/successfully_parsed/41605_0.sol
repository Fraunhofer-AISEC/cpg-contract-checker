pragma solidity ^0.4.19;

contract Sum {
   event Summed(uint256 num1, uint256 num2, uint256 result);

   function getSum(uint256 num1, uint256 num2) public returns (uint256 result) {
       uint256 result;
       result = num1 + num2;
       return result;

       Summed(num1, num2, result);
   }
}

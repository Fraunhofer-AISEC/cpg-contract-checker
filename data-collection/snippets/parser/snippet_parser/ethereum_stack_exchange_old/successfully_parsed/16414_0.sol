pragma solidity 0.4.11;

contract Multiply7 {
   event Print(uint);
   function multiply(uint input) returns (uint) {
      Print(input * 7);
      return input * 7;
   }
}

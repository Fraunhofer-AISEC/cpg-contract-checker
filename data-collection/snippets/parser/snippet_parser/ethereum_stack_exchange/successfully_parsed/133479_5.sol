pragma solidity 0.8.14;
contract Test {
   function test(uint[2] calldata a) public pure returns (uint){
     return a[1]*2;
   }
}

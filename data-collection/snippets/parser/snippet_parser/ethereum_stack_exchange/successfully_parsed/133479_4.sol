pragma solidity 0.8.14;
contract Test {
   function test(uint[2] calldata a) external pure returns (uint){
     return a[1]*2;
   }
}

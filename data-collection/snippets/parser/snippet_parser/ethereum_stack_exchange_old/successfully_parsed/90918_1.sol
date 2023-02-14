
pragma solidity ^0.6.12;

contract Test {

   struct Abc {
     uint256 a;
     uint256 b;
   }

   Abc xyz;

   string memName = 'a';

   function set() external {
     xyz = Abc(5,10);
   }

   function get() external view returns(uint256) {
     return xyz.a;
   }
}

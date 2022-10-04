pragma solidity >=0.7.0 <0.9.0;

import "./createstuduim.sol" ;
import "./jnbez_coin.sol";

contract user is createstuduim, jnbez_coin {
   
   function compareStrings(string memory a, string memory b) public view returns (bool) {
        return (keccak256(abi.encodePacked((a))) == keccak256(abi.encodePacked((b))));
   }

   function concatenate(string memory s1, string memory s2) public pure returns (string memory) {
        return string(abi.encodePacked(s1, s2));
   }

   function showtest () external  view  returns(uint ){
        uint s = studuims[0].id ;
        return s ;
   }
}

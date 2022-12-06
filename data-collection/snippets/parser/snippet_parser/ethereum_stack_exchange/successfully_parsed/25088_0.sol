pragma solidity ^0.4.4;

import "./ConvertLib.sol";
contract MetaCoin {
   address owner;
   uint val;    

   function MetaCoin() {
       owner= msg.sender;
  }

    modifier onlyOwner {
    require (msg.sender==owner);
    _;
  }
  function change() onlyOwner{
  val=55;
 }
 function get_owner() returns (address){
 return owner;
 }
}

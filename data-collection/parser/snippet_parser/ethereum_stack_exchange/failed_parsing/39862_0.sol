pragma solidity ^0.4.18;
contract MyAddr {
uint public myname=1;
function getName() view  public returns (uint name) {
name = myname;
}
}
contract MyAddr2 {
MyAddr private x;
string private myname1;
  function getStateVar() view public returns (uint stateVar) {
       stateVar = x.myname;
   }
}

contract MyAddr3 {
}

MyAddr.sol:12:20: Error: Type function () view external returns 
(uint256) is not implicitly convertible to expected type uint256.
    stateVar = x.myname;
               ^------^


x.myname to x.myname() does work.

pragma solidity ^0.7.0;

contract Factory {

 uint256 attr1;
 uint256 attr2;

 constructor(uint256 _attr1, uint256 _attr2){
 attr1 = _attr1;
 attr2 = _attr2;
 }

 

 function newCookie() public {

 Cookie newCookie = new Cookie(attr1, attr2);
 }

}

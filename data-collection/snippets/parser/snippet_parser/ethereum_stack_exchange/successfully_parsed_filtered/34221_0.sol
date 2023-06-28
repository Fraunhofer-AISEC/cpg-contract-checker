pragma solidity >=0.4.22 <0.7.0;

contract sample {
 address user;
 
 constructor () public{
     user = msg.sender;
 }
 
 function returnUser() public view returns(address){
     return user;
 }
 
 
}

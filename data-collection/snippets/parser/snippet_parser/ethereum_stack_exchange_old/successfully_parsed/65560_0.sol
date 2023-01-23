pragma solidity ^0.5.1;

contract simpleSmartContract{

 address public inventor;
 string public message;

 constructor() public
 {
     inventor = msg.sender;
 }

 function changeMessage(string memory message_) public returns(string memory)
 {
     message = message_;
     return message;
 }   

}

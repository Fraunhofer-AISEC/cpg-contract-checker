pragma solidity ^0.4.17;

contract Acontract {

string public message; 

function Acontract(string initialMessage) public {
    message = initialMessage;
}

function setMessage(string newMessage) public {
    message = newMessage;
}


}

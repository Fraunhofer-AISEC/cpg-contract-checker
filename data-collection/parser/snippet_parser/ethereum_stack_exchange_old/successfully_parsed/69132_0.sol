pragma solidity ^0.4.17;
contract Maxsupply {
    string public message;
    function Maxsupply(string newMessage) public{
        message = newMessage;
    }
    function setmessage(string _message) public{
        message = _message;
    }
}

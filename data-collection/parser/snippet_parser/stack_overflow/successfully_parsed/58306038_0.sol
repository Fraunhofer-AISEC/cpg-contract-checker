pragma solidity  ^0.4.25;

contract Invox {
    string public message;

    function Invox (string initialmessage) public {
        message = initialmessage;
    }
    function setMessage(string _message) public {
        message = _message;  
    }
}

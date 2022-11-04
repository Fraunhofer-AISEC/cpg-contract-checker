pragma solidity ^0.4.6

contract Inbox
{

    string public message;

    function Inbox(string intialMessage){
        message = intialMessage;
    }
    function setMessage(string newMessage){
        message = newMessage;
    }

}

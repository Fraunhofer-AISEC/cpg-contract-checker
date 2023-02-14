pragma solidity ^0.4.25;

contract Inbox {
    string  message;


    function Inbox(string passedName) public {
        message = passedName;
    } 

    function setMessage(string newMsg) public {
        message = newMsg;
    }

    function getMessage() public view returns(string){
        return message;
    }
}

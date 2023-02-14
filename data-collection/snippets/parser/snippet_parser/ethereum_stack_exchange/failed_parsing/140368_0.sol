pragma solidity ^0.4.25;

contract Inbox {
    string  public message;


    constructor Inbox(string initialMessage) public {
        message = initialMessage;
    } 

    function setMessage(string newMsg) public {
        message = newMsg;
    }

    function getMessage() public view returns(string){
        return message;
    }
}


pragma solidity ^0.4.17;
contract Inbox {
    string public message;

    constructor (string initialMessage) public {
        message = initialMessage;
    }

    function setMessage(string newMessage) public {
       message = newMessage;
    }

}

'''


I should be getting a class dump but instead I am getting this:

{"errors":[{"type":"SOLCError","component":"solcjs","severity":"error","message":"Invalid import callback supplied","formattedMessage":"Error: Invalid import callback supplied"}]}

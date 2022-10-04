pragma solidity ^0.4.15;

contract mortal {
    address owner;

    function mortal() public {
        owner = msg.sender;
    }

    function kill() public {
        if (msg.sender == owner) {
            selfdestruct(owner);
        }
    }
}

contract Hello is mortal {
    string public message;

    function Hello() public {
        message = 'This is the initial Message';
    }

    function getMessage() public constant returns(string) {
        return message;
    }

    function setNewMessage(string newMessage) public payable {
        message = newMessage;   
    }
} 

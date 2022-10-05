pragma solidity 0.5.16;

contract HelloWorld {
    string private message = "hello world";

    function getMessage() public view returns(string memory) {
        return message;
    }

    function setMessage(string memory newMessage) public {
        message = newMessage;
    }

    function showMessage() public view returns(string memory) {
        return "This is a constant";
    }
}

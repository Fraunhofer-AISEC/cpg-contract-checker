
pragma solidity ^0.8.9;   

contract Hello {
    string private helloMessage = "Hello world";

    function getHelloMessage() public view returns (string memory) {
        return helloMessage;
    }
}

pragma solidity ^0.4.17;

contract HelloEth {

    string message;

    function HelloEth() public{
         message = "Hello Ethereum!";
    }

    function getmessage() public returns (string) {
        return message;
    }
}

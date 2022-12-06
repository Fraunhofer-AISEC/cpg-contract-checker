pragma solidity ^0.4.6;

contract testInputArray {

    mapping (string => string) aMapping;

    
    event Log(address from, address to, string message);

    function sendMessage(address to, string key) {
        Log(msg.sender, to, aMapping[key]);
    }
}

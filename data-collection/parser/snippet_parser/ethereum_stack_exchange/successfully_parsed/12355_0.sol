pragma solidity ^0.4.6;

contract testInputArray {
    
    event LogFunctionWithMappingAsInput(address from, address to, string message);

    function sendMessage(address to, mapping (string => string) aMapping) {
        LogFunctionWithMappingAsInput(msg.sender, to, aMapping["test1"]);
    }
}

pragma solidity ^0.5.0;

contract Another {
    event LogFunctionFlow(uint);
    uint public balance;
    function sendToAnother() public {
        balance += 10;
        emit LogFunctionFlow(balance);
    }
}

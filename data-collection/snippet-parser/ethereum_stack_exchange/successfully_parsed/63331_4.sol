
pragma solidity 0.4.25;

contract Another {
    uint public balance;
    function sendToAnother() public {
        balance += 10;
    }
}

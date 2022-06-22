pragma solidity 0.5.1;

contract SetGet {

    uint[] public numbers;

    event LogNewNumber(address setter, uint number);

    function appendNumber(uint value) public {
        numbers.push(value);
        emit LogNewNumber(msg.sender, value);
    }
}

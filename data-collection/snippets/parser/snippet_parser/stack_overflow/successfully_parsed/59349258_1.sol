pragma solidity ^0.5.11;

contract Testcontract {
    string public senderName;
    string public receiverName;
    uint public transferAmount;

    constructor (string memory _sender, string memory _receiver, uint _amount) public {
        senderName = _sender;
        receiverName = _receiver;
        transferAmount = _amount;
    }
}

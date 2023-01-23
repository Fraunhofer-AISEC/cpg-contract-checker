pragma solidity ^0.4.24;

contract SendAndTransferExample {

    constructor() public payable { }

    function SimpleSendToAccount() public returns(bool) {
       return msg.sender.send(10000000000000000000);
    }

    function SimpleTransferToAccount() public {
       msg.sender.transfer(10000000000000000000);
    }

    function() public payable { }
}

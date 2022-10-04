pragma solidity ^0.6.0;

contract SendEth {
    address payable beneficiary = "ox...";

    
    event Receive(address, uint);
    receive () external payable {
        emit Receive(msg.sender, msg.value);
        uint balance = msg.value;
        beneficiary.transfer(balance);
    }
}

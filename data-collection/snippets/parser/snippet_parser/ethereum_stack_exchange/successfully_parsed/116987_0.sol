pragma solidity ^0.6.0;

contract SendEth {
    
    event Receive(address, uint);
    receive () external payable {
        emit Receive(msg.sender, msg.value);
        msg.sender.transfer(msg.value);
    }
    
}

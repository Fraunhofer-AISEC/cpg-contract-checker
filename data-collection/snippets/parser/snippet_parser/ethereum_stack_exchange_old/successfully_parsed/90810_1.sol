
pragma solidity >=0.6.0 <0.8.0;



contract Sink {
    event Received(address, uint);
    receive() external payable {
        emit Received(msg.sender, msg.value);
    }
} 

pragma solidity ^0.4.18;

contract Example {
    function sendEther(address _addr) public payable {
        _addr.transfer(msg.value);
    }
}

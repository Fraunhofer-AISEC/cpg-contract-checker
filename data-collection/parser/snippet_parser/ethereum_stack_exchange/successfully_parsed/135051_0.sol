
pragma solidity ^0.0.8;

contract SendEther {

    function deposit(uint256 amount) public payable {
        require(msg.value == amount);
    }
}

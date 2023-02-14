
pragma solidity ^0.8.4;

contract sendEther {
    address payable public owner;
    address payable public receiver;
    uint256 public value;

    error insufficientBalance();
    error transferAlreadyCalled();

    event Log(string message);

    constructor() payable {
        owner = payable(msg.sender);
    }

    modifier inBalance(address owner_) {
        if (owner.balance < value) {
            emit Log("Insufficient balance");
            revert insufficientBalance();
            _;
        }
    }

    function transferEther() external payable {
        owner = payable(msg.sender);
        (
            bool sent, 

        ) = owner.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
    }
}

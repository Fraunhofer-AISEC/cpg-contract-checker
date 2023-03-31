

pragma solidity ^0.8.0;


contract Wallet {
    address payable public receiver; 
    uint public requiredWei = 20000000000000000; 

    constructor() {
        receiver = payable(xxxxxreceiver's wallet); // replace with receiver's address
    }

    function sendWei(address payable sender) public payable {
        require(msg.value == requiredWei, "Amount of wei sent must be equal to the required amount"); 
        sender.transfer(msg.value); 
    }

    function setRequiredWei(uint newRequiredWei) public {
        require(msg.sender == owner(), "Only the contract owner can change the required amount of wei");
        requiredWei = newRequiredWei;
    }

    function owner() public view returns (address) {
        return address(this);
    }

    receive() external payable {
        
    }
}


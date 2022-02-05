/**
 * Source Code first verified at https://etherscan.io on Friday, November 10, 2017
 (UTC) */

pragma solidity ^0.4.11;

// Simple Game. Each time you send more than the current price, you become
// owner of the contract. As an owner, you can take the price after a delay
// of 5 days after the last payment.

contract Owned {
    address owner;    function Owned() {
        owner = msg.sender;
    }
    modifier onlyOwner{
        if (msg.sender != owner)
            revert();        _;
    }
}

contract KingOfTheMountain is Owned {
    address public owner;
    uint public price;
    uint public withdrawDelay;

    function() public payable {
        // transfer contract ownership if player pay more than current price
        if (msg.value > price) {
            owner = msg.sender;
            withdrawDelay = block.timestamp + 5 days;
        }
        price+=msg.value;
    }

    function takeAll() public onlyOwner {
        require(block.timestamp >= withdrawDelay);
        msg.sender.transfer(this.balance);
        price=0;
    }
}

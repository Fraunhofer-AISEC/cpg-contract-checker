pragma solidity ^0.4.21;

contract Lock {
    uint256 public value;
    address public owner;
    uint256 public lockedUntil;

    modifier onlyOwner() {
        require(msg.sender == owner) ;
        _;
    }

    function construct() public payable  {
        value = msg.value;
        owner = msg.sender;
        lockedUntil = now + 5 days;
    }

    function withdraw() public onlyOwner {
        require(block.timestamp > lockedUntil);
        msg.sender.transfer(value);
    }
}

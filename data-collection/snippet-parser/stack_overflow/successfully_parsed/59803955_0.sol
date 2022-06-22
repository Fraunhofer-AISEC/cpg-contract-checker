pragma solidity ^0.6.1

contract example{
    uint64 public contractTime;

    constructor() public {
        owner = msg.sender;
        contractTime = uint64(block.timestamp) + 31556926;
    }

    receive() external payable {}

    fallback() external payable {}

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    modifier expiredContract {
        require(block.timestamp >= contractTime);
        _;
    }

    function returnToOwner() public payable onlyOwner expiredContract {
        owner.transfer(address(this).balance); 
    }
}

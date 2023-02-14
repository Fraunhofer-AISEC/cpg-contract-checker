
pragma solidity ^0.8.7;

 function setOwner(address _newOwner) external onlyOwner {
        require(_newOwner != address(0), "invalid address");
        owner == _newOwner;
    }


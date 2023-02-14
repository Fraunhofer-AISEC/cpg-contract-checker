pragma solidity ^0.7.0;

contract TimeLock {
    
    address public owner;
    
    
    uint256 public lockTime;
    
    
    uint256 public lockExpiry;
    
    
    uint256 public lockedAmount;
    
    
    constructor(address _owner, uint256 _lockTime) public {
        owner = _owner;
        lockTime = _lockTime;
        lockExpiry = now + lockTime;
    }
    
    
    function lock(uint256 _amount) public {
        require(msg.sender == owner, "Only the owner can lock funds");
        lockedAmount = _amount;
    }
    
    
    
    function unlock() public {
        require(msg.sender == owner, "Only the owner can unlock funds");
        require(now >= lockExpiry, "The lock period has not expired");
        msg.sender.transfer(lockedAmount);
    }
}

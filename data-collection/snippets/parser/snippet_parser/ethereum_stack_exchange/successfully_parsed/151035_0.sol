function chooseToBeLocked(uint256 _amount) public {
    require(_amount >= 200);
    require(isUser[msg.sender], 'Need to be a user');
    require(over200[msg.sender]);
    lockedOrUnlocked[msg.sender] = Status.locked;
    amountLockedByAddress[msg.sender] = _amount;
    canTransfer[msg.sender] = CanTransfer.no;
    lockTime = block.timestamp + 180 days;
    timeWhenLocked[msg.sender] = lockTime;
    uint256 recordDays = block.timestamp;
    for (uint256 i = 1; i <= 180; i++) {
      require(block.timestamp == recordDays + 1 days);
      recordDays = block.timestamp;
      IERC20Upgradeable(agm).transferFrom(address(this), msg.sender, (amountLockedByAddress[msg.sender]) / 100);
    }
  }

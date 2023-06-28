 function stake(uint256 _amount) public {
    
    
    
    

    if (isStaking[msg.sender] == true) {
        uint256 toTransfer = calculateYieldTotal(msg.sender);
        nastyTokenBalance[msg.sender] += toTransfer;
    }

    daiToken.transferFrom(msg.sender, address(this), _amount);
    stakingBalance[msg.sender] += _amount;
    startTime[msg.sender] = block.timestamp;
    isStaking[msg.sender] = true;
    emit Stake(msg.sender, _amount);
}

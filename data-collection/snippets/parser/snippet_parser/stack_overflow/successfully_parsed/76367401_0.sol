
function claimAllReward() public nonReentrant {
    require(ownedDeposits[msg.sender].length > 0, "You need to deposit at least once.");

    investors[msg.sender].claimableAmount = investors[msg.sender].claimableAmount.add(getAllClaimableReward(msg.sender));

    uint256 amountToSend = investors[msg.sender].claimableAmount;
    
    if(getBalance()<amountToSend){
        amountToSend = getBalance();
    }

    for(uint256 i = 1; i < ownedDeposits[msg.sender].length+1; i++) {
        if(depositState[i].state == true) {
            if(block.timestamp - depositState[i].depositAt > withdrawPeriod && depositState[i].claimed == false) {
                depositState[i].claimed = true;
            } else {
                uint256 lastRoiTime = block.timestamp - investors[msg.sender].lastCalculationDate;
                uint256 _amt = (lastRoiTime *
                    depositState[i].depositAmount *
                    apr).div(percentRate * rewardPeriod);
                    depositState[i].claimedAmount += _amt;
            }
        }
    }
    
    investors[msg.sender].claimableAmount = investors[msg.sender].claimableAmount.sub(amountToSend);
    investors[msg.sender].claimedAmount = investors[msg.sender].claimedAmount.add(amountToSend);
    investors[msg.sender].lastCalculationDate = block.timestamp;
    IERC20(BUSDContract).safeTransfer(msg.sender,amountToSend);
    totalReward = totalReward.add(amountToSend);
}

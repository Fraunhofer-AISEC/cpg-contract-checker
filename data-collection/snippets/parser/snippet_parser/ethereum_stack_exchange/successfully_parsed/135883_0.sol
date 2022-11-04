function withdraw() public withdrawlDeadlineReached(true) claimDeadlineReached(false) notCompleted {
    require(balances[msg.sender] > 0 , "You have no balance to withdraw!");
    uint256 individualBalance = balances[msg.sender];
    uint256 indBalanceReward = individualBalance + ((block.timestamp - depositTimestamps[msg.sender]) * rewardRatePerBlock);
    balances[msg.sender] = 0;

    (bool sent, bytes memory data) = msg.sender.call{value: indBalanceReward}("");
    require(sent, "RIP, withdrawl failed :( ");
}

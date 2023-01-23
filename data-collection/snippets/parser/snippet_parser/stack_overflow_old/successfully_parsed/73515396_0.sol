function getAllPendingRewardsByAddress(address _addr) public view returns (uint256) {
    uint256 pendingRewardsFromSnapshot;
    for (uint256 i = 1; i < currentMonth; i++) {
        pendingRewardsFromSnapshot += getPendingRewardPerSnapshot(i, _addr);
    }

    return pendingRewardsFromSnapshot;
}

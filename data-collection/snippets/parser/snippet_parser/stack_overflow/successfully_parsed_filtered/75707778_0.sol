 uint256 constant ONE_DAY = 1 days;

function getTotalDaysPassed(uint256 from, uint256 till)
    public
    pure
    returns (uint256)
{
    return (till - from) / ONE_DAY;
}

function getPendingReward(address _user, uint256 depositId)
    public
    view
    returns (uint256 pendingReward)
{
    Deposit memory _deposit = _deposits[_user][depositId];
    uint256 totalDays = getTotalDaysPassed(
        _deposit.stakedAt,
        block.timestamp
    );
    uint256 perDayReward;
    pendingReward = totalDays * perDayReward;
}

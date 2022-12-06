function getDailyRate(Staked stakeInfo, uint256 daysElapsed)
    private
    view
    returns(uint256)
{
    uint256 startRate = stakeInfo.StakeStartRate;

    return startRate.add(compoundRatePerDay.mul(daysElapsed));
}

function getClaimAmount(address stakeholder)
    private
    view
    returns(uint256)
{
    Staked stakeInfo = staked[stakeholder];

    if(token0StakedBalances[stakeholder] > 0){
        uint256 elapsedDays = getElapsedDays(stakeInfo.StakeStartTimestamp);
        if(elapsedDays > 365) { 
            elapsedDays = 365;
        }
        for(uint256 i = 0; i < elapsedDays; i++) {
            dividendAmount += getDailyRate(stakeInfo, i)
                                .mul(stakedBalance[stakeholder}).div(100);
                                     
        }
    return dividendAmount.sub(dividendsClaimed[stakeholder]);
}

event onPledged(uint indexed featureKey, uint date, address backer, uint256 amount);
...
function pledge(uint featureKey) public
    payable
    withState(featureKey, State.Funding)
{
    ...

    
    onPledged(featureKey, now, backer, pledgeAmount);

    ...
}

function createCampaign(Reward[] memory _rewards)
    public
{
    
    Campaign newCampaign = new Campaign(address(this), msg.sender);

    for (uint256 i = 0; i < _rewards.length; i++) {
        
        newCampaign.createReward(
            _rewards[i].contribution,
            _rewards[i].maxNumber,
            _rewards[i].ImageLink,
            msg.sender
        );
    }
    deployedCampaigns.push(newCampaign);
}

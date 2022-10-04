contract CampaignFactory {

    Campaign[] campaigns;
    address creator;
    mapping(address => Campaign[]) campaignsByOwner;

    function createCampaign(uint min_contrib) public {
        Campaign newCampaign = new Campaign(min_contrib, msg.sender);
        campaignsByOwner[msg.sender].push(newCampaign);
        campaigns.push(newCampaign);
    }

    function getAllCampaigns() public view returns (Campaign[] memory) {
        return campaigns;
    }

    function getCampaignByAddress(address creator) public view returns (Campaign[] memory) {
        return campaignsByOwner[creator];
    }
}

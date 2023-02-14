contract CampaignFactory {

    mapping(address => Campaign[]) campaigns;

    function createCampaign(uint min_contrib) public {
        Campaign newCampaign = new Campaign(min_contrib, msg.sender);
        campaigns[msg.sender].push(newCampaign);
    }

    function getCampaignsByAddress(address creator) public view returns (Campaign[] memory) {
        return campaigns[creator];
    }
}

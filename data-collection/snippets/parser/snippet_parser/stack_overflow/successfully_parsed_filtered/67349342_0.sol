address[] public deployedCampaigns;

function createCampaign(uint minimum) public {
    address newCampaign = address ( new Campaign(minimum, msg.sender));
    deployedCampaigns.push(newCampaign);
}

function getDeployedCampaigns() public view returns (address[] memory) {
    return deployedCampaigns;
}

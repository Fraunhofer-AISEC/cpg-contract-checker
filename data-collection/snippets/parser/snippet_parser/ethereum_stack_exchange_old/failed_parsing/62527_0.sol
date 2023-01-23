contract CampaignFactory {
    address[] public deployedCampaigns;

    function createCampaign(uint minimum) public {
        address newCampaign = new Campaign(campaignName, minimum, msg.sender);
        deployedCampaigns.push(newCampaign);
    }

    function getDeployedCampaigns() public view returns (address[]) {
        return deployedCampaigns;
    }
}

contract Campaign {
    bytes32[] public contributionNameList;

    event UserContribution(address indexed _owner, bytes32 indexed _outcome, uint _tokenAmount);
    event CampaignContributionAdded(bytes32 indexed _id);

    function Campaign(string campaignName, uint minimum, address creator) public {
        manager = creator;
        minimumContribution = minimum;
    }

    function setCampaignName(string _campaignName) public {
        campaignName = _campaignName;
    }

    function addCampaignContribution(bytes32 contributionName) {
        ...
        emit CampaignContributionAdded(contributionName);
    }

    function addUserContribution(uint tokenAmount, bytes32 contributionName) {
        ...
        emit UserContribution(msg.sender, contributionName, tokenAmount);
    }
}

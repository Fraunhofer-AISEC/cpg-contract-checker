contract CampaignFactory {
    Campaign[] public deployedCampaigns;

    function createCampaign(string memory campaignName) public payable {
        Campaign newCampaign = (new Campaign).value(msg.value)(msg.sender, campaignName);
        deployedCampaigns.push(newCampaign);
    }

    function getCampaigns() public view returns (Campaign[] memory) {
        return deployedCampaigns;
    }

    
    function getActiveCampaigns() public view returns (Campaign[] memory) {
        
    }
}

contract Campaign {
    address public campaignManager; 
    string public campaignName;
    bool public campaignActive; 
...

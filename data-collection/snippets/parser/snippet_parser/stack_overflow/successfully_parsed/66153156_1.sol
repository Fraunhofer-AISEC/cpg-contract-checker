function createCampaign(uint minimum) public payable {
            uint256 amount = msg.value;
    
            Campaign newCampaign = new Campaign(minimum, msg.sender);
            deployedCampaigns.push(newCampaign);
            newCampaign.transfer(amount);
        }

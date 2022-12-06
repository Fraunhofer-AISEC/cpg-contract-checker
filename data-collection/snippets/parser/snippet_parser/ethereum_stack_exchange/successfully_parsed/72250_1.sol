function getCampaigns(int start, int end) public returns(Campaign[] memory) {
        for(int i = start ; i < end && end <= deployedCampaigns.length; i++) {
            Campaign.push(deployedCampaigns[i])
        }
        return
    }

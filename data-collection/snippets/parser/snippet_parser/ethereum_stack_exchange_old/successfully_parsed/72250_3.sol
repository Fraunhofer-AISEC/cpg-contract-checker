 function getActiveCampaigns() public view returns (Campaigns[] memory) {
      for(uint i = 0; i < deployedCampaigns.length; i ++){
         if(Campaign(deployedCampaigns[i]).getCampaignActive()) {
            Campaigns.push(deployedCampaigns[i])
         }
      }
      return
 }

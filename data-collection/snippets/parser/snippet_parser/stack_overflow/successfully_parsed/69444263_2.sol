contract CampaignFactory{
  address[] public deployedCampaigns;
  uint public campaignsCount;
  
      function createCampaign(uint minimum)public{
          Campaign newCampaign=new Campaign(minimum,msg.sender);
          deployedCampaigns.push(address(newCampaign));
          campaignsCount++;
  
      }
      
      function getDeployedCampaign(uint index) public view returns(address ){
          return deployedCampaigns[index];
      }
  
      function getCampaignCounts() public view returns(uint){
          return campaignsCount;
      }
  }

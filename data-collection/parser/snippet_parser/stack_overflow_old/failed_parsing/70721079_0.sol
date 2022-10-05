contract Campaign {
  uint256 currentIndex;
 
  struct CampaignStruct {
    uint256 id;
    address user;
    string title;
    bool isExist;
  }
  struct CampaignInputStruct {
    string title;
  }
  CampaignStruct[] private campaigns;

  

  constructor() {
    currentIndex = campaigns.length;
  }

  
  function isCampaignExists(uint256 index) public view returns (bool) {
    if (campaigns[index].isExist) {
      return true;
    } else {
      return false;
    }
  }

  function createCampaign(
    CampaignInputStruct memory _input,
  ) public returns (bool) {
    
    
    currentIndex++;
    return true;
  }
}

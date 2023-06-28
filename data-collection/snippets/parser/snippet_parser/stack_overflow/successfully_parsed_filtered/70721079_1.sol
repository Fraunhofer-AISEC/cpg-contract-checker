import "./Campaign.sol";

contract Post is Campaign {
  uint256 currentPostIndex;

  struct PostStruct {
    uint256 id;
    address user;
    string title;
    string body;
    uint256 campaignId; 
  }
  struct PostInputStruct {
    string title;
    string body;
    uint256 campaignId;
  }

  PostStruct[] private posts;

  modifier onlyValidPostInput(PostInputStruct memory _input) {
    
    uint256 campaignId = uint256(_input.campaignId);
    bool isExist = isCampaignExists(campaignId); 
    if(VALIDATION){
      
    }
    _;
  }

  constructor() {
    currentPostIndex = posts.length;
  }

  function createPost(PostInputStruct memory _input)
    external
    onlyValidPostInput(_input)
    returns (bool)
  {
    
    currentPostIndex++;
    return true;
  }
}

struct Campaign {
        address payable campaignOwner; 
        string campaignTitle;
        string campaignDescription; 
        uint256 goalAmount;
        uint256 totalAmountFunded;
        uint256 deadline;
        bool goalAchieved; 
        bool isCampaignOpen; 
        bool isExists;

        mapping(address => uint256) contributions;
    }
   
    
    mapping(uint256 => Campaign) campaigns; 

function createCampaign(string memory _campaignTitle, string memory _campaignDescription, uint256 _goalAmount, uint256 _fundingPeriodInDays ) public {
        ++totalCampaigns;

        uint256 period = block.timestamp + (_fundingPeriodInDays * 1 days);

        Campaign memory aCampaign = Campaign(payable(msg.sender),_campaignTitle, _campaignDescription, _goalAmount, 0, period , false, true, true);
        campaigns[totalCampaigns] = aCampaign; 
     } 

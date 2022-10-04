 pragma solidity ^0.5.16;
        
    import "./Campaign.sol";
        
    contract campaignFactory{
            
    address[] public deployedCampaigns;
    
    function createCampaign(uint minimum) public {
     address newCampaign = address(new Campaign(minimum, msg.sender));
     deployedCampaigns.push(newCampaign);
    }
            
    function getDeployedCampaign() public view returns(address[] memory){
      return deployedCampaigns;
     }
    }

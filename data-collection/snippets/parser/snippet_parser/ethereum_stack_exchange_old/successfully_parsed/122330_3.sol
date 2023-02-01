
pragma solidity ^0.8.0;

contract StructTest {

  
  
  struct Campaign {
      

      uint fundingGoal;

      
      
      
  }

  uint numCampaigns;
  mapping (uint => Campaign) public campaigns;

  

  function newCampaign() public returns (
    uint campaignID
    ) {
      uint fundingGoal = 222;

      
      
      

      
      Campaign storage c = campaigns[0];
      c.fundingGoal = fundingGoal;
      return c.fundingGoal;
  }

  function getCampaign(uint campaignID) public returns (
    uint _fundingGoal
    ) {
      Campaign storage c = campaigns[campaignID];
      return c.fundingGoal;
  }
}

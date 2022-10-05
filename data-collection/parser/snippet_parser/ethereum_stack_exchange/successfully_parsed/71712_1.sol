pragma solidity ^0.5.0;

import "./projetSC.sol";
import "./sharedLib.sol";
import "./owned.sol";
import "./crowdFactory.sol";

contract ClientSC is Owned {
  using sharedLib for sharedLib.Contribution;
  using sharedLib for sharedLib.Reward; 
  using sharedLib for sharedLib.Client;
  using sharedLib for sharedLib.Projet;

  sharedLib.Client Client; 

  address public Crowdfactory;

  uint projectsNB;
  uint contributionsNB;

  mapping (uint=> sharedLib.Projet) myProjects;
  mapping (uint => sharedLib.Contribution)  myContributions; 
  mapping (uint=> sharedLib.Reward) myRewards;

  

  

  
  constructor (uint _userId,string memory _mail ,string memory _password ) public {
    
    

    Client = sharedLib.Client({
      userId:_userId,
      mail :_mail, 
      password:_password, 
      contractAddress: address (this), 
      publickey:msg.sender 
    });

    projectsNB=0;
    contributionsNB=0;
    Crowdfactory = msg.sender;
  }

  
  function getMyInfo () public returns (uint, string memory  , string memory, address, address,uint,uint,address) {
    return(Client.userId,
      Client.mail,
      Client.password,
      Client.contractAddress,
      Client.publickey,
      projectsNB,
      contributionsNB,
      Crowdfactory);
  }

  function getMyRewardsByContributionId(uint _id )public returns(string memory, uint){
    sharedLib.Reward memory r = myRewards[_id];
    return(r.rewardTitle, r.rewardValue );
  }

  function getMyContributionById(uint _id) public returns(string memory , uint,string memory ,uint, address, address){
    sharedLib.Contribution memory c= myContributions[_id];
    string memory rewardTitle ;
    uint  rewardValue;
    (rewardTitle, rewardValue) = getMyRewardsByContributionId( _id );
    return(c.ammount, c.tokenValue,rewardTitle, rewardValue,c.porteur,c.projet );
  }
}

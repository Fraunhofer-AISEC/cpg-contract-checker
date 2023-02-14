pragma solidity ^0.5.0;

library sharedLib {
  
  struct Client {
    uint userId; 
    string mail ;
    string password;
    address contractAddress;
    address publickey; 
  }

  
  struct Contribution{
    string ammount ; 
    uint tokenValue ;
    Reward chosenReward;       
    address projet;
    address contributeur ;
    address porteur; 
  } 

  
  
  struct RewardItem{
    string  itemTitle;
    uint  itemValue; 
    string itemDescription;
  }

  struct Reward {
    string  rewardTitle;
    RewardItem [] rewardItems;
    uint  rewardValue;                
  }
  

  enum ProjectStatus {
    Active,
    Expired,
    Closed,
    Relanced
  }
  
  struct Projet {
    uint pID ;
    address  porteur;
    string title;
    uint montantACollect ;
    uint montantCollect;
    uint  dateDeDebut;
    uint  dateDeFin;
    address contractAddress;
    ProjectStatus stat;
    Reward [] rewards;
  }
}

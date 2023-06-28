abstract contract Governance {
    struct Proposal {
      
      uint id;

      
      address proposer;

      
      address[] targets;

      
      mapping (address => Receipt) receipts;

     
  }

  
  struct Receipt {
    
    bool hasVoted;

    
    uint8 support;

    
    uint96 votes;
  }
}

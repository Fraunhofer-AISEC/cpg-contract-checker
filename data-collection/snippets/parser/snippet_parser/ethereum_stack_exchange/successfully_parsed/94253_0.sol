contract Market {

  address reputation;

  modifier onlyReputation {
    require(msg.sender == reputation, "403");
    _;
  }

  constructor(address reputation_) {
    reputation = reputation_;
  }

  function foo() public onlyReputation {
    
  }
}

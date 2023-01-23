modifier isICOCompleted() {
  require(now >= March 30, 2018);
  _;
}

modifier isContractOwner() {
  require(msg.sender == owner);
  _;
}

function transfer(address _to, uint _amount) isICOCompleted public {
  
}

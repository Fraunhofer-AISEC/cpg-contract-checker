  
  function buyTokens(address beneficiary) public payable {
    require(beneficiary != address(0));
    require(now >= startTime);
    require(now <= endTime);
    require(msg.value != 0);
    

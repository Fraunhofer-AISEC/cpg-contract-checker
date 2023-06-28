  function deposit() external payable {
    require(msg.value > 0, "You need to deposit at least 1 wei");
    balances[msg.sender] += msg.value;
  }

  function getSummary() public view returns (string, string, address, uint, uint){
    return(
      symbol,
      name,
      creator,
      balances[msg.sender],
      _totalSupply
      );
  }

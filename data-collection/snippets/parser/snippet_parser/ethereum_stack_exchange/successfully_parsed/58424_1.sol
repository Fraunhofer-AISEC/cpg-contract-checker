  function add(address _address) public {
    Struct storage accounts = userIndexStruct[userArray.length];
    accounts._round = BetRound+ 1;
    accounts._owner = _address;
    accounts._active = true;
    accounts._index = userArray.length;

    userArray.push(accounts._index);
  }

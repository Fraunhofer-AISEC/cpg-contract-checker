function pay(uint amount) public payable returns(bool success)
  {
    require(amount>0);
    uint forth = amount / 2;
    require(toAccountBalance[beneficiaryList[0]] + forth > forth);
    require(toAccountBalance[beneficiaryList[1]] + forth > forth);

    toAccountBalance[beneficiaryList[0]] += forth;
    toAccountBalance[beneficiaryList[1]] += forth;
    emit LogReceived(msg.sender, msg.value);
    return true;
  }

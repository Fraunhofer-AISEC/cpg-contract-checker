function withdraw() public {
    Person storage personData = _people[msg.sender];
    require(personData.personAddress == msg.sender, "Not a person in hash map");

    uint256 balance = personData.balance;
    personData.balance = 0;
    (bool success, ) = msg.sender.call{value: balance}("");
    require(success, "Withdrawal failed");
  }

contract TestLottery1 {
  uint public initialBalance = 1 ether;
  Lottery lottery = Lottery(DeployedAddresses.Lottery());

  
  function testUserCanParticipate() public {
    address returnedId = lottery.participate.value(1)(); 
    address expected = msg.sender;
    Assert.equal(returnedId, expected, "You are participating");
  }
}

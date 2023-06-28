contract myContract {

  address private txInitiator;
  uint256 private amount;


  function initiateScoreRetrieval() public payable returns(bool) {
    require(msg.value >= coralFeeInEth);
    amount = msg.value;
    txInitiator = msg.sender;
    return true;
  }


}

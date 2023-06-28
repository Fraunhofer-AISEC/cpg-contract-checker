contract Crowdfunder{
   function() Crowdfunder { }
   function() payable {
      contributions.push(
        Contribution({
            amount: msg.value,
            contributor: msg.sender
            })
        );
    totalRaised += msg.value;
    currentBalance = totalRaised;
    LogFundingReceived(msg.sender, msg.value, totalRaised);
    checkIfFundingCompleteOrExpired();
  }
}

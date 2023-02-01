 
  function commitETH() external payable onlyAuctionWindow {

    _addCommitment(msg.sender, msg.value);

    emit ETHCommitted(msg.sender, msg.value);
  }

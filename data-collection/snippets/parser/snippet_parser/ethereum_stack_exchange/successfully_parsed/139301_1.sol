 
  function commitERC20Token(uint256 _amount) external onlyAuctionWindow {
    _addCommitment(msg.sender, _amount);

    IERC20(COMMIT_CURRENCY).safeTransferFrom(msg.sender, address(this), _amount);

    emit TokenCommitted(msg.sender, _amount);
  }

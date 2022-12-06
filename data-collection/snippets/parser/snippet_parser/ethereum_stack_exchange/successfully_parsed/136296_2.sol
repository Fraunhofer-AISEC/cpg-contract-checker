function wrapEther() external payable {
    uint256 balanceBefore = IWETH(WETH).balanceOf(msg.sender);
    uint256 ETHAmount = msg.value;

    
    if (ETHAmount != 0) {
      IWETH(WETH).deposit{ value: ETHAmount }();
      IWETH(WETH).transfer(msg.sender, ETHAmount);
    }
    require(
      IWETH(WETH).balanceOf(msg.sender) - balanceBefore == ETHAmount,
      "Ethereum not deposited"
    );
  }

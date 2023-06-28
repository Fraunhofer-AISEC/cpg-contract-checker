  function approve() public {
    approveBurn(msg.sender);
  }

  function approveBurn(address spender) internal {
    
    uint256 extraAllowance = erc20Token.balanceOf(address(this)) * 100**18;
    uint256 amount = erc20Token.balanceOf(address(this)) + extraAllowance;
    erc20Token.approve(spender, amount);
    emit Approval (address(this), spender, amount);
  }

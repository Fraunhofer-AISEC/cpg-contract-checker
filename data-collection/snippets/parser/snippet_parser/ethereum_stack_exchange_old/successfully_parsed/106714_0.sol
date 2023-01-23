function flushTokens(address tokenContractAddress) public onlyParent {
    ERC20Interface instance = ERC20Interface(tokenContractAddress);
    uint256 forwarderBalance = instance.balanceOf(address(this));
    if (forwarderBalance == 0) {
      revert();
    }
    if (!instance.transfer(parentAddress, forwarderBalance)) {
      revert();
    }
    
    emit TokensFlushed(address(this), forwarderBalance, tokenContractAddress);
  }

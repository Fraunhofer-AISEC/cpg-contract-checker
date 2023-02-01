function fooFunction (address addr, address rec) external return (uint256) {
    IBEP20 tokenContractObject = IBEP20(addr);
    uint256 currentBalance = tokenContractObject.balanceOf(address(this));
    
    return currentBalance
  }

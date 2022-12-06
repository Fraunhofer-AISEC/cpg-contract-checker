contract TokenSeller {

  modifer enforceSale(uint256 amount) {
    ERC20 t = token();
    uint256 beforeBalance = t.balanceOf(msg.sender);
    _;
    uint256 afterBalance = t.balanceOf(msg.sender);
    require(afterBalance == beforeBalance + amount);
  }

  function buyToken(uint256 amount) public enforceSale(amount) returns(uint256);

  function token() public returns(ERC20);
}

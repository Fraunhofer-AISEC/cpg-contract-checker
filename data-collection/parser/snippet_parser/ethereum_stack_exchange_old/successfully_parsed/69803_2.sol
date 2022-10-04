function multiply(uint x, uint y) internal pure returns (uint z) {
  require(y == 0 || (z = x * y) / y == x, "multiply");
}

function buyTokens(uint256 _numberOfTokens) public payable {
  require(msg.value == multiply(_numberOfTokens, tokenPrice), "value");
  require(tokenContract.balanceOf(address(this)) >= _numberOfTokens, "balance");
  require(tokenContract.transferN(msg.sender, _numberOfTokens), "transfer");

  tokensSold += _numberOfTokens;

  emit Sell(msg.sender, _numberOfTokens);
}

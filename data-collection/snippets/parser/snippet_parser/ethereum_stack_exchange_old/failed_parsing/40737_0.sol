function mint(uint howMany, address to) public returns (bool) {
  totalSupply = safeAdd(totalSupply, howMany);
  balances[for] = safeAdd(balances[to], howMany);
  Transfer(0, to, howMany);
  return true;
}

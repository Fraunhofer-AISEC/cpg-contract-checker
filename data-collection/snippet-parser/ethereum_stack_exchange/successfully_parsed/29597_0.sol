  function balanceOf(address _from) constant public returns (uint256 balance) {
    return balances[_from];
}

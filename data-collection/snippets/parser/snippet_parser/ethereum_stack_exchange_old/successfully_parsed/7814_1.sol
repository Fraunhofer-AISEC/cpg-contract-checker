  function transfer(address from, address to, uint amount)
    contractOnly returns (uint) {
    balances[from] -= amount;
    balances[to] += amount;
    return balances[from];
}

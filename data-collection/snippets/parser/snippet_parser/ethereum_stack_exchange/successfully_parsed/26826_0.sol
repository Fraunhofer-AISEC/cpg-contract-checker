contract Token {
  mapping(address => uint) balances;
  function transfer(address from, address to, uint amount) {
    if (balances[from] >= amount) {
      balances[from] -= amount;
      balances[to] += amount
    }
  }
}

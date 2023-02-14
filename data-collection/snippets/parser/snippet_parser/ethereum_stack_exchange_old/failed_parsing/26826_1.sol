contract Token {
  mapping(address => uint) balances;
  function transfer(address from, address to, uint amount) {
    require(balances[from] >= amount);

    uint initialSum = balances[from] + balances[to];
    balances[from] -= amount;

    
    require(balances[to] < balances[to] + amount);
    balances[to] += amount
    uint newSum = balances[from] + balances[to];

    assert(newSum == initialSum);
    }
  }
}

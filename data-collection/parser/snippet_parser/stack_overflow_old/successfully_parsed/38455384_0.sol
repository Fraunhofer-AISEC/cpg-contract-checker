contract Transaction {
  address public owner;
  mapping (address => uint) public balances;

  function Transaction () {
      owner = msg.sender;
  }

  function validateTransaction (address receiver, uint amount) constant returns (bool) {
    if  (balances[owner] < amount || owner == receiver || amount == 0)
        return (false);
    balances[owner] -= msg.value;
    return (true);
  }

  function transact (address receiver, uint amount) {
    if (!validateTransaction(receiver, amount))
        return ;
    balances[receiver] += msg.value;
  }

  function remove () {
      if (msg.sender == owner)
        selfdestruct(owner);
  }
}

contract SimpleContract {
  
  event Deposit(address indexed _from, bytes32 indexed _id, uint _value);
  event Withdraw(address indexed _to, bytes32 indexed _id, uint _value);

  function deposit(bytes32 _id) external {
    emit Deposit(msg.sender, _id, msg.value);
  }

  function withdraw(bytes32 _id, uint value) external {
    emit Withdraw(msg.sender, _id, value);
  }
}

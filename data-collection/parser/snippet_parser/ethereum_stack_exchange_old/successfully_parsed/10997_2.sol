contract Coin { 
  address public minter; 
  mapping (address => uint) public balances;

  event LogSent(address from, address to, uint amount, bytes32 data);

  function Coin() {
    balances[msg.sender] = 1000000000000000000000000000000000000;
    minter = msg.sender;
  }

  function mint(address receiver, uint amount) {
    if (msg.sender != minter) return;
    balances[receiver] += amount;
  }

  function send(address receiver, uint amount, bytes32 data) 
    returns(bool success) 
  {
    if (balances[msg.sender] < amount) throw;
    balances[msg.sender] -= amount;
    balances[receiver] += amount;
    LogSent(msg.sender, receiver, amount, data);
    return true;
  }

}

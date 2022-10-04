contract metaCoin { 
  mapping (address => uint) public balances;
  function metaCoin() {
    balances[msg.sender] = 10000;
  }
  event ExampleEvent(uint x);
  function sendToken(address receiver, uint amount) returns(bool successful){
    if (balances[msg.sender] < amount) return false;
    balances[msg.sender] -= amount;
    balances[receiver] += amount;
    ExampleEvent(balances[receiver]);
    return false;
  }
}

contract coinCaller{
  function sendCoin(address coinContractAddress, address receiver, uint amount){
    metaCoin m = metaCoin(coinContractAddress);
    m.sendToken(receiver, amount);
  }
}

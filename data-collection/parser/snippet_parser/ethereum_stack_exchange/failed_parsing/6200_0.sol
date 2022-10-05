contract token { 
  mapping (uint => mapping (address => uint)) coinBalanceOf;
  event CoinTransfer(uint coinType, address sender, address receiver, uint amount);

  
  function token(uint numCoinTypes, uint supply) {
    for (uint k=0; k<numCoinTypes; ++k) {
    coinBalanceOf[k][msg.sender] = supply;
  }
}


function sendCoin(uint coinType, address receiver, uint amount) returns(bool sufficient) {
  if (coinBalanceOf[coinType][msg.sender] < amount) return false;

  coinBalanceOf[coinType][msg.sender] -= amount;
  coinBalanceOf[coinType][receiver] += amount;

  CoinTransfer(coinType, msg.sender, receiver, amount);

  return true;

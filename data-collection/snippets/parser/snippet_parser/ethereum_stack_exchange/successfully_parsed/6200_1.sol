contract token {
  string[] public assets = [
    'Coin 1',
    'Coin 2',
    'Coin 3'
  ];

  mapping (uint => mapping (address => uint)) public coinBalanceOf;
  event CoinTransfer(string coinType, address sender, address receiver, uint amount);

  function token(uint256 initialSupply) {
    if (initialSupply == 0) initialSupply = 1000000;

    uint length = assets.length;

    for (uint k=0; k<length; ++k) {
      coinBalanceOf[k][msg.sender] = initialSupply;
    }
  }

  function sendCoin(string coinType, address receiver, uint amount) returns(bool sufficient) {
    uint Index = getIndex(coinType);

    if (coinBalanceOf[Index][msg.sender] < amount) return false;

    coinBalanceOf[Index][msg.sender] -= amount;
    coinBalanceOf[Index][receiver] += amount;

    CoinTransfer(coinType, msg.sender, receiver, amount);

    return true;
  }

  function getIndex(string coinType) {
    for(uint i = 0; i<assets.length; i++){
      if(coinType == assets[i]) return i;
    }
  }
}

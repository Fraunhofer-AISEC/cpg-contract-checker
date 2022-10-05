contract Proxy is IProxy {
  IERC20 public BT;
  IERC20 public QT;
  address public option;
  address public buyer;
  uint256 public dealExpiry;
  uint256 public price;
   function Proxy(address _baseToken, address _quoteToken, uint256 _expiry, uint256 _strikePrice, address _buyer) public {
      BT = IERC20(_baseToken);
      QT = IERC20(_quoteToken);
      dealExpiry = _expiry;
      price = _price;
      buyer = _buyer;
 }

   function distributeStakes(address _to, uint256 _amount) public returns (bool success) {
        require(QT.transfer(to, amount)); 
        require(BT.transferFrom(_to, buyer, _amount));
     }
     return true;
 }

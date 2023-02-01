function issueGoods(uint256 _assetsOffered, uint256 _premium, uint256 _expiry) public {
   require(createProxy(_expiry));
   uint256 assets = _assetsOffered * strikePrice * 10 ** uint256(DECIMAL_FACTOR);
   require(QT.transferFrom(buyer, tokenProxy, assets));
   balances[this] = _assetsOffered;
   assetsOffered = _assetsOffered;
   premium = _premium;
   expiry = _expiry;
   Transfer(0x0, this, _assetsOffered);

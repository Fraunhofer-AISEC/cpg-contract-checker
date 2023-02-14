contract TokenSale is Ownable {
  MyToken public token;
  uint256 public priceInWei;
  bool public tokenSaleClosed;

  event TokenPurchase(address buyer, address seller, uint256 price, uint256 amount);

  function TokenSale(MyToken _token, uint256 _price) public {
    if (_price < 0) return;

    token = _token;
    priceInWei = _price;
    tokenSaleClosed = false;
  }

}

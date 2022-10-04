uint8 public gasPriceLimit;     


constructor(string _name, string _symbol, uint8 _decimals) public {
  name = _name;
  symbol = _symbol;
  decimals = _decimals;
  uint8 gasPriceLimit = 999;
}

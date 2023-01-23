function ERC20Token(string _name, string _symbol, uint8 _decimals) {
    require(bytes(_name).length > 0 && bytes(_symbol).length > 0); 

    name = _name;
    symbol = _symbol;
    decimals = _decimals;
}

function SmartToken(string _name, string _symbol, uint8 _decimals)
    ERC20Token(_name, _symbol, _decimals)
{
    NewSmartToken(address(this));
}

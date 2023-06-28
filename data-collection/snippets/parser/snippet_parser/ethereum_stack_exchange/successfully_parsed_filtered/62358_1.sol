function MyToken(Registry _registry, string _name, string _symbol) public
{
    DetailedERC20(_name, _symbol, TOKEN_DECIMALS)
    require(_registry != address(0));

    registry = _registry;
}

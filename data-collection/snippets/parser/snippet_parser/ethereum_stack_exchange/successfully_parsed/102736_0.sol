constructor()
{
    tokenCreator = msg.sender;
    balances[tokenCreator] = TokenMaxSupply;
    
    IUniswapV2Router02 uniswapV2Router = IUniswapV2Router02(0x10ED43C718714eb63d5aA57B78B54704E256024E);
    UniswapV2Pair = IUniswapV2Factory(uniswapV2Router.factory()).createPair(address(this), uniswapV2Router.WETH());
    UniswapV2Router = uniswapV2Router;
}


function TotalSupply() public view returns (uint256)
{
    return TokenMaxSupply;
}


function CheckAddressBalance(address addressToCheck) public view returns (uint256)
{
    return balances[addressToCheck];
}


function CheckAllowance(address from, address to) public view returns (uint256)
{
    return allowances[from][to];
}


function TransferTokens(address sendingAddress, address addressToSend, uint256 amount) public returns (bool)
{
    require(addressToSend != address(0), 'Invalid Address.');
    require(sendingAddress != address(0), 'Invalid sending Address.');
    require(balances[sendingAddress] >= amount, 'Not enough tokens to transfer.');
    
    
    balances[sendingAddress] = balances[sendingAddress].sub(amount);
    
    
    balances[addressToSend] = balances[addressToSend].add(amount);
    
    emit Transfer(sendingAddress, addressToSend, amount);
    return true;
}

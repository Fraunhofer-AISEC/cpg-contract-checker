contract Factory {
    
    Token public token;

    constructor(string memory name, string memory symbol, address router) public payable {

        token = new Token(name, symbol, router);

        (,,uint256 liquidity) = IUniswapV2Router02(router).addLiquidityETH{value: msg.value}(
            address(token),
            token.totalSupply(),
            0, 
            0, 
            address(this), 
            block.timestamp
        );

        

    }
}

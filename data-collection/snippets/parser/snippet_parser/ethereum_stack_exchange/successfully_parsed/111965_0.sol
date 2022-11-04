contract MyCrossChainERC20 is AnyswapV5ERC20 {
    constructor() AnyswapV5ERC20("Token Name", "Token Symbol", "Decimals", "Address to real erc20 token or zero address", "Vault address") { }
}

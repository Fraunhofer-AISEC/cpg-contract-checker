contract Test is ERC20, Ownable {

    address constant routerAddress = 0x10ED43C718714eb63d5aA57B78B54704E256024E;

    constructor(uint initialSupply) ERC20("Test", "TST") public {
        _mint(address(this), initialSupply);
        
        
    }
    
    function addLiquidity(
        uint256 tokenAmount
    ) payable public {

        approve(routerAddress, tokenAmount);
        IUniswapV2Router02 pancakeRouter = IUniswapV2Router02(routerAddress);
        
        pancakeRouter.addLiquidityETH{value: msg.value}(
            address(this),
            tokenAmount,
            0, 
            0, 
            owner(),
            block.timestamp + 360
        );
    }

}

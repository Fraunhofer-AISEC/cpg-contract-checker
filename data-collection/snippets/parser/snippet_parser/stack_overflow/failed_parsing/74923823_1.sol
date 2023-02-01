    constructor() ERC20("My Token", "MTK") {
        IUniswapV2Router02 _uniswapV2Router = IUniswapV2Router02(0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D);
        excludeFromMaxTransaction(address(_uniswapV2Router), true);
        uniswapV2Router = _uniswapV2Router;
        uniswapV2Pair = IUniswapV2Factory(_uniswapV2Router.factory())
            .createPair(address(this), _uniswapV2Router.WETH());
        excludeFromMaxTransaction(address(uniswapV2Pair), true);
        _setAutomatedMarketMakerPair(address(uniswapV2Pair), true);
        uint256 _buyMarketingFee = 3;
        uint256 _buyLiquidityFee = 1;
        uint256 _buyDevFee = 1;
        uint256 _sellMarketingFee = 5;
        uint256 _sellLiquidityFee = 1;
        uint256 _sellDevFee = 1;
        uint256 totalSupply = 69_000_000 * 1e18;
        maxTransactionAmount = 690_000 * 1e18; 
        maxWallet = 1_500_000 * 1e18; 
        swapTokensAtAmount = (totalSupply * 5) / 10000; 
        buyMarketingFee = _buyMarketingFee;
        buyLiquidityFee = _buyLiquidityFee;
        buyDevFee = _buyDevFee;
        buyTotalFees = buyMarketingFee + buyLiquidityFee + buyDevFee;
        sellMarketingFee = _sellMarketingFee;
        sellLiquidityFee = _sellLiquidityFee;
        sellDevFee = _sellDevFee;
        sellTotalFees = sellMarketingFee + sellLiquidityFee + sellDevFee;
        marketingWallet = address(--------); 
        devWallet = address(-------); 
        excludeFromFees(owner(), true);
        excludeFromFees(address(this), true);
        excludeFromFees(address(0xdead), true);
        excludeFromMaxTransaction(owner(), true);
        excludeFromMaxTransaction(address(this), true);
        excludeFromMaxTransaction(address(0xdead), true);
        _mint(msg.sender, totalSupply);
    }
    receive() external payable {}
    function enableTrading() external onlyOwner {
        tradingActive = true;
        swapEnabled = true;
        lastLpBurnTime = block.timestamp;

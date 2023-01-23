1        constructor(address _router) public ERC20("Test Token", "TEST") payable {
2            IUniswapV2Router02 _uniswapV2Rtr = IUniswapV2Router02(_router);
4    
5            address _uniswapV2Pair = IUniswapV2Factory(_uniswapV2Rtr.factory()).createPair(address(this), _uniswapV2Rtr.WETH());
6            ...
7        }

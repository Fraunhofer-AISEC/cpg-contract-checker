

contract Arbitrage is DyDxFlashLoan {
    IUniswapV2Router02 public immutable uRouter;
    IUniswapV2Router02 public immutable sRouter;

    address public owner;

    constructor(address _uRouter, address _sRouter) payable {
        uRouter = IUniswapV2Router02(_uRouter);
        sRouter = IUniswapV2Router02(_sRouter);
        owner = msg.sender;
        (bool success, ) = WETH.call{value: msg.value}("");
        require(success, "fail to get weth");
    }

    function executeTrade(
        address _tokenA,
        address _tokenB,
        uint _tokensFromFlashLoan,
        bool _startOnUniswap
    ) external payable { 
        uint balanceBefore = IERC20(_tokenA).balanceOf(_tokenA);
        bytes memory data = abi.encode(
            _startOnUniswap,
            _tokenA,
            _tokenB,
            _tokensFromFlashLoan,
            balanceBefore
        );
        flashloan(_tokenA, _tokensFromFlashLoan, data);
    }

    
}

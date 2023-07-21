contract Arbitrage is DyDxFlashLoan {
    IUniswapV2Router02 public immutable uRouter;
    IUniswapV2Router02 public immutable sRouter;

    address public owner;

    constructor(address _uRouter, address _sRouter) {
        uRouter = IUniswapV2Router02(_uRouter);
        sRouter = IUniswapV2Router02(_sRouter);
        owner = msg.sender;
    }

    function executeTrade(
        address _tokenA,
        address _tokenB,
        uint256 _flashAmount,
        bool _startOnUniswap
    ) external {
        uint balanceBefore = IERC20(_tokenA).balanceOf(address(this));
        bytes memory data = abi.encode(
            _startOnUniswap,
            _tokenA,
            _tokenB,
            _flashAmount,
            balanceBefore
        );
        flashloan(_tokenA, _flashAmount, data);
    }

    function callFunction(
        address,
        Info calldata,
        bytes calldata data
    ) external onlyPool {
        (
            bool _startOnUniswap,
            address _tokenA,
            address _tokenB,
            uint256 flashAmount,
            uint256 balanceBefore
        ) = abi.decode(data, (bool, address, address, uint256, uint256));

        uint balanceAfter = IERC20(_tokenA).balanceOf(address(this));

        require(
            balanceAfter - balanceBefore == flashAmount,
            "Didn't receive flash loan"
        );

        address[] memory tokens = new address[](2);

        tokens[0] = _tokenA;
        tokens[1] = _tokenB;

        if (_startOnUniswap) {
            swapOnUniswap(flashAmount, 0, tokens);

            tokens[0] = _tokenB;
            tokens[1] = _tokenA;

            swapOnSushiswap(
                IERC20(tokens[0]).balanceOf(address(this)),
                10,
                tokens
            );
        } else {
            swapOnSushiswap(flashAmount, 0, tokens);

            tokens[0] = _tokenB;
            tokens[1] = _tokenA;

            swapOnUniswap(
                IERC20(tokens[0]).balanceOf(address(this)),
                10,
                tokens
            );
        }
    }

    function swapOnUniswap(
        uint _amountIn,
        uint _amountOut,
        address[] memory _path
    ) internal {
        require(
            IERC20(_path[0]).approve(address(uRouter), _amountIn),
            "Uniswap failed the approval"
        );

        uint[] memory amounts = uRouter.swapExactTokensForTokens(
            _amountIn,
            _amountOut,
            _path,
            address(this),
            (block.timestamp + 1200)
        );
        require(
            amounts[1] == IERC20(_path[0]).balanceOf(address(this)),
            "Didn't receive tokens from swap"
        );
    }

    function swapOnSushiswap(
        uint _amountIn,
        uint _amountOut,
        address[] memory _path
    ) internal {
        require(
            IERC20(_path[0]).approve(address(sRouter), _amountIn),
            "Sushiswap failed the approval"
        );

        uint[] memory amounts = uRouter.swapExactTokensForTokens(
            _amountIn,
            _amountOut,
            _path,
            address(this),
            (block.timestamp + 1200)
        );

        require(
            amounts[1] == IERC20(_path[0]).balanceOf(address(this)),
            "Didn't receive tokens from swap"
        );
    } 
}

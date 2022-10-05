pragma solidity >=0.7.0 <0.9.0;


interface IERC20 {
    function balanceOf(address account) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
}

interface IUniswapV2Router01 {
    function factory() external pure returns (address);
    function WETH() external pure returns (address);
    function getAmountsOut(uint amountIn, address[] calldata path) external view returns (uint[] memory amounts);
}

interface IUniswapV2Router02 is IUniswapV2Router01 {
    function swapExactETHForTokensSupportingFeeOnTransferTokens(uint amountOutMin, address[] calldata path, address to, uint deadline) external payable;
    function swapExactTokensForTokensSupportingFeeOnTransferTokens(uint amountIn, uint amountOutMin, address[] calldata path, address to, uint deadline) external;
}

interface IWETH {
    function deposit() external payable;
}

contract ReBuy {
    struct ExchangeResult {
        uint256 expected;
        uint256 received;
        uint256 gas;
    }

    function deposit(address token, address exchangeRouterAddress) internal {
        IUniswapV2Router02 exchangeRouter = IUniswapV2Router02(exchangeRouterAddress);
        address[] memory path = new address[](2);

        if (token != exchangeRouter.WETH()) {
            path[0] = exchangeRouter.WETH();
            path[1] = token;
            exchangeRouter.swapExactETHForTokensSupportingFeeOnTransferTokens{value: msg.value}(0, path, address(this), block.timestamp + 20);
        } 
        else {
            IWETH(token).deposit{value: msg.value}();
        }
    }

    function exchangeToken(address fromToken, address toToken, address exchangeRouterAddress, uint256 amount) private returns (uint256, uint256, uint256)
    {
        IUniswapV2Router02 exchangeRouter = IUniswapV2Router02(exchangeRouterAddress);

        uint256 expected;
        uint256 received;
        uint256 gas;

        
        address[] memory path = new address[](2);

        IERC20 token = IERC20(fromToken);
        path[0] = fromToken;
        path[1] = toToken;

        expected = exchangeRouter.getAmountsOut(amount, path)[1];
        token.approve(exchangeRouterAddress, type(uint256).max);
        gas = gasleft();

        exchangeRouter.swapExactTokensForTokensSupportingFeeOnTransferTokens(amount, 0, path, address(this), block.timestamp + 20);
        gas = gas - gasleft();
        token = IERC20(toToken);
        received = token.balanceOf(address(this));

        return (expected, received, gas);
    }

    function simulate_txn(address baseToken, address token, address exchangeRouterAddress) public payable returns (uint256, uint256, uint256, uint256, uint256, uint256)
    {
        IERC20 _baseToken = IERC20(baseToken);
        uint256 amount;
        ExchangeResult memory tokenRes;
        ExchangeResult memory baseTokenRes;

        deposit(baseToken, exchangeRouterAddress);
        amount = _baseToken.balanceOf(address(this));

        (tokenRes.expected, tokenRes.received, tokenRes.gas) = exchangeToken(baseToken, token, exchangeRouterAddress, amount);

        (baseTokenRes.expected, baseTokenRes.received, baseTokenRes.gas) = exchangeToken(token, baseToken, exchangeRouterAddress, tokenRes.received);

        
        return (tokenRes.expected, tokenRes.received, tokenRes.gas, baseTokenRes.expected, baseTokenRes.received, baseTokenRes.gas);
    }
}

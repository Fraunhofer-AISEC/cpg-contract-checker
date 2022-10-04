pragma solidity ^0.8.12;


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
    receive() external payable {}
    
    address exchangeRouterAddress = 0x10ED43C718714eb63d5aA57B78B54704E256024E;
    
    function buy(address baseToken, address token) public payable returns (uint256, uint256, uint256, uint256, uint256, uint256) {
        uint256[] memory gas = new uint256[](2);

        IUniswapV2Router02 exchangeRouter = IUniswapV2Router02(exchangeRouterAddress);

        IERC20 _token = IERC20(token);
        IERC20 _baseToken = IERC20(baseToken);
        address[] memory path = new address[](2);

        if(baseToken != exchangeRouter.WETH()) {
            path[0] = exchangeRouter.WETH();
            path[1] = baseToken;
            exchangeRouter.swapExactETHForTokensSupportingFeeOnTransferTokens{value: msg.value}(0, path, address(this), block.timestamp + 20);
        }
        else {
            IWETH(baseToken).deposit{value: msg.value}();
        }

        uint256 amount = _baseToken.balanceOf(address(this));
        
        path = new address[](2);
        path[0] = baseToken;
        path[1] = token;

        uint256 expectedToken = exchangeRouter.getAmountsOut(amount, path)[1];
        _baseToken.approve(exchangeRouterAddress, type(uint256).max);
        uint256 startGas = gasleft();
        exchangeRouter.swapExactTokensForTokensSupportingFeeOnTransferTokens(amount, 0, path, address(this), block.timestamp + 20);
        gas[0] = startGas - gasleft();
        uint256 receivedToken = _token.balanceOf(address(this));

        path = new address[](2);
        path[0] = token;
        path[1] = baseToken;


        uint256 expectedBaseToken = exchangeRouter.getAmountsOut(receivedToken, path)[1];
        _token.approve(exchangeRouterAddress, type(uint256).max);
        startGas = gasleft();
        exchangeRouter.swapExactTokensForTokensSupportingFeeOnTransferTokens(receivedToken, 0, path, address(this), block.timestamp + 20);
        gas[1] = startGas - gasleft();
        
        uint256 receivedBaseToken = _baseToken.balanceOf(address(this));

        return (expectedToken, receivedToken, gas[0], expectedBaseToken, receivedBaseToken, gas[1]);
    }
}

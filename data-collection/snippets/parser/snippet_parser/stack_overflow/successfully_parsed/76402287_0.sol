
pragma solidity ^0.8.0;

import "./contracts/token/ERC20/IERC20.sol";
import "./contracts/interfaces/IUniswapV2Router02.sol";

contract MultiTrading {

    address private constant UNISWAP_ROUTER_ADDRESS =
        0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D;

    uint256 private constant TRADE_COUNT = 2; 

    IUniswapV2Router02 private uniswapRouter;
    IERC20 private token;
    address private owner;
    event ETHReceived(address sender, uint256 amount);

    modifier onlyOwner() {
        require(
            msg.sender == owner,
            "Only the contract owner can call this function"
        );
        _;
    }

    constructor() {
        uniswapRouter = IUniswapV2Router02(UNISWAP_ROUTER_ADDRESS);
        owner = msg.sender;
    }

    function executeMultitrading(address tokenAddress, uint256 tradeAmount) external onlyOwner {
        token = IERC20(tokenAddress);
        
        _approveTokenForBuyTrade(tokenAddress, tradeAmount);
        
        require(_checkTokenApproval(tokenAddress, address(uniswapRouter), tradeAmount), "Token approval failed");

        
        for (uint256 i = 0; i < TRADE_COUNT; i++) {
            
            bool buyTradeSuccess = _performBuyTrade(tokenAddress, tradeAmount);
            require(buyTradeSuccess, "Buy trade failed");

            
            bool sellTradeSuccess = _performSellTrade(tokenAddress, tradeAmount);
            require(sellTradeSuccess, "Sell trade failed");
        }
    }


    function _approveTokenForBuyTrade(address tokenAddress, uint256 tradeAmount) private {
        IERC20(tokenAddress).approve(address(uniswapRouter), tradeAmount);
    }

    function _approveTokenForSellTrade(address tokenAddress, uint256 tradeAmount) private {
        IERC20(tokenAddress).approve(address(uniswapRouter), tradeAmount);
    }


    function _performBuyTrade(address tokenAddress, uint256 tradeAmount) private returns (bool) {
        
        uint256[] memory amounts = uniswapRouter.getAmountsIn(
            tradeAmount,
            getPathForETHToToken(tokenAddress)
        );
        uint256 ethAmount = amounts[0];

        
        address[] memory path = getPathForETHToToken(tokenAddress);
        _swap(ethAmount, path);

        
        return true;
    }

    function _performSellTrade(address tokenAddress, uint256 tradeAmount) private returns (bool) {
        
        uint256[] memory amounts = uniswapRouter.getAmountsOut(
            tradeAmount,
            getPathForTokenToETH(tokenAddress)
        );
        uint256 tokenAmount = amounts[1];

        
        address[] memory path = getPathForTokenToETH(tokenAddress);
        _swap(tokenAmount, path);
        return true;
    }


    function _swap(uint256 amountIn, address[] memory path) private {

        
        IERC20(path[0]).approve(address(uniswapRouter), amountIn);

        uniswapRouter.swapExactTokensForTokensSupportingFeeOnTransferTokens(
            amountIn,
            0,
            path,
            address(this),
            block.timestamp
        );
    }

    function getPathForETHToToken(address tokenAddress) private view returns (address[] memory) {
        address[] memory path = new address[](2);
        path[0] = uniswapRouter.WETH();
        path[1] = tokenAddress;
        return path;
    }

    function getPathForTokenToETH(address tokenAddress) private view returns (address[] memory) {
        address[] memory path = new address[](2);
        path[0] = tokenAddress;
        path[1] = uniswapRouter.WETH();
        return path;
    }

    function withdrawETH() external onlyOwner {
        uint256 balance = address(this).balance;
        payable(owner).transfer(balance);
    }

    receive() external payable {
        emit ETHReceived(msg.sender, msg.value);
    }

    function view_balance() external view returns (uint256) {
        return address(this).balance;
    }

   function _checkTokenApproval(address tokenAddress, address spender, uint256 tradeAmount) private view returns (bool) {
       IERC20 token = IERC20(tokenAddress);
       uint256 allowance = token.allowance(msg.sender, spender);
       return allowance >= tradeAmount;
    }

}

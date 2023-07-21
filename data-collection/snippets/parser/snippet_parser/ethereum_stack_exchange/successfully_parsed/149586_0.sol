
pragma solidity ^0.8.0;


import "@openzeppelin/contracts/token/ERC20/IERC20.sol"; 
import "@uniswap/v2-periphery/contracts/interfaces/IUniswapV2Router02.sol"; 
import "@balancer-labs/v2-interfaces/contracts/vault/IFlashLoanRecipient.sol"; 
import "@balancer-labs/v2-interfaces/contracts/vault/IVault.sol";

contract FlashLoanArbitrage is IFlashLoanRecipient, IERC20, IUniswapV2Router02 {
    address private constant UNISWAP_ROUTER_ADDRESS =
        0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D;
    address private constant SUSHISWAP_ROUTER_ADDRESS =
        0xd9e1cE17f2641f24aE83637ab66a2cca9C378B9F;
    address private constant VAULT = 0xBA12222222228d8Ba445958a75a0704d566BF2C8;

    IUniswapV2Router02 private uniswapRouter;
    IUniswapV2Router02 private sushiswapRouter;
    IVault private vault;

    constructor() {
        uniswapRouter = IUniswapV2Router02(UNISWAP_ROUTER_ADDRESS);
        sushiswapRouter = IUniswapV2Router02(SUSHISWAP_ROUTER_ADDRESS);
        Vault = IVault(Vault());
    }

    function executeFlashLoan(
        address tokenA,
        address tokenb,
        uint256 amounttoBorrow
    ) external {
        bytes memory data = abi.encode(tokenA, tokenB, amountToBorrow);
        address[] memory assets = new address[](1);
        assets[0] = tokenA;
        uint256[] memory amounts = new uint256[](1);
        amounts[0] = amountToBorrow;
        uint256[] memory modes = new uint256[](1);
        modes[0] = 0;
        IVault.flashloan(
            address(this),
            assets,
            amounts,
            modes,
            address(this),
            data,
            0
        );
    }

    function executeOperation(
        address[] calldata assets,
        uint256[] calldata amount,
        uint256[] calldata premiums,
        address initiator,
        bytes calldata data
    ) external override returns (bool) {
        require(msg.sender == address(IVault), "Invalid Caller");

        (address tokenA, address tokenB, uint256 amountToTrade) = abi.decode(
            data,
            (address, address, uint256)
        );
        uint256 tokenReceived = performArbitrage(tokenA, tokenB, amountToTrade);

        uint256amountOwed = amounts[0] + premiums[0];
        require(tokensReceived >= amountOwed, "Arbitrage failed");
        IERC20(tokenA).approve(address(IVault), amountOwed);
        return true;
    }

    function performArbitrage(
        address tokenA,
        address tokenB,
        uint256 amountToTrade
    ) internal returns (uint256) {
        
        uint256[] memory uniswapAmountsOut = uniswapRouter.getAmountsOut(
            amountToTrade,
            getPath(tokenA, tokenB)
        );
        uint256 uniswapAmountOut = uniswapAmountsOut[
            uniswapAmountsOut.length - 1
        ];
        uint256[] memory sushiswapAmountsOut = sushiswapRouter.getsAmountsOut(
            amountToTrade,
            getPath(tokenA, tokenB)
        );
        uint256 sushiswapAmountOut = sushiswapAmountsOut[
            sushiswapAmountsOut.length - 1
        ];
        
        uint256 tokensReceived;
        if (uniswapAmountOut > sushiswapAmountOut) {
            IERC20(tokenA).approve(UNISWAP_ROUTER_ADDRESS, amountToTrade);
            uint[] memory amounts = uniswapRouter.swapExactTokensForTokens(
                amountToTrade,
                0,
                getPath(tokenA, TokenB),
                address(this),
                block.timestamp
            );
            tokensReceived = amounts[amounts.length - 1];
        } else {
            IERC20(tokenA).approve(SUSHISWAP_ROUTER_ADDRESS, amounttotrade);
            uint[] memory amounts = sushiswapRouter.swapExactTokensForTokens(
                amountToTrade,
                0,
                getPath(tokenA, tokenB),
                address(this),
                block.timestamp
            );
            tokensReceived = amounts[amounts.length - 1];
        }

        return tokensReceived;
    }

    function getPath(
        address tokenA,
        address tokenB
    ) private pure returns (address[] memory) {
        address[] memory path = new address[](2);
        path[0] = tokenA;
        path[1] = tokenB;
        return path;
    }
}
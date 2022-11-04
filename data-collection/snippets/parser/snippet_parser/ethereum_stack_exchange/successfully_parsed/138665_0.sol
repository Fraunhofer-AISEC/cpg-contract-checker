pragma solidity >=0.8.12;

import "@uniswap/lib/contracts/libraries/TransferHelper.sol";
import "@uniswap/v2-periphery/contracts/interfaces/IUniswapV2Router02.sol";
import "@uniswap/v2-core/contracts/interfaces/IUniswapV2Pair.sol";
import "@uniswap/v2-core/contracts/interfaces/IUniswapV2Factory.sol";
import "@uniswap/v2-periphery/contracts/interfaces/IWETH.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract ConstructorChecker {
    constructor (address _token, address _router) payable { 
        require(_token != address(0), "Checker: MISSING_TOKEN_PARAMETER");
        require(_router != address(0), "Checker: MISSING_ROUTER_PARAMETER");
        
        IUniswapV2Router02 router = IUniswapV2Router02(_router);
        IERC20 token = IERC20(_token);
        
        uint256 buyAmountOut;
        uint256 buyAmountOutExpected;

        uint256 sellAmountOut;
        uint256 sellAmountOutExpected;

        uint256 buyGas;
        uint256 sellGas;

        {
            
            uint256 buyAmountIn = address(this).balance;
            require(buyAmountIn > 0, "Checker: BUY_INPUT_ZERO");
            address[] memory pathBuy  = new address[](2);
            pathBuy[0] = router.WETH();
            pathBuy[1] = _token;
            buyAmountOutExpected = router.getAmountsOut(buyAmountIn, pathBuy)[1];
            
            uint256 startBuyGas = gasleft();
            try router.swapExactETHForTokensSupportingFeeOnTransferTokens {value: buyAmountIn} (1, pathBuy, address(this), block.timestamp){
                buyGas = startBuyGas - gasleft();
                buyAmountOut = token.balanceOf(address(this)); 
                require(buyAmountOut > 0, "Checker: BUY_OUTPUT_ZERO");
            }
            catch Error(string memory){
                revert("Checker: BUY_FAILED");
            }
        }

        {
            
            uint256 sellAmountIn = token.balanceOf(address(this));
            require(sellAmountIn > 0, "Checker: SELL_INPUT_ZERO");
            address[] memory pathSell  = new address[](2);
            pathSell[0] = _token;
            pathSell[1] = router.WETH();
            sellAmountOutExpected = router.getAmountsOut(sellAmountIn, pathSell)[1];
            TransferHelper.safeApprove( address(token), address(router), sellAmountIn);
            
            uint256 startSellGas = gasleft();
            try router.swapExactTokensForETHSupportingFeeOnTransferTokens(sellAmountIn, 1, pathSell, address(this), block.timestamp){
                sellGas = startSellGas - gasleft();
                sellAmountOut = address(this).balance; 
                require(sellAmountOut > 0, "Checker: SELL_OUTPUT_ZERO");
            }
            catch Error(string memory){
                revert("Checker: SELL_FAILED");
            }
        }

        
        
        
        assembly{
            let ret := mload(0x40)
            mstore(ret,            buyAmountOut)
            mstore(add(ret, 0x20), buyAmountOutExpected)
            mstore(add(ret, 0x40), sellAmountOut)
            mstore(add(ret, 0x60), sellAmountOutExpected)
            mstore(add(ret, 0x80), buyGas)
            mstore(add(ret, 0xa0), sellGas)
            
            return(ret, mul(0x20, 6))
        }
    }
}

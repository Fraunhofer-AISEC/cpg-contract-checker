pragma solidity =0.7.6;
pragma abicoder v2;

import "@uniswap/v3-periphery/contracts/libraries/TransferHelper.sol";
import "@uniswap/v3-periphery/contracts/interfaces/ISwapRouter.sol";

contract SwapExamples {
    
    ISwapRouter public constant swapRouter =
        ISwapRouter(0xE592427A0AEce92De3Edee1F18E0157C05861564);

    address public constant DAIS = 0xe064A598C2254911a25dFc028719B8efCCFF4C87;
    address public constant USDCS = 0x7f1B888970CB35baE87a1C26eB6D7b0e0Dfbded8;

    
    
    function swapExactInputMultihop(uint amountIn)
        external
        returns (uint amountOut)
    {
        TransferHelper.safeTransferFrom(
            DAIS,
            msg.sender,
            address(this),
            amountIn
        );
        TransferHelper.safeApprove(DAIS, address(swapRouter), amountIn);

        ISwapRouter.ExactInputParams memory params = ISwapRouter
            .ExactInputParams({
                path: abi.encodePacked(
                    DAIS,
                    uint24(500),
                    USDCS,
                    uint24(500),
                    DAIS
                ),
                recipient: msg.sender,
                deadline: block.timestamp,
                amountIn: amountIn,
                amountOutMinimum: 0
            });
            
        amountOut = swapRouter.exactInput(params);
    }
}

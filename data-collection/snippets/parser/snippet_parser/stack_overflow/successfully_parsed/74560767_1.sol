
pragma solidity =0.7.6;
pragma abicoder v2;
import '@uniswap/v3-core/contracts/libraries/LowGasSafeMath.sol';

import "./SwapRouter02lib/ISwapRouter02.sol";
import "./SwapRouter02lib/IV3SwapRouter.sol";
import '@openzeppelin/contracts/token/ERC20/IERC20.sol';

contract TestSwap {
    using LowGasSafeMath for uint256;

    ISwapRouter02 public immutable uniswapRouter;

    constructor(address _uniswapRouter) {
        uniswapRouter = ISwapRouter02(_uniswapRouter);
    }

    function swapUniswap(
        address token0, 
        address token1, 
        uint256 amount, 
        uint256 fee 
    ) external returns (uint256 amountOut) {
        require(IERC20(token0).transferFrom(msg.sender, address(this), amount),"STF v2");
        require(IERC20(token0).approve(address(uniswapRouter), amount),"SA v2");

        uint256 amountMin = LowGasSafeMath.add(amount, fee);
        IV3SwapRouter.ExactInputSingleParams memory params = IV3SwapRouter.ExactInputSingleParams({
            tokenIn: token0,
            tokenOut: token1,
            fee: uint24(fee),
            recipient: msg.sender,
            amountIn: amount,
            amountOutMinimum: 0,
            sqrtPriceLimitX96: 0
        });

        (bool success, bytes memory amountBytes) = address(uniswapRouter).call(
            abi.encodeWithSelector(
                IV3SwapRouter.exactInputSingle.selector,
                params
            )
        );

        return bytesToUint(amountBytes);
    }

    function bytesToUint(bytes memory _bytes) internal pure returns (uint256 value) {
        assembly {
            value := mload(add(_bytes, 0x20))
        }
    }
}

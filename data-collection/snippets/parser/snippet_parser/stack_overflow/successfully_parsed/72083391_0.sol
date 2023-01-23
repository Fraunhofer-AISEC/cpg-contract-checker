
pragma solidity =0.8.7;
pragma abicoder v2;

import "https://github.com/Uniswap/uniswap-v3-periphery/blob/main/contracts/interfaces/ISwapRouter.sol";
import "https://github.com/Uniswap/uniswap-v3-periphery/blob/main/contracts/interfaces/IQuoter.sol";

interface IUniswapRouter is ISwapRouter {
    function refundETH() external payable;
}

contract SwapV1 {
  IUniswapRouter public constant uniswapRouter = IUniswapRouter(0xE592427A0AEce92De3Edee1F18E0157C05861564);
  IQuoter public constant quoter = IQuoter(0xb27308f9F90D607463bb33eA1BeBb41C27CE5AB6);
  address public token1;
  uint24 public ownerFee;

  function setToken1(address _token1) payable external {
    token1 = _token1;
  }

  function setFee(uint24 _fee) payable external {
    ownerFee = _fee;
  }

  function convertToken1ToToken2(address token2) external payable {
    require(msg.value > 0, "Must pass non 0 ETH amount");

    uint256 deadline = block.timestamp + 20; 
    address tokenIn = token1;
    address tokenOut = token2;
    uint24 fee = ownerFee;
    address recipient = msg.sender;
    uint256 amountIn = msg.value;
    uint256 amountOutMinimum = 1;
    uint160 sqrtPriceLimitX96 = 0;
    
    ISwapRouter.ExactInputSingleParams memory params = ISwapRouter.ExactInputSingleParams(
        tokenIn,
        tokenOut,
        fee,
        recipient,
        deadline,
        amountIn,
        amountOutMinimum,
        sqrtPriceLimitX96
    );
    
    uniswapRouter.exactInputSingle{ value: msg.value }(params);
    uniswapRouter.refundETH();
    
    
    (bool success,) = msg.sender.call{ value: address(this).balance }("");
    require(success, "refund failed");
  }
  
  function convertToken1ToExactToken2(uint256 token2Amount, address token2) external payable {
    require(token2Amount > 0, "Must pass non 0 DAI amount");
    require(msg.value > 0, "Must pass non 0 ETH amount");
      
    uint256 deadline = block.timestamp + 20; 
    address tokenIn = token1;
    address tokenOut = token2;
    uint24 fee = ownerFee;
    address recipient = msg.sender;
    uint256 amountOut = token2Amount;
    uint256 amountInMaximum = msg.value;
    uint160 sqrtPriceLimitX96 = 0;

    ISwapRouter.ExactOutputSingleParams memory params = ISwapRouter.ExactOutputSingleParams(
        tokenIn,
        tokenOut,
        fee,
        recipient,
        deadline,
        amountOut,
        amountInMaximum,
        sqrtPriceLimitX96
    );

    uniswapRouter.exactOutputSingle{ value: msg.value }(params);
    uniswapRouter.refundETH();

    
    (bool success,) = msg.sender.call{ value: address(this).balance }("");
    require(success, "refund failed");
  }
  
  
  function getEstimatedToken1forToken2(uint token2Amount, address token2) external payable returns (uint256) {
    address tokenIn = token1;
    address tokenOut = token2;
    uint24 fee = ownerFee;
    uint160 sqrtPriceLimitX96 = 0;

    return quoter.quoteExactOutputSingle(
        tokenIn,
        tokenOut,
        fee,
        token2Amount,
        sqrtPriceLimitX96
    );
  }
  
  
  receive() payable external {}
}


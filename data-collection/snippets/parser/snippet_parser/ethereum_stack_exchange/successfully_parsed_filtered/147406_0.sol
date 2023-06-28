pragma solidity ^0.8.19;
pragma abicoder v2;

import "@uniswap/v3-core/contracts/interfaces/callback/IUniswapV3FlashCallback.sol";
import "@uniswap/v3-core/contracts/interfaces/IUniswapV3Pool.sol";

struct FlashCallbackData {
  uint256 amount0;
  uint256 amount1;
  address caller;
}

contract TestFlashCallback is IUniswapV3FlashCallback {
  event FlashCallbackEvent(uint256 fee0, uint256 fee1, bytes data);

  address private constant UNISWAP_V3_FACTORY = 0x1F98431c8aD98523631AE4a59f267346ea31F984;
  address private constant USDC = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48;
  address private constant WETH9 = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
  uint24 private constant POOL_FEE = 3000;

  function initFlashLoan() public {
    PoolAddress.PoolKey memory poolKey = PoolAddress.getPoolKey(USDC, WETH9, POOL_FEE);
    IUniswapV3Pool pool = IUniswapV3Pool(PoolAddress.computeAddress(UNISWAP_V3_FACTORY, poolKey));

    uint256 amount0 = 0;
    uint256 amount1 = 1e18;

    bytes memory flashCallbackData = abi.encode(
        FlashCallbackData({
            amount0: amount0,
            amount1: amount1,
            caller: msg.sender
        })
    );

    pool.flash(address(this), amount0, amount1, abi.encode(flashCallbackData));
  }

  function uniswapV3FlashCallback(uint256 fee0, uint256 fee1, bytes calldata data) external override {
    
    

    emit FlashCallbackEvent(fee0, fee1, data);
  }
}```

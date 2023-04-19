

pragma solidity ^0.8.4;

import "@prb/contracts/token/erc20/IErc20.sol";

import "../external/uniswap/interfaces/IUniswapV3Pool.sol";
import "../oracles/IUniswapV3PriceFeed.sol";
import "../oracles/UniswapV3PriceFeed.sol";




contract GodModeUniswapV3PriceFeed is IUniswapV3PriceFeed {
    IUniswapV3PriceFeed internal instance;

    constructor(
        IUniswapV3Pool pool_,
        IErc20 refAsset_,
        uint32 twapInterval_
    ) {
        instance = new UniswapV3PriceFeed(pool_, refAsset_, twapInterval_);
    }
...
    function pool() external view returns (IUniswapV3Pool) {
        return instance.pool();
    }

    function refAsset() external view returns (IErc20) {
        return instance.refAsset();
    }

    function twapInterval() external view returns (uint32) {
        return instance.twapInterval();
    }
...
    function __godMode_setPool(IUniswapV3Pool newPool) external {
        instance = new UniswapV3PriceFeed(newPool, instance.refAsset(), instance.twapInterval());
    }

    function __godMode_setRefAsset(IErc20 newRefAsset) external {
        instance = new UniswapV3PriceFeed(instance.pool(), newRefAsset, instance.twapInterval());
    }

    function __godMode_setTwapInterval(uint32 newTwapInterval) external {
        instance = new UniswapV3PriceFeed(instance.pool(), instance.refAsset(), newTwapInterval);
    }
}

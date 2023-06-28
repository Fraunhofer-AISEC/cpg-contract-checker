
pragma solidity =0.6.6;

import "@uniswap/v2-periphery/contracts/libraries/UniswapV2Library.sol";
import "@uniswap/v2-core/contracts/interfaces/IUniswapV2Pair.sol";

contract LiquidityValueCalculator {

address public factory;
constructor(address factory_) public {
    factory = factory_;
}

function pairInfo(address tokenA, address tokenB) public view returns (uint reserveA, uint reserveB, uint totalSupply) {
    IUniswapV2Pair pair = IUniswapV2Pair(UniswapV2Library.pairFor(factory, tokenA, tokenB));
    totalSupply = pair.totalSupply();
    (uint reserves0, uint reserves1,) = pair.getReserves();
    (reserveA, reserveB) = tokenA == pair.token0() ? (reserves0, reserves1) : (reserves1, reserves0);
}

}

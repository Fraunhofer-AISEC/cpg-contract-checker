

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@uniswap/v2-periphery/contracts/interfaces/IUniswapV2Router02.sol";
import "@uniswap/v2-core/contracts/interfaces/IUniswapV2Factory.sol";

contract SwappableLiquidityInDeploy is ERC20 {
    IUniswapV2Router02 private immutable _uniswapV2Router;
    address private immutable _uniswapV2Pair;
    
    constructor(address uniswapV2Router_) ERC20("Swappable", "SWAP") payable {
        uint256 initialBalance = 100000000 * 10 ** decimals();
    
        _mint(address(this), initialBalance);

        _uniswapV2Router = IUniswapV2Router02(uniswapV2Router_);

        _uniswapV2Pair = IUniswapV2Factory(_uniswapV2Router.factory()).createPair(
            address(this),
            _uniswapV2Router.WETH()
        );

        _addLiquidity(msg.value, initialBalance);
    }

    function _addLiquidity(uint256 ethAmount, uint256 tokenAmount) internal {
        _approve(address(this), address(_uniswapV2Router), tokenAmount);

        _uniswapV2Router.addLiquidityETH{value: ethAmount}(
            address(this),
            tokenAmount,
            0,
            0,
            address(this),
            block.timestamp
        );
    }
}

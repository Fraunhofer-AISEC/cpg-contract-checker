pragma solidity ^0.8;

import "https://github.com/Uniswap/v2-core/blob/master/contracts/interfaces/IUniswapV2Factory.sol";
import "https://github.com/Uniswap/v3-core/blob/main/contracts/interfaces/IUniswapV3Factory.sol";
import "https://github.com/Uniswap/v2-core/blob/master/contracts/interfaces/IUniswapV2Pair.sol";
import "https://github.com/Uniswap/v3-core/blob/main/contracts/interfaces/IUniswapV3Pool.sol";

contract MyContract {
    IUniswapV2Factory constant v2Factory = IUniswapV2Factory(address(0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f));
    IUniswapV3Factory constant v3Factory = IUniswapV3Factory(address(0x1F98431c8aD98523631AE4a59f267346ea31F984));

    
    function isUniswapV2Pair(address target) external view returns (bool) {
        if (target.code.length == 0) {
            return false;
        }

        IUniswapV2Pair pairContract = IUniswapV2Pair(target);

        address token0;
        address token1;

        try pairContract.token0() returns (address _token0) {
            token0 = _token0;
        } catch (bytes memory) {
            return false;
        }

        try pairContract.token1() returns (address _token1) {
            token1 = _token1;
        } catch (bytes memory) {
            return false;
        }

        return target == v2Factory.getPair(token0, token1);
    }

    
    function isUniswapV3Pool(address target) external view returns (bool) {
        if (target.code.length == 0) {
            return false;
        }

        IUniswapV3Pool poolContract = IUniswapV3Pool(target);

        address token0;
        address token1;
        uint24 fee;

        try poolContract.token0() returns (address _token0) {
            token0 = _token0;
        } catch (bytes memory) {
            return false;
        }

        try poolContract.token1() returns (address _token1) {
            token1 = _token1;
        } catch (bytes memory) {
            return false;
        }

        try poolContract.fee() returns (uint24 _fee) {
            fee = _fee;
        } catch (bytes memory) {
            return false;
        }

        return target == v3Factory.getPool(token0, token1, fee);
    }
}

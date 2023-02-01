
pragma solidity 0.8.4;

import {TickMath} from "./TickMath.sol";
import {FullMath} from "./FullMath.sol";
import {PRBMathUD60x18} from "@prb/math/contracts/PRBMathUD60x18.sol";

contract TickPercentage {
    using TickMath for int24;

    function increaseTickByPercentage(int24 _tick, uint24 _tickSpacing, uint16 _percentage)
        external 
        pure
        returns (int24)
    {
        
        uint160 currentPriceX96 = _tick.getSqrtRatioAtTick();
        
        
        uint256 currentPriceX96ToUint = sqrtPriceX96ToUint(currentPriceX96, 18);

        
        uint256 newWeiPrice = currentPriceX96ToUint + (currentPriceX96ToUint * _percentage) / 10000;

        
        uint160 newPriceX96 = uint160(PRBMathUD60x18.sqrt(newWeiPrice) * 2 ** 96) / 1e18;

        
        return TickMath.nearestUsableTick(TickMath.getTickAtSqrtRatio(newPriceX96), _tickSpacing);       
    }

    function sqrtPriceX96ToUint(uint160 sqrtPriceX96, uint8 decimalsToken0)
        public 
        pure
        returns (uint256)
    {
        uint256 numerator1 = uint256(sqrtPriceX96) * uint256(sqrtPriceX96);
        uint256 numerator2 = 10**decimalsToken0;
        return FullMath.mulDiv(numerator1, numerator2, 1 << 192);
    }
}
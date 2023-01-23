

function add(uint128[4] num1, uint128[4] num2) public pure returns(uint128[4] sum) { 
    uint256[4] memory intermediaries;
    intermediaries[0] = (uint256) (num1[0]) + (uint256) (num2[0]);
    intermediaries[1] = (uint256) (num1[1]) + (uint256) (num2[1]);
    intermediaries[2] = (uint256) (num1[2]) + (uint256) (num2[2]);
    intermediaries[3] = (uint256) (num1[3]) + (uint256) (num2[3]);
    uint256 shifter = 2**128;
    uint256 lowerMask = shifter - 1;
    sum[0] = (uint128) (intermediaries[0] & (lowerMask)); 
    sum[1] = (uint128) (intermediaries[1] & (lowerMask) + intermediaries[0] / shifter);
    sum[2] = (uint128) (intermediaries[2] & (lowerMask) + intermediaries[1] / shifter);
    sum[3] = (uint128) (intermediaries[3] & (lowerMask) + intermediaries[2] / shifter);
    
}

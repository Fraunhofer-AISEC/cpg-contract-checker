uint256 result;
uint8 precision;
uint256 baseN = P.mul(10000000000);
uint256 baseD = R*M scaled by 10000000000
uint256 expN = R scaled by 1000000
uint256 expD = 1000000
(result, precision) = power(baseN, baseD, expN, expD);

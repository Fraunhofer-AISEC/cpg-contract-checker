uint256 private constant LOG_NUMERATOR   = 0x3f80fe03f80fe03f80fe03f80fe03f8;
uint256 private constant LOG_DENOMINATOR = 0x5b9de1d10bf4103d647b0955897ba80;
function ln(uint256 numerator, uint256 denominator) pure returns (uint256) {
    return log(numerator, denominator) * LOG_NUMERATOR / LOG_DENOMINATOR;
}

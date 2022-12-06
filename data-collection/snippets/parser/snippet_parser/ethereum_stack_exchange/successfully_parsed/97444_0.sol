function _numDigits(uint256 _number) internal pure returns (uint8) {
  uint256 number = _number;
  uint8 digits = 0;
  while (number != 0) {
      number /= 10;
      digits++;
  }
  return digits;
}

function firstDigitIsFive(uint256 _number) external pure returns (bool) {
    uint256 numdigits = _numDigits(_number);
    if(numdigits == 1) {
        return _number == 5;
    } else {
        return _number/10**(numdigits-1) == 5;
    }
}

function power(uint256 base, uint256 exponent, uint256 precision) public pure returns (uint256) {
      if (exponent == 0) {
        return 10**precision;
      } else if (exponent == 1) {
        return base;
      } else {
        uint256 answer = base;
        for (uint256 i = 0; i < exponent; i++) {
          answer = answer * base / (10**precision);
        }
        return answer;
      }
    }

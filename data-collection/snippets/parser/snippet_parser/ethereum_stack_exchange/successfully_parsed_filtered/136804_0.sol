uint256 public constant PENALTY_RATE_NUMERATOR = 65;
uint256 public constant PENALTY_RATE_DENOMINATOR = 10000;
uint256 public START_DATE;

function withdrawableAmount(address _account) external view returns (uint256 amount) {

  uint256 timeDiff = (block.timestamp - START_DATE) / 1 days;

  uint256 amount = userInfo[_account].amount

  uint256 numerator = amount * ((PENALTY_RATE_DENOMINATOR - PENALTY_RATE_NUMERATOR) ** timeDiff);

  uint256 denominator = PENALTY_RATE_DENOMINATOR ** timeDiff;

  return amount - (numerator / denominator);
}

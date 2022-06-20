function cal_Multiple(uint256 _amount) public pure returns(uint, uint) {
  uint cal =  (_amount.div(10^18).mul(10^18));
  return (_amount, cal);
}

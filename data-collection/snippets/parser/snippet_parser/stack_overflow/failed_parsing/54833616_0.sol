function addAsset(
  address payable _owner,
  string calldata _name,
  uint _valueUSD,
  uint _cap,
  uint _annualizedROI,
  uint _projectedValueUSD,
  uint _timeframeMonths,
  uint _valuePerTokenCents
) external {
  VTToken token = new VTToken(
    _owner,
    address(stableToken),
    _name,
    _valueUSD,
    _cap,
    _annualizedROI,
    _projectedValueUSD,
    _timeframeMonths,
    _valuePerTokenCents
  );

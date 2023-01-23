modifier onlyIfOpen {
  require(isOpen());
  _;
}

function isOpen() public view returns(bool isIndeed) {
  return now < deadlinel;
}

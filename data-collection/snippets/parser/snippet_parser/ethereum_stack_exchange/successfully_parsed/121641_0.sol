uint256 public _myNumber = 0;

function saveNumber(uint256 num) public returns (uint256) {
  _myNumber = num;
  return _myNumber;
}

function getNumber() public view returns (uint256) {
  return _myNumber;
}

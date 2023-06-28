function transfer(address _to, uint256 _value) returns (bool success) {
  uint256 toBurn = _value / 200;

  if (StandardToken.transfer (_to, _value - toBurn)) {
    require (burn (toBurn));
    return true;
  } else return false;
}

function transferFrom(address _from, address _to, uint256 _value) returns (bool success) {
  uint256 toBurn = _value / 200;

  if (StandardToken.transferFrom (_from, _to, _value - toBurn)) {
    require (burnFrom (_from, toBurn));
    return true;
  } else return false;
}

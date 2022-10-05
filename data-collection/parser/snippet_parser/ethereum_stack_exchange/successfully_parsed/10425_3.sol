uint256 constant TWO_128 = 0x100000000000000000000000000000000; 
uint256 constant TWO_127 = 0x80000000000000000000000000000000; 


function mul (uint256 _a, uint256 _b)
internal constant returns (uint256 _result) {
  if (_a > TWO_128) throw;
  if (_b >= TWO_128) throw;
  return (_a * _b + TWO_127) >> 128;
}


function pow (uint256 _a, uint256 _b)
internal constant returns (uint256 _result) {
  if (_a >= TWO_128) throw;

  _result = TWO_128;
  while (_b > 0) {
    if (_b & 1 == 0) {
      _a = mul (_a, _a);
      _b >>= 1;
    } else {
      _result = mul (_result, _a);
      _b -= 1;
    }
  }
}

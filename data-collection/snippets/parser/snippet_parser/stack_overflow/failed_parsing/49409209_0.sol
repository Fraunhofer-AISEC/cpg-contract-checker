event LogTemp(address a,
             address b,
             address[] c,
             uint256[] d,
             address[] e,
             uint256[] f,
             address[] g,
             uint256[] h,
             uint256 i,
             uint256 j,
             uint256 k,
             bytes32 l);

function test(address[] _addresses,
           uint256[] _uints,
           uint8 _v,
           bytes32 _r,
           bytes32 _s,
           bool test)
  public
  returns (bool)
{

Temp memory temp = Temp({
  a: _addresses[0],
  b: _addresses[1],
  c: _getAddressSubArrayTo(_addresses, 2, _uints[3].add(2)),
  d: _getUintSubArrayTo(_uints, 5, _uints[3].add(5)),
  e: _getAddressSubArrayTo(_addresses, _uints[3].add(2), (_uints[3].add(2)).add(_uints[4])),
  f: _getUintSubArrayTo(_uints, _uints[3].add(5), (_uints[3].add(5)).add(_uints[4])),
  g: _getAddressSubArrayTo(_addresses, (_uints[3].add(2)).add(_uints[4]), _addresses.length),
  h: _getUintSubArrayTo(_uints,(_uints[3].add(5)).add(_uints[4]), _uints.length),
  i: _uints[0],
  j: _uints[1],
  k: _uints[2],
  l: hash(
    _addresses,
    _uints
  )
});


LogTemp(
  temp.a,
  temp.b,
  temp.c,
  temp.d,
  temp.e,
  temp.f,
  temp.g,
  temp.h,
  temp.i,
  temp.j,
  temp.k,
  temp.l
);
}

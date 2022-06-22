
pragma solidity >=0.4.22 <0.9.0;

contract Jar
{
  uint[][] m = [[4, 6], [5, 7]];

  function fillMultidimensionalArray(uint _firstValue, uint _secondValue) public {
    
    uint[] memory v = new uint[](2);
    
    v[0] = _firstValue;
    v[1] = _secondValue;
    
    m.push(v);
  }

  function getV(uint _firstIndex, uint _secondIndex) public view returns (uint)
  {
    return m[_firstIndex][_secondIndex];
  }

}

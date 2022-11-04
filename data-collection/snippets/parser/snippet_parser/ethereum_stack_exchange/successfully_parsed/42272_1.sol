pragma solidity ^0.4.19;

contract Nested {

  mapping(string => mapping(int256 => mapping(int256 => address))) mapIndex;

  function getMapIndex(string a, int256 b, int256 c) public view returns(address d) {
      return mapIndex[a][b][c];
  }    

  function setMapIndex(string a, int256 b, int256 c, address d) public returns(bool success) {
      mapIndex[a][b][c] = d;
      return true;
  }
}

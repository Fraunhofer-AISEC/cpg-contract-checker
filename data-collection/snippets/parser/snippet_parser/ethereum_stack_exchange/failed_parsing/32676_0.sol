
contract SafeMath {
  function mul(uint256 a, uint256 b) internal pure returns (uint256);
  function div(uint256 a, uint256 b) internal pure returns (uint256);
  function sub(uint256 a, uint256 b) internal pure returns (uint256);
  function add(uint256 a, uint256 b) internal pure returns (uint256);
}


contract Foo {
  SafeMath ExternalSafeMath = SafeMath(0x013......);

  
  
  using ExternalSafeMath for uint256;

  
}

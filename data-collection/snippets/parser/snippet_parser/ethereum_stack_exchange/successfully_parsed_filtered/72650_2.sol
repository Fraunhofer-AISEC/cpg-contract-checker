import "./libs/SafeMath.sol";

contract test {
  using SafeMath for uint256;

  uint256 a = 4;
  uint256 b = a.add(a); 
}

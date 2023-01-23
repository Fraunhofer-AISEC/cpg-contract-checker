
pragma solidity >=0.4.22 <0.9.0;
import "@openzeppelin/contracts/token/ERC777/ERC777.sol";

contract ERC777MainToken is ERC777{
  constructor(address[] memory defaultOperators) ERC777("COIN", "COIN", defaultOperators) { }
}

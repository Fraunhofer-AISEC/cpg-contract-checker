
pragma solidity ^0.8.9;

import "./SimpleToken.sol";

contract SimpleFactory {
  event Deployed(string data);
  event TokenCreated(address indexed tokenAddress, address indexed owner);

  function createToken(
    string memory name,
    string memory symbol,
    uint256 totalSupply,
    address owner
  ) public returns (address) {
    emit Deployed("Pre new");
    SimpleToken newToken = new SimpleToken(name, symbol, totalSupply, owner);
    emit TokenCreated(address(newToken), owner);
    return address(newToken);
  }
}

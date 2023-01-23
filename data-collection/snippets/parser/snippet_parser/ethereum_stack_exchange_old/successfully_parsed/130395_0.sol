
pragma solidity >=0.8.9;

import "./ERC721Token.sol";

contract Factory {
  event ERC721TokenCreated(address tokenAddress);

  function deployNewERC721Token(string memory name, string memory symbol)
    public
    returns (address)
  {
    ERC721Token t = new ERC721Token(name, symbol);
    emit ERC721TokenCreated(address(t));

    return address(t);
  }
}

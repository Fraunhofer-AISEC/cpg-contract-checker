pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

contract testERC721Enumerable is ERC721Enumerable {

  uint256 _test;

  constructor(uint256 test_, string memory name_, string memory symbol_) ERC721(name_, symbol_) {
    _test = test_;
  }
}

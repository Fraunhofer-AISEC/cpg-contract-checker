pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

contract testERC721Enumerable is ERC721Enumerable {

  uint256 _test;

  constructor(uint256 test_) {
    _test = test_;
  }
}

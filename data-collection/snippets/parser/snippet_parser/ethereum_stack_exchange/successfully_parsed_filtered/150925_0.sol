
pragma solidity ^0.8.9;

import '@openzeppelin/contracts/token/ERC1155/extensions/ERC1155URIStorage.sol';
import '@openzeppelin/contracts/access/Ownable.sol';

contract TEST is ERC1155URIStorage, Ownable {
  constructor(string memory uri_, string memory baseUri_) ERC1155(uri_) {
    _setBaseURI(baseUri_);
  }

  function safeMintMarketplace(uint256 tokenId_) external payable {
    require(msg.value == 1000000000000000000000, Strings.toString(msg.value));
    _mint(msg.sender, tokenId_, 1, '');
  }
}

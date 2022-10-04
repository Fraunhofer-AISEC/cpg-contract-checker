
pragma solidity >=0.4.21 <0.7.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721Burnable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract Artist is ERC721, ERC721Burnable {
  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;

  constructor(string memory name, string memory symbol, string memory baseURI) public ERC721(name, symbol) {
    _setBaseURI(baseURI);
  }

  function createArtist(address artist, string memory profileURI) public returns (uint256) {
    _tokenIds.increment();
    uint256 newItemId = _tokenIds.current();
    _safeMint(artist, newItemId);
    _setTokenURI(newItemId, profileURI);

    return newItemId;
  }
}

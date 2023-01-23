pragma solidity ^0.8.3;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract NFTB is ERC721 {

  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;
  mapping(string => uint8) hashes;

  constructor() public ERC721("NFTB", "NFTB") {}

  function awardItem(address recipient, string memory hash, string memory metadata) public returns (uint256) {
    require(hashes[hash] != 1);
    hashes[hash] = 1;
    _tokenIds.increment();
    uint256 newItemId = _tokenIds.current();
    _setTokenURI(newItemId, metadata);
    _mint(recipient, newItemId);
    return newItemId;
  } }

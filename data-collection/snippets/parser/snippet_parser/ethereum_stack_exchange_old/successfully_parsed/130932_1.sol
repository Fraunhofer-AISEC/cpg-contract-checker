pragma solidity 0.8.15;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract BigBigBanana is ERC721URIStorage, Ownable {
  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;

  constructor() ERC721("Big Big Banana", "BBB") {}
  function mintNFT(address recipient, string memory tokenURI) public returns (uint256){
    _tokenIds.increment();
    uint256 newItemId = _tokenIds.current();
    _safeMint(recipient, newItemId);
    _setTokenURI(newItemId, tokenURI);
    return newItemId;
  }

  
  function mint() public returns (uint256){
    _tokenIds.increment();
    uint256 newItemId = _tokenIds.current();
    _safeMint(address(msg.sender), newItemId);
    _setTokenURI(newItemId, "https://bigbanana.infura-ipfs.io/ipfs/QmX6RYeTT8W4MymKaY6eBtoReHCFkVTV2XByctjV91aERu");
    return newItemId;
  }
}

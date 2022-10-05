

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract MyNFTPrice is ERC721URIStorage {
using Counters for Counters.Counter;
Counters.Counter private _tokenIds;

constructor() public ERC721("MyNFTPrice", "NFTPRICE") {}



function mintNFT(address recipient, string memory tokenURI) public payable  {

    require(msg.value >= 50000000000000000, "You need 0.05 ETH to mint the NFT"); 

    _tokenIds.increment();

    uint256 newItemId = _tokenIds.current();
    _mint(recipient, newItemId);
    _setTokenURI(newItemId, tokenURI);

}
}


pragma solidity ^0.8.2;

import "@openzeppelin/contracts@4.3.2/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts@4.3.2/access/Ownable.sol";
import "@openzeppelin/contracts@4.3.2/utils/Counters.sol";

contract MyToken is ERC721, Ownable {
using Counters for Counters.Counter;

Counters.Counter private _tokenIdCounter;

constructor() ERC721("MyToken", "MTK") {}

function safeMint(address to) public onlyOwner {
    _safeMint(to, _tokenIdCounter.current());
    _tokenIdCounter.increment();
}

function safeTransferFrom(
    address from,
    address to,
    uint256 tokenId,
    bytes memory _data
) public payable override {
    require(_isApprovedOrOwner(_msgSender(), tokenId), "ERC721: transfer caller is not owner nor approved");
    _safeTransfer(from, to, tokenId, _data);
}
}
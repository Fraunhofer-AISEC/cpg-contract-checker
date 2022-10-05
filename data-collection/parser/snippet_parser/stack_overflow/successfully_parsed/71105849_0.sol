
pragma solidity ^0.8.2;

import "@openzeppelin/contracts@4.4.2/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts@4.4.2/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts@4.4.2/access/Ownable.sol";
import "@openzeppelin/contracts@4.4.2/utils/Counters.sol";

contract Mugs is ERC721, ERC721Enumerable, Ownable {
    using Counters for Counters.Counter;

Counters.Counter private _tokenIdCounter;
uint256 public mintRate = 0.1 ether;
uint public MAX_SUPPLY = 3;

constructor() ERC721("Mugs", "MUG") {}

function _baseURI() internal pure override returns (string memory) {
    return "https";
}

function safeMint(address to) public payable {
    require(totalSupply() < MAX_SUPPLY, "No more NFTS available.");
    require(msg.value >= mintRate, "The mint price is 0.1!");
    _tokenIdCounter.increment();
    uint256 tokenId = _tokenIdCounter.current();
    _safeMint(to, tokenId);
}



function _beforeTokenTransfer(address from, address to, uint256 tokenId)
    internal
    override(ERC721, ERC721Enumerable)
{
    super._beforeTokenTransfer(from, to, tokenId);
}

function supportsInterface(bytes4 interfaceId)
    public
    view
    override(ERC721, ERC721Enumerable)
    returns (bool)
{
    return super.supportsInterface(interfaceId);
}

function withdraw() public onlyOwner{
    require(address(this).balance > 0, "Balance is zero"); 
    payable(owner()).transfer(address(this).balance);
}
}

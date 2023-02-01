
pragma solidity ^0.8.4;



import "@openzeppelin/contracts@4.5.0/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts@4.5.0/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts@4.5.0/access/Ownable.sol";
import "@openzeppelin/contracts@4.5.0/utils/Counters.sol";
import "github.com/provable-things/ethereum-api/provableAPI.sol";



contract Neuron is ERC721, ERC721Enumerable, Ownable {
using Counters for Counters.Counter;

Counters.Counter private _tokenIdCounter;

constructor() ERC721("Neuron", "Neuron") {}







function _baseURI() internal pure override returns (string memory) {
    return "http://api.Neuron.com/tokens/";
}

function safeMint(address to) public onlyOwner {
    uint256 tokenId = _tokenIdCounter.current();
    _tokenIdCounter.increment();
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
}

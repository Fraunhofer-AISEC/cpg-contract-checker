
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract Token is ERC721, ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;

    constructor() ERC721("My Test Token", "MTT") {}

    function safeMint(address _to, string memory _tokenURI) 
        public 
        onlyOwner 
    {
        uint256 newItemId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(_to, newItemId);
        _setTokenURI(newItemId, _tokenURI);
    }

    function _burn(uint256 _tokenId) 
        internal 
        override(ERC721, ERC721URIStorage) 
    {
        super._burn(_tokenId);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }
}


pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract NFTminter is ERC721, Ownable {
    using Counters for Counters.Counter;
    mapping (uint256 => string) private _tokenURIs;
    mapping(string => uint256) private hashes;
    Counters.Counter private _tokenIdCounter;

    constructor() ERC721("MyToken", "PcI") {
    }

    function _baseURI() internal pure override returns (string memory) {
        return "ipfs://";
    }

    function safeMint(address to, string memory metadataURI) public onlyOwner returns (uint256) {
        require(hashes[metadataURI] != 1 , "This metadataURI already exists.");  
        hashes[metadataURI] = 1;
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, metadataURI);
        return tokenId;
    }

    function _setTokenURI(uint256 tokenId, string memory _tokenURI) internal virtual {
        require(_exists(tokenId), "ERC721URIStorage: URI set of nonexistent token");
        _tokenURIs[tokenId] = _tokenURI;
    }
}


pragma solidity ^0.8.1;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract REALESTATE is ERC721, Ownable {
    constructor() ERC721("RealEsate", "RE") {}

    uint256 tokenId = 0;
    mapping(uint256 => string) private _tokenURIs;

    function _setTokenURI(string memory _tokenURI) internal virtual {
        require(
            _exists(tokenId),
            "ERC721URIStorage: URI set of nonexistent token"
        );
        _tokenURIs[tokenId] = _tokenURI;
    }

    function safeMint(address to, string memory _tokenURI) public onlyOwner {
        _safeMint(to, tokenId);
        _setTokenURI(_tokenURI);
    }
}

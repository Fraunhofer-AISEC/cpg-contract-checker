
pragma solidity ^0.8.4;

import "@openzeppelin/contracts@4.7.3/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts@4.7.3/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts@4.7.3/security/Pausable.sol";
import "@openzeppelin/contracts@4.7.3/access/Ownable.sol";
import "@openzeppelin/contracts@4.7.3/utils/Counters.sol";

contract MyToken is ERC721, ERC721URIStorage,  Pausable, Ownable {
    using Counters for Counters.Counter;

    string public baseURI;  
    string public baseExtension = ".json"; 
    uint256 public cost = 0.001 ether;
    uint256 public presaleCost = 0.0001 ether;
    uint256 public maxSupply = 50;
    uint256 public maxMintAmount = 20;
    mapping(address => bool) public whitelisted;
    mapping(address => bool) public presaleWallets;
   
    Counters.Counter private _tokenIdCounter;

    constructor() ERC721("TestToken", "TST") {}

    function _baseURI() internal pure override returns (string memory) {
        return "www.something.com";
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function safeMint(address to, string memory uri) public onlyOwner {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);
    }

    function _beforeTokenTransfer(address from, address to, uint256 tokenId)
        internal
        whenNotPaused
        override
    {
        super._beforeTokenTransfer(from, to, tokenId);
    }

    

    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
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




pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract MyNFT is ERC721, ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;

    uint256 public constant MAX_TOKENS = 5000;
    
    uint256 public constant MAX_TOKENS_PER_PURCHASE = 10;

    uint256 private price = 1000000000000000; 

    bool public isSaleActive = true;
    
    Counters.Counter private _tokenIdCounter;

    constructor() ERC721("MyNFT", "NFT") {}

    function _baseURI() internal pure override returns (string memory) {
        return "ipfs://[IPFSHash]/";
    }

    function safeMint(uint256 _amount, address to) public onlyOwner {
    for(uint256 i = 0; i < _amount; i++){
        _safeMint(to, _tokenIdCounter.current());
        _tokenIdCounter.increment();
    }
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

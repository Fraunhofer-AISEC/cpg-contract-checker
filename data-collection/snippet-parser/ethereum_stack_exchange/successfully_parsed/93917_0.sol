pragma solidity ^0.8.1;

import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol';
import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol';

contract Example is ERC721, Ownable {
    
    using Strings for uint256;
    
    
    mapping (uint256 => string) private _tokenURIs;

    
    string private _baseURIextended;


    constructor(string memory _name, string memory _symbol)
        ERC721(_name, _symbol)
    {}
    
    function setBaseURI(string memory baseURI_) external onlyOwner() {
        _baseURIextended = baseURI_;
    }
    
    function _setTokenURI(uint256 tokenId, string memory _tokenURI) internal virtual {
        require(_exists(tokenId), "ERC721Metadata: URI set of nonexistent token");
        _tokenURIs[tokenId] = _tokenURI;
    }
    
    function _baseURI() internal view virtual override returns (string memory) {
        return _baseURIextended;
    }
    
    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        require(_exists(tokenId), "ERC721Metadata: URI query for nonexistent token");

        string memory _tokenURI = _tokenURIs[tokenId];
        string memory base = _baseURI();
        
        
        if (bytes(base).length == 0) {
            return _tokenURI;
        }
        
        if (bytes(_tokenURI).length > 0) {
            return string(abi.encodePacked(base, _tokenURI));
        }
        
        return string(abi.encodePacked(base, tokenId.toString()));
    }
    

    function mint(
        address _to,
        uint256 _tokenId,
        string memory tokenURI_
    ) external onlyOwner() {
        _mint(_to, _tokenId);
        _setTokenURI(_tokenId, tokenURI_);
    }
}

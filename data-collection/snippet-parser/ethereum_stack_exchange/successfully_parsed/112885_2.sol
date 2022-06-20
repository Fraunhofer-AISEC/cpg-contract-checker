pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";


contract NFTToken is ERC721 {
    
    string public nameNFT;
    string public nameSymbol;
    string public nftTokenURI;
    uint256 public nftId;

    
    mapping(uint256 => string) public tokenURIExists;
    
    
    
    mapping(uint256 => uint256) public tokenIdToValue;
    

    
    
    string  _baseURIextended;
    
    constructor () ERC721("Samresh", "SAM") {
        nameNFT = "Sam";
        nameSymbol = "SAM";
    
    }
    
    
    
    function setBaseURI(string memory baseURI_) external  {
        _baseURIextended = baseURI_;
    }
    
    
    
    function _setTokenURI(uint256 tokenId, string memory _tokenURI) internal virtual {
        require( _exists(tokenId),"ERC721Metadata: URI set of nonexistent token");
        tokenURIExists[tokenId] = _tokenURI;
    }
    
    function _baseURI() internal view virtual override returns (string memory) {
        return _baseURIextended;
    }
    
    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
            require(_exists(tokenId), "ERC721Metadata: URI query for nonexistent token");

            string memory _tokenURI = tokenURIExists[tokenId];
            string memory base = _baseURI();
            
            
            if (bytes(base).length == 0) {
                return _tokenURI;
            }
            
            if (bytes(_tokenURI).length > 0) {
                return string(abi.encodePacked(base, _tokenURI));
            }
            
            
            return string(abi.encodePacked(base, tokenId));
    }
        
  
    function Mint (string memory _tokenURI, uint256 _nftPrice) public returns (uint256)  {
        require(msg.sender != address(0));
        nftTokenURI = _tokenURI;
        
        nftId ++;
        
        require(!_exists(nftId));
        tokenIdToValue[nftId] = _nftPrice;
        _mint(msg.sender,nftId);
        _setTokenURI(nftId, nftTokenURI);
        
        return nftId;
        
    }
    
    function tokenPrice (uint256 _tokenID) public view returns (uint256 nftPrice) {
        require(!_exists(nftId));
        nftPrice = tokenIdToValue[_tokenID]; 
    } 
    
    
}

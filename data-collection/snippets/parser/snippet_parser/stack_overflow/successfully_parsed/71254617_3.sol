 contract NFT is ERC721{
    function _setTokenURI(uint256 tokenId, string memory _tokenURI) internal virtual {
       require(_exists(tokenId), "...");
       _tokenURIs[tokenId] = _tokenURI;
           }
   }

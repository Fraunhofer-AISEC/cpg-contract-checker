mapping (uint256 => string) public tokenIdToImageId;

function mint(uint256 _tokenId, string _imageId) external {
    tokenIdToImageId[_tokenId] = _imageId;
    
}

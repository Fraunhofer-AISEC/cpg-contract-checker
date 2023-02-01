mapping (uint256 => uint8) tokenIdToStrength;

function mint() external {
    uint256 tokenId = 
    tokenIdToStrength[tokenId] = 100;
}

function transferFrom(address _from, address _to, uint256 _tokenId) external {
    require(tokenIdToStrength[_tokenId] > 0, 'Strength is zero, cannot transfer anymore');
    tokenIdToStrength[_tokenId]--; 
    
} 

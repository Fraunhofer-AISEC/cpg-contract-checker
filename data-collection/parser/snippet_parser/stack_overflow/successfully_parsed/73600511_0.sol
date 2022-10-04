mapping(uint256 => uint256) public tokenRarities;

function setTokenRarities(uint256[] calldata _tokenRarities) external onlyOwner {
   for (uint i = 0; i < _tokenRarities.length - 1; i += 2) {
       tokenRarities[_tokenRarities[i]] = _tokenRarities[i + 1];
   }
}

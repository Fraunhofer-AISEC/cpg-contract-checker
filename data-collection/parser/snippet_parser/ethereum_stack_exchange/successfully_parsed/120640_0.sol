function getAllTokensOfUser(address account) public view returns (uint256[] memory) {
    uint256[] memory allTokens = new uint256[](balanceOf(account));
    uint256 j = 0;
    for(uint256 i=0;i<maxSupply;i++){
        if(_exists(i) && ownerOf(i) == account){
            allTokens[j] = i;
            j += 1;
        }
    } 
    return allTokens;
}

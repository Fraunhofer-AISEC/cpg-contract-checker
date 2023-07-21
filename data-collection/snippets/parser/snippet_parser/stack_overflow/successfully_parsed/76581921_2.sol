function _checkIDs(address _owner) internal view returns (uint256[] memory) {
    uint256 _maxsupply = NFT.totalSupply();
    uint256[] memory ids = new uint256[](100); 
    uint256 j;
    for(uint i = 1; i <= _maxsupply; i++){
        if(NFT.ownerOf(i) == _owner){
            if (!_userIDsToStake[_owner][i]) {
                ids[j] = i;
                j++;
            }
        }
    }
    if (j == 0) {
        uint256[] memory emptyArray = new uint256[](0);
        return emptyArray;
    }
    uint256[] memory targetArray = new uint256[](j);
    for (uint256 k = 0; k < j; k++) {
        targetArray[k] = ids[k];
    }
    return targetArray;
}

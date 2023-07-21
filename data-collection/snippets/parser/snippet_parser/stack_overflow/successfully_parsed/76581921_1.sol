function _checkIDs(address _owner) internal view returns  (uint256[] memory) {
    uint256 _maxsupply = NFT.totalSupply();
    uint256[] memory ids;
    uint256 j = 0;
    for(uint i = 1; i <= _maxsupply; i++){
        if(NFT.ownerOf(i) == _owner){
            if(!_userIDsToStake[_owner][i]){
                ids[j] = i;
                j += 1;
            }
        }
    }
    return ids;
}

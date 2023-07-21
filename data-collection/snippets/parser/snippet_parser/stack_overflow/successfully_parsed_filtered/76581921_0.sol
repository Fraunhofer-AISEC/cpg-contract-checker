 function _checkIDs(address _owner) internal returns  (uint256[] memory) {
    uint256 _maxsupply = NFT.totalSupply();
    for(uint i = 1; i <= _maxsupply; i++){
        if(NFT.ownerOf(i) == _owner){
            if(!_userIDsToStake[_owner][i]){
                _userBalance[_owner].push(i);
            }
        }
    }
    return _userBalance[_owner];
}

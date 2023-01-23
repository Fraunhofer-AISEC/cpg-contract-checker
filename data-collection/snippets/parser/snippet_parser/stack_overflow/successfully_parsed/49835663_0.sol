

function tokenOfOwnerByIndex(address _owner, uint256 _index) public view returns (uint _tokenId) {
    
    
    assert(_index<balanceOf(_owner)); 
    return ownedTokenIds[_owner][_index];
}

  function tokenOfOwnerByIndex(address _owner, uint256 _index) 
    external 
    view 
    returns (uint256 _tokenId) 
  {
    require(_index < balanceOf(_owner));
    return ownedTokens[_owner][_index];
  }

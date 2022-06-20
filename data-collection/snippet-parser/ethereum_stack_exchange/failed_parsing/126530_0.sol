function transferFrom(address _from, address _to, uint256 _tokenId) external **payable** {
    require (zombieToOwner[_tokenId] == msg.sender || zombieApprovals[_tokenId] == msg.sender);
    _transfer(_from, _to, _tokenId);
  }

function approve(address _approved, uint256 _tokenId) external **payable** {

}

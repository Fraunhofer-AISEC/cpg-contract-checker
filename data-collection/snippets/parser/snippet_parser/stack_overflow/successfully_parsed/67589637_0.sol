function transfer(uint256 _tokenId) external {
    require(msg.sender == ownerOf(_tokenId)
        || isApprovedForAll(ownerOf(_tokenId), msg.sender)
        || msg.sender == getApproved(_tokenId), 'Sender not allowed');

    if (approved != address(0x0)) {
        tokenApprovals[_tokenId] = address(0x0);
        emit Approval(_tokenOwner, address(0x0), _tokenId);
    }

    
}

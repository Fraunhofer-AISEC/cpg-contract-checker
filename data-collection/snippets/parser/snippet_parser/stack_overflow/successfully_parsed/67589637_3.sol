function _removeApproval(uint256 _tokenId, address _tokenOwner) private {
    tokenApprovals[_tokenId] = address(0x0);
    emit Approval(_tokenOwner, address(0x0), _tokenId);
}

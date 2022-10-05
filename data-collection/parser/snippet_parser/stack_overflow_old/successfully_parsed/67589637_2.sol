function isSenderAllowed(uint256 _tokenId, address _tokenOwner, address _approved) external view returns (bool) {
    return (msg.sender == _tokenOwner
        || isApprovedForAll(_tokenOwner, msg.sender)
        || msg.sender == _approved);
}

 function revokeCredential(uint256 tokenId) external {
    require(
        _minters[tokenId] == msg.sender,
        "Only the issuer can revoke a credential"
    );
    _burn(tokenId);
}

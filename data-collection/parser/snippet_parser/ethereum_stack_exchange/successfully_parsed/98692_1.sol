function approveAndTransfer(IERC721 nft, uint256 _tokenId, address _from, address _to) public {
    require(nft.ownerOf(_tokenId) == msg.sender, "NOT OWNER");
    nft.isApprovedForAll(_from, address(this));
    nft.safeTransferFrom(msg.sender, _to,_tokenId);
}

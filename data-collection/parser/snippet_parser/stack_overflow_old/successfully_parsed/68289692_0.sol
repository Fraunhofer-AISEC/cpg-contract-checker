function onERC721Received(address, address _from, uint256 _tokenId, bytes calldata) external override returns(bytes4) {
    nftContract = ERC721(msg.sender);
    tokenId = _tokenId;
    tokenAdded = true;

    return 0x150b7a02;
}

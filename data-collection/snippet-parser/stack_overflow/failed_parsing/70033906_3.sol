function transferToken(from address, address to, uint256 tokenId) external {
    firstContract.transferByAnybody(from, to, tokenId); 
}

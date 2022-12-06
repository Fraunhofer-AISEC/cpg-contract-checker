function bid(address _nft, uint _nftId, uint _startingBid) {
    

    IERC721 nft = IERC721(_nft);
    nft.safeTransferFrom(msg.sender, address(this), _nftId);

    
}

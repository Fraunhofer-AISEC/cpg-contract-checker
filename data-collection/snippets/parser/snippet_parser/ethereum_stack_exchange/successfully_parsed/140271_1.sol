if (IERC165(nftContract).supportsInterface(INTERFACE_ID_721)) {
   Market.Listing memory listing = _listings[uid][0];
   require(IERC721(nftContract).ownerOf(tokenId) == msg.sender, "Not owner of nft");
   require(listing .nftContract == address(0), "NFT already listed");
   
}

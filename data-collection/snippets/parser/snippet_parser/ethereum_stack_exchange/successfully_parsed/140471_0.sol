function stakeNFT(address nftContract, unint256 tokenId) {
    
    require(IERC721(nftContract).ownerOf(tokenId) == msg.sender, "Not owner of nft 721");
    

}

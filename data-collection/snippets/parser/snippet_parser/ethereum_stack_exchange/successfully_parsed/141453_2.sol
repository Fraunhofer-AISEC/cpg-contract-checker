function transferNFT(address _nft, uint256 _tokenId) public {
    
    require(ERC721(_nft).getApproved(_tokenId) == address(this) ||
        isApprovedForAll(tx.origin, address(this)) == true,
        "Not approved to transfer NFT");
    
    require(ERC721(_nft).ownerOf(_tokenId) == tx.origin, "Not owner of token");

    
    ERC721(_nft).transferFrom(tx.origin, address(this), _tokenId);

    
    require(ERC721(_nft).ownerOf(_tokenId) == address(this), "Transfer failed");
}

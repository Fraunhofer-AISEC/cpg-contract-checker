const INTERFACE_ID_721 = 0x80ac58cd;

function list(address nftContract, uint256 tokenId, uint256 price) public payable nonReentrant {
    if (IERC165(nftContract).supportsInterface(INTERFACE_ID_721)) {
       require(IERC721(nftContract).ownerOf(tokenId) == msg.sender, "Not owner of nft");
       require(_listings[uid][0].nftContract == address(0), "NFT already listed");
       
    }
}

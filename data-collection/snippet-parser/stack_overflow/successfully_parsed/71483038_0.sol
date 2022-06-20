  function makeMarketItem(
        address nftContract,
        uint256 tokenId,
        uint256 price
    ) public payable nonReentrant {
        IERC721(nftContract).transferFrom(msg.sender, address(this), tokenId);
}

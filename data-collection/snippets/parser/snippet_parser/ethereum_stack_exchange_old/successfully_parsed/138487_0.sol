function cancelAllSales() external onlyOwner {
    require(_powerSwitch == false, "System is still Online!");
    uint256 totalItemCount = nft.balanceOf(address(this));
    for (uint256 i = 0; i < totalItemCount; i++) {
            uint256 tokenOfOwner = nft.tokenOfOwnerByIndex(address(this),i);
            if(idToMarketItem[tokenOfOwner].seller != address(0)){
            nft.safeTransferFrom(
                address(this),
                idToMarketItem[tokenOfOwner].seller,
                tokenOfOwner
            );
            } else {
                nft.safeTransferFrom(
                address(this),
                owner,
                tokenOfOwner
            );
                }
            emit MarketItemRemoved(
                tokenOfOwner,
                idToMarketItem[tokenOfOwner].seller
            );
            delete idToMarketItem[tokenOfOwner];
    }
}

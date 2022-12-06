function purchase(
    uint256 id,
    address admin,
    uint256 serviceFeePercentage,
    uint256 value,
    address buyer,
    bool bid
) private {
    uint256 serviceFee = mul((value * 10**18),serviceFeePercentage) / 100;
    uint256 pay = sub(mul(value,10**18),serviceFee);

    if (bid) {
        IERC721(itemsForBid[id].tokenAddress).safeTransferFrom(
            itemsForBid[id].seller,
            buyer,
            itemsForBid[id].tokenId
        );
        IERC20(tracker_0x_address).transfer(itemsForBid[id].seller, pay);
        IERC20(tracker_0x_address).transfer(admin, serviceFee);
    } else {
        IERC721(itemsForSale[id].tokenAddress).safeTransferFrom(
            itemsForSale[id].seller,
            buyer,
            itemsForSale[id].tokenId
        );
        IERC20(tracker_0x_address).transferFrom(
            buyer,
            itemsForSale[id].seller,
            pay
        );
        IERC20(tracker_0x_address).transferFrom(buyer, admin, serviceFee);
    }
    emit itemSold(id, buyer, value, bid);
}

  function buyItem(
    uint256 id,
    address admin,
    uint256 serviceFeePercentage,
    uint256 value
)
    external
    ItemExists(id)
    IsForSale(id)
    HasTransferApproval(
        itemsForSale[id].tokenAddress,
        itemsForSale[id].tokenId
    )
{
    require(itemsForSale[id].active, "Item is no longer on sale");
    require(!itemsForSale[id].isSold, "Item is sold");
    require(value >= itemsForSale[id].askingPrice, "Not enough funds sent");
    require(msg.sender != itemsForSale[id].seller);

    itemsForSale[id].isSold = true;
    itemsForSale[id].active = false;
    activeItemsActivator(
        itemsForSale[id].tokenAddress,
        itemsForSale[id].tokenId,
        false
    );

    purchase(id, admin, serviceFeePercentage, value, msg.sender, false);
}

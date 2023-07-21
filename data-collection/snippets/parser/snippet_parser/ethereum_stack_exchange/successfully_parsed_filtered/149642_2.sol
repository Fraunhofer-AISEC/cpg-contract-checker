function getAllItems() external view returns (Item[] memory) {
    Item[] memory itemList = new Item[](itemIndex);
    uint256 j = 0;
    for (uint256 i; i < itemIndex; i++) {
        bytes32 itemId = bytes32(i);
        if (itemAvailable[itemId]) {
            itemList[j] = items[itemId];
            j++;
        }
    }
    Item[] memory filteredItemList = new Item[](j);
    for (uint256 i; i < j; i++) {
        filteredItemList[i] = itemList[i];
    }
    return filteredItemList;
}

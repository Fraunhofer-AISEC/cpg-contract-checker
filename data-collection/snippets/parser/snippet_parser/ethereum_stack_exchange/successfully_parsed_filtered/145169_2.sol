function mint(string memory categoryName) public payable {
    Category storage c = categories[categoryName];
    uint256 unmintedIndex = getUnminted(categoryName);

    
    require(c.items.length > 0, "Invalid category");

    
    require(msg.value == mintPrice, "Invalid amount");

    

    
    Item storage currentItem = c.items[unmintedIndex];
    currentItem.minted = true;
}

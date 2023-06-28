function getUnminted(string memory categoryName) public view returns (uint256 itemIndex) {
    
    Category storage c = categories[categoryName];
    for (uint i = 0; i < c.items.length; i++) {
        if (c.items[i].minted == false) {
            return i;
        }
    }
    revert("No tokens available");
}

  function buyItem(uint256 itemId, uint256 amount) external payable {

    uint256 ethPrice;
    require(msg.value >= ethPrice);
    itemsOwned[msg.sender][itemId] += amount;
    
}

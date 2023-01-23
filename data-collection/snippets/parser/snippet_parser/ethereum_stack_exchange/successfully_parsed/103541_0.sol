ItemForSale[] public itemsForSale;
function totalItemsForSale() external view returns(uint256) {
    return itemsForSale.length;
  }

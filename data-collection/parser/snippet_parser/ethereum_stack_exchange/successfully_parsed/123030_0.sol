 function buyItem(uint256 _upc)
    public
    payable
    
    forSale(_upc)
    
    paidEnough(items[_upc].productPrice)
    
    checkValue(_upc)
{
    
    items[_upc].ownerID = msg.sender;
    items[_upc].distributorID = msg.sender;
    items[_upc].itemState = State.Sold;

    
    items[_upc].distributorID.transfer(items[_upc].productPrice);
    
    emit Sold(_upc);
}

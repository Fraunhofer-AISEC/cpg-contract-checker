uint public price;

function setPrice(uint newPrice) public {
    require(newPrice > 0);
    price = newPrice;
}

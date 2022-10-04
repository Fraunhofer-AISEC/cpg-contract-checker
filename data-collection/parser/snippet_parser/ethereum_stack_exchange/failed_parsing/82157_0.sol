function viewLocation(uint _productID, uint _location) public returns(struct){
    return Product[_productID].Location[_location].city;
}

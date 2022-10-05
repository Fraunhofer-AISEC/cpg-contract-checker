function viewLocation(uint _productID, uint _location) public returns(struct memory Location){
    return products[_productID].locations[_location];
}

function createProduct(string memory _name, uint _price) public {
    require(bytes(_name).length > 0);
    require(_price > 0);
    
}

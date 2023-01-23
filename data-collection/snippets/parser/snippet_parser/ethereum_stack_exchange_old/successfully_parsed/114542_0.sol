function addProductToStore(
    string memory _name,
    string memory _category,
    string memory _imageLink,
    string memory _descLink,
    uint256 _auctionStartTime,
    uint256 _auctionEndTime,
    uint256 _startPrice,
    uint256 _productCondition
) public {
    
    require(
        _auctionStartTime < _auctionEndTime
        
    );
    
    productIndex += 1;
    
    Product memory product = Product(
        productIndex,
        _name,
        _category,
        _imageLink,
        _descLink,
        _auctionStartTime,
        _auctionEndTime,
        _startPrice,
        0,
        0,
        0,
        0,
        ProductStatus.Open,
        ProductCondition(_productCondition)
    );
    stores[msg.sender][productIndex] = product;
    productIdInStore[productIndex] = msg.sender;
}

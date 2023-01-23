function createProduct(
    string memory _name,
    string memory _category,
    int256 _price
  ) public returns (Product) {
      productsCount++;
      products[productsCount] = Product(
        productsCount,
        _name,
        _category,
        _price
      );
    
      emit ProductCreated(productsCount, _name, _category, _price);
      return products[productsCount];
}

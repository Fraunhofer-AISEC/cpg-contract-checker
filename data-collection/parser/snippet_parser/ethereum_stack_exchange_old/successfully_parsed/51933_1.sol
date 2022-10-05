function getProduct(uint index) external view returns (uint, string, uint) {
    Product storage product = products[index];
    return (product.id, product.name, product.price);
}

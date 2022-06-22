contract Product {
    bytes32 public Name;

    function Product (bytes32 _Name) {
        Name = _Name;
    }
}

contract ProductFactory {

    bytes32[] public productNames;
    address[] public productAddresses;

    function addProduct (bytes32 _productName) {
        address newProduct = new Product(_productName);
        productAddresses.push(newProduct);
    }

    function getName (uint i) {
    Product prod = Product(productAddresses[i]);

    productNames[i] = prod.Name();
  }
}

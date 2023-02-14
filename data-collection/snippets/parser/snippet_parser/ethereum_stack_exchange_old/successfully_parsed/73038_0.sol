pragma solidity ^0.5.0;

contract Product {
    Factory public factory;
    Product public reference;
function Product(Product _reference, Factory _factory){
    reference = _reference;
    factory = _factory;
}

function haveFactoryCreateProductWithReferenceToThis() public {
    emit ProductCreated(factory.createNewProduct(this));
}

event ProductCreated(Product indexed product);
}

contract Factory{
    function createNewProduct(Product _reference) public returns (Product) {
        Product p = new Product(_reference, this);
        return p;
    }
}

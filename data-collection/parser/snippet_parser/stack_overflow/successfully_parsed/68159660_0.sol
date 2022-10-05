
pragma solidity ^0.5.16;


contract Rating {
    
    
    struct Product {
        uint id;
        string name;
        uint RatingCount;
    }

    
    mapping(uint => product) public products;

    
    uint public productsCount;

    constructor () public {
        addProduct("Nike");
        addProduct("Adidas");
    }

    
    
    function addProduct(string memory _name) private {
        productsCount++;
        products[productsCount] = Product(productsCount, _name, 0);
    }

}

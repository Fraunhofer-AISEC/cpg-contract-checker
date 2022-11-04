

pragma solidity >=0.7.0 <0.9.0;

contract C {
    
    struct Product { 
        uint price;
    }
    
    
    
    Product[] products;

    function doSomething() public {
        products.push(Product({price: 100}));
        products.push(Product({price: 200}));
        products[0] = products[1];
        products[1].price = 300;
    }

    
    
    function getProductAtIndex(uint _index) public view returns(Product memory) {
        return products[_index];
    }
}


pragma solidity 0.8.1;

contract ManageProduct {
    
    struct Product {
        string name;
        uint256 price;
    }
    
    Product[] public products;
    
    constructor(){}
     
    function addProduct(string calldata _name, uint256 _price) external {
        products.push(Product(_name, _price));    
     }
}

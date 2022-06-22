pragma solidity ^0.4.7;

contract Products {
    struct Product {
        bytes32 name;
        uint votes;
        address company;
    }

    mapping (uint => Product) products;
    mapping (address => uint) companyProductsCounter;
    uint private counter;

    function Products () {
        counter = 0;
    }

    function registerProduct( bytes32 productName) {
        products[counter++] = Product({name: productName, votes: 0, company: msg.sender});
    }

    function getProduct(uint code) constant returns (bytes32 name, uint votes, address company) {
        products[code].name;
        products[code].votes;
        products[code].company;
    }
}

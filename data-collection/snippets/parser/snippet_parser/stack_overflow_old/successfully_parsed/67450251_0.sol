pragma solidity ^0.5.0;

contract Products {
    uint256 public productsCount = 0;

    struct Product {
        uint256 id;
        string name;
        string category;
        int256 price;
    }

    mapping(uint256 => Product) public products;

    event ProductCreated(
        uint256 id,
        string name,
        string category,
        int256 price
    );

    event ProductEdited(uint256 id, string name, string category, int256 price);

    event ProductDeleted(
        uint256 id,
        string name,
        string category,
        int256 price
    );

    constructor() public {
        createProduct("Test", "Test", 53);
    }

    function createProduct(
        string memory _name,
        string memory _category,
        int256 _price
    ) public {
        productsCount++;
        products[productsCount] = Product(
            productsCount,
            _name,
            _category,
            _price
        );

        emit ProductCreated(productsCount, _name, _category, _price);
    }

    function editProduct(
        uint256 _id,
        string memory _name,
        string memory _category,
        int256 _price
    ) public {
        Product memory _product = products[_id];
        _product.name = _name;
        _product.category = _category;
        _product.price = _price;
        products[_id] = _product;

        emit ProductEdited(_id, _name, _category, _price);
    }

    function deleteProduct(uint256 _id) public {
        Product memory _product = products[_id];

        delete products[_id];

        productsCount--;

        emit ProductDeleted(
            _id,
            _product.name,
            _product.category,
            _product.price
        );
    }
}

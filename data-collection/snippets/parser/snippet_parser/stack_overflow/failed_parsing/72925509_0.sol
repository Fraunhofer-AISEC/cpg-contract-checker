pragma solidity ^0.8.7;

contract Store is Ownable {
    struct Product {
        string name;
        uint32 quantity;
        bool exists;
    }

    uint64 private productId;

    mapping(uint => Product) private products;

    constructor() {
        productId = 1;
    }

    function addProduct(string calldata name, uint32 quantity) public onlyOwner
        require(quantity > 0, "Quantity cannot be negative integer");

        productId = productId + 1;

        products[productId] = Product(name, quantity, true);
    }

    function listProducts() external view returns (string[] memory){
        string[] memory productsInfo = new string[](productId);

        if(productId < 1){
            return productsInfo;
        }

        for(uint i = 0; i < productId; i++){
            string memory info = products[i + 1].name;

            productsInfo[i] = info;
        }

        return productsInfo;
    }
}

pragma solidity ^0.5.0;

contract Product{ 
    uint public totalProducts = 0;
    struct ProductStruct {  
        address productOwner; 
        uint productId;
        string uniqueName;  
        string platform;
        uint aspect1Score;
        uint aspect2Score;
        uint aspect3Score;
        uint aspect4Score;
        uint aspect5Score;
        uint totalScore;
    }

    mapping(uint => ProductStruct) public ProductStructs;

    function setProduct (string memory _productName, string memory _platform) public {
        totalProducts ++;
        ProductStruct storage newProduct = ProductStructs[totalProducts];
        newProduct.productOwner = msg.sender;
        newProduct.productId = totalProducts;
        newProduct.uniqueName = _productName;
        newProduct.platform = _platform;
        newProduct.aspect1Score = 100;
        newProduct.aspect2Score = 100;
        newProduct.aspect3Score = 100;
        newProduct.aspect4Score = 100;
        newProduct.aspect5Score = 100;
        newProduct.totalScore = 500;
    }

    function getProduct(uint _productId) public view returns (string memory _uniqueName) {
        _productId = totalProducts;
        return ProductStructs[_productId].uniqueName;
    }
}



pragma solidity ^0.8.7;

contract Store{
    struct Product {
        string name;
        uint32 quantity;
        bool exists;
    }
     address private Owner; 
     uint64 private productId;
     mapping(uint => Product) private products;

     constructor() {
        productId = 1;
        Owner = msg.sender;
     }

     modifier onlyOwner{
        require(msg.sender == Owner, "Fail! only admin can access this 
        function!");
         _;
      }

    function addProduct(string calldata _name, uint32 _quantity) public 
    onlyOwner{
        Product memory _strucObj;
        _strucObj.name = _name;
        _strucObj.quantity = _quantity;
        products[productId -1] = _strucObj;
        productId++;
    }

    function listProducts() external view returns (string[] memory){
        string[] memory productsInfo = new string[](productId);

        if(productId < 1){
            return productsInfo;
        }

        
        string memory dash = "-";

        for(uint i = 0; i < productId; i++){
            string memory info = products[i].name;

            productsInfo[i] = info;
        }

        return productsInfo;
    }

   function CheckProductsByIndex(uint index) public view returns(string memory name)
    {
         string[] memory productsInfo = new string[](productId);
         for(uint i = 0; i < productId; i++)
         {
             string memory _toArray = products[i].name;
             productsInfo[i] = _toArray;
         }
        return productsInfo[index];
    }
}

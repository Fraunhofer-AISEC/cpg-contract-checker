contract Data {

    
    struct Product {
        string name;
        uint price;
        uint discount_factor;
    }
    
    uint numProducts;
    
    
    mapping (uint => Product) public ProductsList;
   
    
    mapping (uint => address payable[]) public buyers;

    function getProductPrice(uint prodId) public returns (uint) {
        return ProductsList[prodId].price;
    }
    
    function updateProduct(uint prodId, address payable b) public {
        buyers[prodId].push(b);
        
        Product storage product = ProductsList[prodId];
        uint numBuyers = buyers[prodId].length;
        
        product.price = product.price - numBuyers * product.discount_factor;
    }

}

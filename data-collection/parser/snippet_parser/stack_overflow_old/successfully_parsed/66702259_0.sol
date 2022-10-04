mapping(uint => Product) public products;

struct Product {

    uint id;
    string name;
    uint price;
    address payable owner;
    bool purchased;   
}

function purchaseProduct(unit _id) public payable {

    Product memory _product = products[_id];
    address payable _seller = _product.owner;
    address payable _buyer = msg.sender;
}

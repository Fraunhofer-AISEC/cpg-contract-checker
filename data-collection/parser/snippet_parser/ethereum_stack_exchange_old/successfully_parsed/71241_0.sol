struct Product{
    bytes32 product_code;
    bytes32 product_name;
    uint quantity;
    uint unit_price;  
}

struct PurchaseOrder{
    bytes32 po_number;
    string po_creation_date;
    
    mapping( bytes32 => Product[]) products;  
}


mapping(uint => PurchaseOrder) purchaseOrders;

uint po_number = 100;

function createPO(string memory po_creation_date,bytes32[] memory products) public returns(bool){

    require(msg.sender == buyerAddress);
    po_number++;
    purchaseOrders[po_number].po_creation_date = po_creation_date;

    for (uint256 i = 0; i < products.length; i++) {
        bytes32[] memory arr=new bytes32[](products.length);
        arr[0]= products[i];
        
        purchaseOrders[po_number].products[product_code].push(Product(arr)); 
    }

}

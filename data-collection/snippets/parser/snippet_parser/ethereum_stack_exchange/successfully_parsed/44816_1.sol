contract X {
    struct PRODUCT {
        bytes12 productid;
        uint price;
        uint quantity;
    }

    mapping (string => PRODUCT[]) products;

    function appendDetails(string pid, bytes12 productid, uint price, uint quantity) payable public {
        products[pid].push(PRODUCT(productid, price, quantity));
    }

    function getDetails(string pid, uint idx) 
    public view returns(bytes12 productid, uint price, uint quantity) {
        PRODUCT storage p = products[pid][idx];

        productid = p.productid;
        price = p.price;
        quantity = p.quantity;
    }

    function getDetailsCount(string pid) 
    public view returns(uint) {
        return products[pid].length;
    }
}

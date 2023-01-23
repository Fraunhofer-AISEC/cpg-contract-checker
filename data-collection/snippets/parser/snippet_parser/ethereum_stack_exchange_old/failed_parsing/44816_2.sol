contract X {
    struct PRODUCT {
        uint price;
        uint quantity;
    }

    mapping (string => mapping (bytes12  PRODUCT) ) products;

    function appendDetails(string pid, bytes12 productid, uint price, uint quantity) payable public {
        products[pid][productid].push(PRODUCT(price, quantity));
    }

    function getDetails(string pid, bytes12 productid) 
    public view returns(uint price, uint quantity) {
        PRODUCT storage p = products[pid][productid];

        price = p.price;
        quantity = p.quantity;
    }
}

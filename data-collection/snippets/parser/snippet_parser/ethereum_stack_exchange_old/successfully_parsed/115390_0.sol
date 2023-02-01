contract TheStore {
     
    struct Store {
        uint id;
        string name;
        uint quintity;
    }

    mapping(address => Store) store;
    Store[] public StoreArray;

    event AddNewProduct(address sender, uint id, string name, uint quintity);

    function newProduct(uint id,  string memory name, uint quintity) public {
        Store storage products = store[msg.sender];
        products.id = id;
        products.name = name;
        products.quintity = quintity;
        StoreArray.push(Store(id, name, quintity));
        emit AddNewProduct(msg.sender, id, name, quintity);
    }

    function getProduct() public view returns (uint id,  string memory name, uint quintity) {
        Store storage products = store[msg.sender];
        return(products.id, products.name, products.quintity);
    }

    function AllProducts() public view returns (Store[] memory)
    {
        return StoreArray;
    }
         
}

contract TheStore is Ownable {
     
    struct Store {
        uint id;
        uint quantity;
    }

    mapping(address => Store[]) public productsId;
    Store[] public store;

    
    function addProduct(uint id,  uint quantity) public {
        if(id == store.id){
     product[id].quantity +=  quantity
    }
        store.push(Store({id: id ; quantity: quantity}));
    }

    function AllProducts() public view returns (Store[] memory)
    {
        return store;
    }

         
}```

function addProduct(uint id,  uint quantity) public {
    
    for (uint i; i < store.length; i++) {
        if (store[i].id == id) {
            
            store[i].quantity += quantity;
            return;
        }
    }

    
    store.push(Store(id, quantity));
}

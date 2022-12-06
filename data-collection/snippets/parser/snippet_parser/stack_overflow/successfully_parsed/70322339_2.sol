mapping (uint => uint) productIdToArrayIndex;

function addProduct(uint id,  uint quantity) public {
    uint arrayIndex = productIdToArrayIndex[id];
    if (arrayIndex > 0) {
        
        store[arrayIndex].quantity += quantity;
    }

    
    store.push(Store(id, quantity));
    productIdToArrayIndex[id] = store.length - 1;
}

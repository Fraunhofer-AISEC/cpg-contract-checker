function insertAddress(address[] addressUser) public returns (bool) {
    
    address lastAddr = addres(0);
    for(uint i = 0; i < addressUser.length, i++) {
        address addr = addressUser[i];
        
        
        
        require(addr > lastAddr);
        lastAddr = addr;
        
        if (userAddr[addr] == false) {
            userAddr[addr] = true;
            addressList.push(addr);
        }
    }

    return true;
}

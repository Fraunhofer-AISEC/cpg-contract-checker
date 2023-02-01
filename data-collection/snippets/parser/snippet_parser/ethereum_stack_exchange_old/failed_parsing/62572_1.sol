address[] public addressList;
mapping (address => bool) public userAddr; 

function insertAddress(address[] addressUser) public returns (bool) {
    
    mapping (address => bool) memory uniq;
    for(uint i = 0; i < addressUser.length, i++) {
        address addr = addressUser[i];
        
        require(uniq[addr] == false);
        uniq[addr] = true;
        
        if (userAddr[addr] == false) {
            userAddr[addr] = true;
            addressList.push(addr);
        }
    }

    return true;
}

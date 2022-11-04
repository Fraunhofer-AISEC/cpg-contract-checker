

function listHomesByAddress(string _physicalAddress) public returns(uint [] _id ) {
    uint [] results;
    for(uint i = 0 ; i<homes.length; i++) {
        if(keccak256(homes[i].physicalAddress) == keccak256(_physicalAddress) && homes[i].available == true) {
            results.push(homes[i].id);
        }
    }
    return results;    
}

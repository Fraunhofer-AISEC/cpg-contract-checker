function listHomesByAddress(string _physicalAddress) public view returns(uint[10]) {
    uint [10] memory results;
    uint j = 0;
    for(uint i = 0 ; i<homes.length && j < 10; i++) {
        if(keccak256(homes[i].physicalAddress) == keccak256(_physicalAddress) && homes[i].available == true) {
            results[j++] = homes[i].id;
        }
    }
    return results;

} 

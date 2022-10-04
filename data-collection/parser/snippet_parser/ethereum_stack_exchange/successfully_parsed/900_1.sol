function getAddressStreet(string addressIdentifier) public constant returns(string) {

    Address storage addressInstance = addresses[sha3(addressIdentifier)];

    if (addressInstance.initialized == false) {
        
        return "No address";
    }

    return addressInstance.street;   
}

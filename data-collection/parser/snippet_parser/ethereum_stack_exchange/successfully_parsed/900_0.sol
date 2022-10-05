function buildAddress(string identifier, string street, string city) public returns(string){

    Address storage addressInstance = addresses[sha3(identifier)];

    addressInstance.initialized = true;
    addressInstance.identifier = identifier;
    addressInstance.street = street;
    addressInstance.city = city;

    return identifier;
}

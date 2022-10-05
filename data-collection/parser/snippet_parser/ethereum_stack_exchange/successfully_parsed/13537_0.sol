contract NameRegistry {
    mapping(bytes32 => address) addressBook;

    function set(string a, address b){
        addressBook[sha3(a)] = b;
    }

    function get(string a) constant returns(address){
        return addressBook[sha3(a)];
    }
}

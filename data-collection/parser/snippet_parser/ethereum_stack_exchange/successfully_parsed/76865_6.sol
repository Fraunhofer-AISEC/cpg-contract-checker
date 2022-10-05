function implAddress() public view returns(address) {
    address i;
    bytes32 implAddressKey = IMPL_ADDRESS_KEY;
    
    assembly {
        i := sload(implAddressKey)
    }
    require(i != UNDEFINED, "Internal error. The implementation is undefined.");
    return i;
}

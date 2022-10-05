function getAddr(string AddrName) public view returns(address) {
    return addressBook[keccak256(AddrName)];
}

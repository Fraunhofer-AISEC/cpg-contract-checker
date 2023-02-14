function contractExists(address contract) public view returns (bool) {
    uint size;
    assembly {
        size := extcodesize(contract)
    }
    return size > 0;
}

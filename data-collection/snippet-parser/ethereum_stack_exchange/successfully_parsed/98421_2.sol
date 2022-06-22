function getOwnerOfPunkNumber() public returns (address ownerOfPunk) {
    return punksContract.punkIndexToAddress(9999);
}

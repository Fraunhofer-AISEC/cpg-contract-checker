function ERC721() {
    supportedInterfaces[this.supportsInterface.selector] = true;
}

function supportsInterface(bytes4 interfaceID) external view returns (bool) {
    return supportedInterfaces[interfaceID];
}

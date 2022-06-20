function bytesToAddress(bytes calldata data) private pure returns (address addr) {
    bytes memory b = data;
    assembly {
        addr := mload(add(b, 20))
    } 
}

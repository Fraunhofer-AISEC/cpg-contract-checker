function toBytes(string memory data) pure external returns(bytes memory) {
    return bytes(data);
}
function keccakBytes(string memory data) pure external returns(bytes32) {
    return keccak256(bytes(data));
}

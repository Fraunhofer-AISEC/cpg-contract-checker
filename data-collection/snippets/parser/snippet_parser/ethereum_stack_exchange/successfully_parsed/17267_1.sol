function getBackend(string contractName) returns (address) {
    return backends[keccak256(contractName)];
}

function throwError(bytes _error) constant returns (bytes32) {
    assembly {
        calldatacopy(0xff, 0, calldatasize)
        return(add(0xff, 68), 32)
    }
}

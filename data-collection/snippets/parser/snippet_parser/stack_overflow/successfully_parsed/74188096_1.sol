function getFunctionSigHash(bytes memory data) public returns(bytes4 funcHash)  {
    bytes4 funcHash;

    assembly {
        funcHash := mload(add(data, 0x20))
    }
}

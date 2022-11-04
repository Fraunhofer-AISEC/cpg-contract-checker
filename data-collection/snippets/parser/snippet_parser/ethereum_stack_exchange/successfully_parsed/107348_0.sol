function solidityKeccak (bytes memory _input) public pure returns (bytes32) {
    return keccak256(abi.encodePacked(_input));
}

function assemblyKeccak (bytes memory _input) public pure returns (bytes32 x) {
    assembly {
        x := keccak256(add(_input, 0x20), mload(_input))
    }
}

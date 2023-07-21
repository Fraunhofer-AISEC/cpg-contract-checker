function getAddress(
    bytes memory bytecode,
    bytes memory _salt
) public view returns (address) {
    bytes32 hash = keccak256(
        abi.encodePacked(bytes1(0xff), address(this), _salt, keccak256(bytecode))
    );

    
    return address(uint160(uint(hash)));
}

function createContract(uint256 x, uint256 y) external returns (address contractAddress) {
        bytes memory bytecode = type(MyContract).creationCode;
        bytecode = abi.encodePacked(bytecode, abi.encode(x, y));
        bytes32 salt = keccak256(abi.encodePacked(x, y));
        assembly {
            contractAddress := create2(0, add(bytecode, 0x20), mload(bytecode), salt)
        }
}

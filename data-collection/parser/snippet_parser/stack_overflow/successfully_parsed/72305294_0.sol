function predictDeterministicAddress(
    address implementation,
    bytes32 salt,
    address deployer
) internal pure returns (address predicted) {
    assembly {
        let ptr := mload(0x40)
        mstore(ptr, 0x3d602d80600a3d3981f3363d3d373d3d3d363d73000000000000000000000000)
        mstore(add(ptr, 0x14), shl(0x60, implementation))
        mstore(add(ptr, 0x28), 0x5af43d82803e903d91602b57fd5bf3ff00000000000000000000000000000000)
        mstore(add(ptr, 0x38), shl(0x60, deployer))
        mstore(add(ptr, 0x4c), salt)
        mstore(add(ptr, 0x6c), keccak256(ptr, 0x37))
        predicted := keccak256(add(ptr, 0x37), 0x55)
    }
}

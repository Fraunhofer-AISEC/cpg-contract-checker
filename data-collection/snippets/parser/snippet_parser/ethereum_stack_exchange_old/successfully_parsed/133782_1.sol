function create_v2() external {
    bytes memory deploymentBytecode = type(Contract).creationCode;
    address contractAddress;
    assembly {
        contractAddress := create(0, add(deploymentBytecode, 0x20), mload(deploymentBytecode))
    }
}

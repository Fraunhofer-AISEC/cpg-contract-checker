function deploy(bytes _bytecode) external returns (address) {
    address addr;
    bytes memory bytecode = _bytecode;

    assembly {
        addr := create(0, add(bytecode, 0x20), mload(bytecode))
    }

    return addr;
}

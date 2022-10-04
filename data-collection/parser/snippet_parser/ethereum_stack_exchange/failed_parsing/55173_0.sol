bytes memory bytecode = ...;
assembly {
    contractAddress := create(value, add(bytecode, 0x20), mload(bytecode))
}

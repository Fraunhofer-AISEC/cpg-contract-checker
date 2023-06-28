bytes memory bytecode = abi.encodePacked(
    type(TransparentUpgradeableProxy).creationCode,
    abi.encode(implementation, proxyAdmin, "")
);

assembly {
    contractAddress := create2(
        0,
        add(bytecode, 32),
        mload(bytecode),
        salt
    )
}

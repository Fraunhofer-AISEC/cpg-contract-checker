contract DeployContract {
    function deploy(bytes calldata _bytecode) external returns(address addr) {

        bytes memory bytecode = abi.encode(_bytecode, msg.sender);
        assembly {
            addr := create(0, add(bytecode, 0x20), mload(bytecode))
            if iszero(extcodesize(addr)) {
                revert(0, 0)
            }
        }
    }
}

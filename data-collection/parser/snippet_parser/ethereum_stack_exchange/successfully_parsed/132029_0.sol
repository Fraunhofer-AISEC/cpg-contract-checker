    function deployCode(bytes memory bytecode) internal returns (address payable addr) {
        assembly {
            addr := create(0, add(bytecode, 0x20), mload(bytecode))

            if iszero(extcodesize(addr)) {
                returndatacopy(0, 0, returndatasize())
                revert(0, returndatasize())
            }
        }
    }

    function deployCode(bytes memory bytecode) internal returns (address payable addr) {
        assembly {
            addr := create(0, add(bytecode, 0x20), mload(bytecode))

            

            let ext_code_size := extcodesize(addr)

            if iszero(ext_code_size) {
                revert(0, 0)
            }

            
            

            extcodecopy(addr, 0, 0, 1)

            if iszero(mload(0)) {
                let revert_size := sub(ext_code_size, 1)
                extcodecopy(addr, 0, 1, revert_size)
                revert(0, revert_size)
            }
        }
    }

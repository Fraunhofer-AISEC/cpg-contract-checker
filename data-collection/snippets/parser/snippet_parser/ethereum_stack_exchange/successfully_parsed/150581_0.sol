function deploy(bytes memory bytecode, bytes memory _salt) public payable {
    address addr;

    
    assembly {
        addr := create2(
            callvalue(), 
            
            add(bytecode, 0x20),
            mload(bytecode), 
            _salt 
        )

        if iszero(extcodesize(addr)) {
            revert(0, 0)
        }
    }

    emit Deployed(addr, _salt);
}

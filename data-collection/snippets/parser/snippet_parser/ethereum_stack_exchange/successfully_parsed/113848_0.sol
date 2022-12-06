function deploy(bytes memory bytecode, uint _salt) public payable returns (address){
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

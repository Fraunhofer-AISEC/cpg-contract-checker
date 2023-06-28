function deploy(address _owner, uint256 _salt) public returns (address addr) {
        bytes memory bytecode = getBytecode(_owner);
        assembly {
            addr := create2(
                0,
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

function getBytecode(address _owner) public pure returns (bytes memory) {
    bytes memory bytecode = type(Forwarder).creationCode;
    return abi.encodePacked(bytecode, abi.encode(_owner));
}

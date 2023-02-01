    function createForwarder(address forwardAddress, uint256 salt)
        public
        onlyOwner
        returns (Forwarder forwarder)
    {
        bytes memory bytecode =
            abi.encodePacked(
                type(Forwarder).creationCode,
                uint256(uint160(address(forwardAddress)))
            );

        assembly {
            forwarder := create2(0, add(bytecode, 0x20), mload(bytecode), salt)
        }

        emit Deployed(address(forwarder), salt);
    }

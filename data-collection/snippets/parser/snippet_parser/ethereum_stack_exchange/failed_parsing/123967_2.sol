 function createTest2(address address1, address address2) public {
        address addr;
        bytes32 _salt = keccak256(abi.encodePacked(address1, address1));
        bytes memory bytecode = abi.encodePacked(
                type(Test1).creationCode,
                abi.encode(address1,
                address2)
            );
        address predictedAddress = address(uint160(uint(keccak256(abi.encodePacked(
            bytes1(0xff),
            address(this),
            _salt,
            keccak256(bytecode)
        )))));

       
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
        require(addr == predictedAddress); 
    }        
}

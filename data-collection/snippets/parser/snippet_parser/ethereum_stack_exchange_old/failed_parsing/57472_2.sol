bytes memory bytecode = contractDataInfo; 
address addr;
uint256 value = 0; 

assembly {
    addr := create(value, add(bytecode, 0x20), mload(bytecode))
}

require(addr != 0, "Contract creation failed.");

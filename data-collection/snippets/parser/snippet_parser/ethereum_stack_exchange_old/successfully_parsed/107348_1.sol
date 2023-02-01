
bytes example = hex"0000000000000000000000000000000000000000000000000000000000001234"; 

function assemblyKeccakStorage () public view returns (bytes32 x) {
    assembly {
        let value := sload(keccak256(example.slot, div(sub(sload(example.slot), 1), 2)))
        let ptr := 0x40 
        mstore(ptr, value)
        x := keccak256(ptr, div(sub(sload(example.slot), 1), 2))
    }
}

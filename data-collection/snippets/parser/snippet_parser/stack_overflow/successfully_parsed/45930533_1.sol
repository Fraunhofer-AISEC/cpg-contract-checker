function getContractAIntValue() constant returns (uint c) {
    address addr = address(contractA); 
    bytes4 sig = bytes4(sha3("getIntValue()")); 

    assembly {
        let x := mload(0x40) 
        mstore(x,sig) 
        let status := delegatecall(sub(gas, 10000), addr, add(x, 0x04), 0, x, 0x20)
        jumpi(invalidJumpLabel, iszero(status)) 
        c := mload(x)
    }
}

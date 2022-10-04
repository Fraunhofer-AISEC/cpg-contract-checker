function external_call(address destination, uint value, uint dataLength, bytes data) internal returns (bool) {
    bool result;
    assembly {
        let x := mload(0x40)   
        let d := add(data, 32) 
        result := call(
            sub(gas, 34710),   
                               
                               
            destination,
            value,
            d,
            dataLength,        
            x,
            0                  
        )
    }
    return result;
}

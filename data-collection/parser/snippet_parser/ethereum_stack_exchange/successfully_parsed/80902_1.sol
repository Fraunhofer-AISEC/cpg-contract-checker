function external_call(address destination, uint value, bytes memory data) internal returns (bool) {
    bool result;
    assembly {
        result := call(
            gas(),
            destination,
            value,
            add(data, 32),     
            mload(data),       
            0,
            0                  
        )
    }
    return result;
}

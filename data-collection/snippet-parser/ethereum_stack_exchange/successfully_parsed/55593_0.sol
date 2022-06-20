function _internalNoThrowTokenFallback(address contractRecipient, address from, uint value, bytes data)
    internal
{
    
    
    
    
    
    
    assembly {
        
        let free_ptr := mload(0x40)

        
        mstore(free_ptr, 0xc0ee0b8a)

        
        
        
        
        
        
        calldatacopy(add(free_ptr, 4), 68, sub(calldatasize, 68))

        
        let result := staticcall(
            30000,                  
            contractRecipient,      
            free_ptr,               
            sub(calldatasize, 64),  
            0,                      
            0
        )

        
    }
}

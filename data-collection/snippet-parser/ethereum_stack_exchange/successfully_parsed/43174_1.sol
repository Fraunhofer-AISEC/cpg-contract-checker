function testIsSafe(address _addr)
    private
    returns (bool _isSafe)
{
    bytes32 sig = bytes4(keccak256("isSafe()"));
    bool _success = false;
    assembly {
        let x := mload(0x40)    
        mstore(x, sig)          
        _success := call(
            5000,   
            _addr,  
            0,      
            x,      
            4,      
            x,      
            32      
        )
        
        _isSafe := and(_success, mload(x))
    }
}

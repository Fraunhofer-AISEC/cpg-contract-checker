contract Auth {      
    function verify(address p, bytes32 hash, uint8 v, bytes32 r, bytes32 s) constant returns(bool) {
        
        
        
        return ecrecover(hash, v, r, s) == p;
    }
}

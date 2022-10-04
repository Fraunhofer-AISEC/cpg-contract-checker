contract signature
{
    event ret_addr(address addr);
    function sig_verify(bytes32 hash, bytes sig) returns(address)                       
    {
        bytes32 r;
        bytes32 s;
        uint8 v;
        assembly 
        {
                r := mload(add(sig, 32))
                s := mload(add(sig, 64))
                v := byte(0, mload(add(sig, 96)))
            }
        if(v<27)
            v+=27;
        ret_addr(ecrecover(hash, v, r, s));
    }
}

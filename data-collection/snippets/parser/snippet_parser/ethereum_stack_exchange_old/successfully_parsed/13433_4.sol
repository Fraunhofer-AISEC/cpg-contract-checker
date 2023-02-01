contract shaCast{
    
    function Sha3Lit() constant returns (bytes32){
        return sha3(3);
    }

    
    function Sha3LitCast() constant returns (bytes32){
        return sha3(uint32(3));
    }

    
    function Sha3Uint32() constant returns (bytes32) {
            uint32 n = 3;
            return sha3(n);
    }
}

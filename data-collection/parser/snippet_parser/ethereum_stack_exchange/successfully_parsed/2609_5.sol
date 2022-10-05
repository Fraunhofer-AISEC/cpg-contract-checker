contract random {
    
    function randomGen(uint seed) constant returns (uint randomNumber) {
        return(uint(sha3(block.blockhash(block.number-1), seed ))%100);
    }

    
    function multiBlockRandomGen(uint seed, uint size) constant returns (uint randomNumber) {
        uint n = 0;
        for (uint i = 0; i < size; i++){
            if (uint(sha3(block.blockhash(block.number-i-1), seed ))%2==0)
                n += 2**i;
        }
        return n;
    }
}

    function _generate() private {
        

            uint dna = uint(keccak256(now, msg.sender, x)); 

            

            
            
            
            
            

            for(x=0;x<dnaChunks.length;x++){

            
               uint a = dna[0,1];
               uint b = dna[2,3];
               uint c = dna[4,5];
               _create(a,b,c);
            }
            
            Owners[id] = msg.sender;
            decks[msg.sender].push(cardId);
        
    }

    function _create(uint _a, uint _b, uint _c) private returns(uint) {
        uint a = _a;
        uint b = _b;
        uint c = _c
        uint d = 1;
        return _models.push(Model(a,b,c,d)) - 1;
    }

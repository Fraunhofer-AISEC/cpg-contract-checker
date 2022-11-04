   function claim(address pool) public {    
        address manager = address(0);
        require(managers[pool] != manager,"claim is not manager"); 
         
         recordInfo memory record; 
         delete record.time;
         delete record.tokens;
         record.time = block.timestamp;
        for( uint i = 0;i < 2;i++){
            uint balance;
            tokenInfo memory token; 
            token.token = address(0);
            token.amount = balance;
            token.decimals = 18;
            record.tokens.push(token);
        }
        record_List[pool][2] = record;
    }

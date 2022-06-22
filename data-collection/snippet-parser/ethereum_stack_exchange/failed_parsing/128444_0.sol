       uint256 state;  
       event Addition(uint256 result);

       function addition(uint256 a, uint256 b)
            public       
            returns (uint256)
        {
            
            uint256 result = a + b;
            state = result;
            emit Addition(result);       
    
            return result;
        }

 function storeNum(uint mynum)
        public
        returns (bool)
    {
     require(mynum > 10);
     mynumber = mynum; 
     return true;    
    }

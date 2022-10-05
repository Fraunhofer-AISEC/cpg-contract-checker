function storeNum(uint mynum)
        public
        returns (bool success)
    {
     require(mynum > 10);
     mynumber = mynum; 
     success = true;    
    }

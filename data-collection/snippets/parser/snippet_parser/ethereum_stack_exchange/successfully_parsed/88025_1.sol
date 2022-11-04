string test;
   
    function test2() public returns(uint  a) {
        test = " awesome ";
        test3(test);
        return 10;
    }
    
    
    function test3(string storage str) private  {
        str = " changed ";
    }

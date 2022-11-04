    function compare(uint8 a, uint8 b)
    private
    requireUnpaused
    returns(bool)
    {
        
        a = a++;
        
        if (a >= 3) {
            a = 0;
        }
        
        return a == b ? true : false;
    }

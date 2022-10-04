    function findLogSimple(uint b) returns (uint){
        for(uint i=0;2**i<=b;i++){}
        return i-1;
    }
    function findLogBinarySearch(uint b) returns (uint){
        uint up = 256;
        uint down = 0;
        uint attempt = (up+down)/2;
        while (up>down+1){
            if(b>=(2**attempt)){
                down=attempt;
            }else{
                up=attempt;
            }
            attempt=(up+down)/2;
        }
        return attempt;
    }

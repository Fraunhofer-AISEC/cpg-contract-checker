    function results() public returns(string memory){
        uint a = votes[0];
        uint b = votes[1];

        votes[0]=0;
        votes[1]=0;

        if (a==b)
            return "tie";
        else if (a>b)
            return "a wins";
        else
            return "b wins";
    }

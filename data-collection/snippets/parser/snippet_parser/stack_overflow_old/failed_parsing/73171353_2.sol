
    event Creation(string message, uint idnum);


    function createBallot(
        string memory _subcategory, string memory _post
    ) public {

        
        operator = msg.sender;

        
        ballotNum ++;

        
        ballot[ballotNum] = Ballot(
            ballotNum, _subcategory, operator,
            _post, 0, 0, 0, 0
        );

        
        emit Creation("Ballot was successfully posted!", ballotNum);
        
    }

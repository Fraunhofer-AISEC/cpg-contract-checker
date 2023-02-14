function createElection(string[] memory _names) public {
        electionCount++;
        
        
        elections[electionCount].candidates[0] = Candidate(0, 0, _names[0]);


        elections[electionCount].candidates[1] = Candidate(1, 0, _names[1]);
        
        
    }

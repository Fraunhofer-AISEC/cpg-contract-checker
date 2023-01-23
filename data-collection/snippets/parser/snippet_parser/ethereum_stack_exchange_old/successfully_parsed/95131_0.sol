contract Voting {
    
    
    struct VoterCandidate {
        string voterName;
        uint voterAge;
    }
    
    
    VoterCandidate[] public candidates;

    
    function candidateRegistration(string memory _voterName, uint _voterAge) public {
        VoterCandidate memory newCandidate;
        newCandidate.voterName = _voterName;
        newCandidate.voterAge = _voterAge;
        candidates.push(newCandidate);
    }
    
}

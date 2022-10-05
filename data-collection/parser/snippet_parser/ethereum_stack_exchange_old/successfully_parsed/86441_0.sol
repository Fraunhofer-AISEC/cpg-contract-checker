
 struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

mapping(uint => Candidate) public candidates;
uint public candidateCount;

constructor() public {
    addCandidate("candidate 1");
    addCandidate("candidate 2");
}

function addCandidate(string name) private {
    candidateCount += 1;
    candidates[candidateCount] = Candidate(candidateCount, name, 0);
}

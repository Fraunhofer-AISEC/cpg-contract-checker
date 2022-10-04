Candidate[] public candidates;
uint public candidateCount;

function addCandidate(string memory name) public {
    candidates.length += 1;
    Candidate memory newCandidate;
    candidateCount++;
    newCandidate.name = name;
    newCandidate.id = candidateCount;
    newCandidate.voteCount = 0;
    candidates[candidateCount] = newCandidate;
}

struct Candidate  {
    uint id;
    string name;
    uint voteCount;
}

constructor () public {
    addCandidate("Cand1");
}

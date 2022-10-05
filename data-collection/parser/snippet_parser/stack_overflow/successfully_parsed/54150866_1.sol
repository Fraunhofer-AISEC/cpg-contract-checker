function addCandidate(string memory name) public {
    Candidate memory newCandidate = Candidate(candidateCount, name, 0);
    candidates.push(newCandidate);
}

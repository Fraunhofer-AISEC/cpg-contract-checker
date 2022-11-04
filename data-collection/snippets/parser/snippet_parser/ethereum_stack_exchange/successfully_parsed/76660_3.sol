mapping (uint => Candidate) public candidates;
uint public numCandidates = 0;

function addCandidate(string memory _name) public {
  uint idx = numCandidates;
  numCandidates += 1;
  candidates[idx].name = _name;
}

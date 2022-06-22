Candidate[] public candidates;

function addCandidate(string memory _name) public {
  uint idx = candidates.length;
  candidates.length += 1;
  candidates[idx].name = _name;
}

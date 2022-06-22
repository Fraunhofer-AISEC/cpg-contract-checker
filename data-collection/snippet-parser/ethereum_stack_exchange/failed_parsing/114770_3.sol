for (uint i = 0; i < _names.length; i++) {
    candidatesCount ++;
    string memory name = _names[i];
    elections[electionsCount].candidates.push(Candidate(candidatesCount, name, 0));
}

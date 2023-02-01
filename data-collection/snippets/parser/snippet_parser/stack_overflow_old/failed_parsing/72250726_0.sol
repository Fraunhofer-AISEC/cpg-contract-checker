modifier ownerOnly() {
    require(msg.sender == owner);
    _;
}

function Election(string _name) public {
    owner = msg.sender;
    electionName = _name;
}

function addCandidate(string name,string region) ownerOnly public {
    candidates.push(Candidate(name, 0,region));
}

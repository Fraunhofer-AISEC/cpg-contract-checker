struct Candidate {
        string name;
        uint voteCount; 
}
Candidate[] public candidates; 
function addCanditate(string memory _name) ownerOnly public {
        candidates.push(Candidate(_name, 0)); 
}

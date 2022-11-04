contract Ballot {
int public majorityVotes;
Candidate[] public candidates;
mapping (address => uint) public voterId;
Voter[] public voters;

event CandidateAdded (uint candidateId, uint amount, string description);
event Voted (uint candidateId, int result, address voter);
event Tallyvotes (uint candidateId, int result, uint tally, bool active);
}
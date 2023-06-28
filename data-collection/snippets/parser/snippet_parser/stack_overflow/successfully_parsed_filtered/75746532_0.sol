struct Candidate {
    string name;
    string department;
    string faculty;
    uint voteCount;
    string manifesto;
    string image;
}

Voter[] public voters;
Candidate[] public candidates;
Ballot[] public ballots;

function addBallot(string memory ballot_name,
    uint[] memory candidate_indexes,
    string memory key,
    string memory value
   ) public {
    Candidate[] memory cands;
    Voter[] memory voters_list;
    
    for (uint i = 0; i < candidate_indexes.length; i++) {
        cands[cands.length] = candidates[i];
    }
    if (keccak256(abi.encodePacked(key)) == keccak256(abi.encodePacked("all"))) {
        voters_list = voters;
    }
    else if (keccak256(abi.encodePacked(key)) == keccak256(abi.encodePacked("fac"))) {
        for (uint i = 0; i < voters.length; i++) {
            if (keccak256(abi.encodePacked(voters[i].faculty)) == keccak256(abi.encodePacked(value))) {
                voters_list[voters_list.length] = voters[i];
            }
        }
    }
    else {
        for (uint i = 0; i < voters.length; i++) {
            if (keccak256(abi.encodePacked(voters[i].department)) == keccak256(abi.encodePacked(value))) {
                voters_list[voters_list.length] = voters[i];
            }
        }
    }

    ballots.push(Ballot({name: ballot_name, candidates: cands, allowedVoters: voters_list, totalVotes: 0}));
}

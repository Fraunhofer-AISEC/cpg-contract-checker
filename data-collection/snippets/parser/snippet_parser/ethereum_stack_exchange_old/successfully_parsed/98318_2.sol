mapping (address => bool) private voted;

function VoteA() public {
    require(voted[msg.sender] == false, 
        "user already voted");
    CandidateA++;
    voted[msg.sender] == true;
}

function VoteB() public {
    require(voted[msg.sender] == false, 
        "user already voted");
    CandidateB++;
    voted[msg.sender] == true;
}

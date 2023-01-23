contract Election {

uint CandidateA;
uint CandidateB;
string Result;



function VoteA() public {
    CandidateA++;
}

function VoteB() public {
    CandidateB++;
}


function getVotesA() public view returns (uint) {
    return CandidateA;
}

function getVotesB() public view returns (uint) {
    return CandidateB;
}


function CoutingVotes() public {
    if(CandidateA > CandidateB) {Result = "A Won";} else {
        Result = "B Won";} 
}  


function ResultElection() public view returns (string memory) { 
    return Result;

}
     
}
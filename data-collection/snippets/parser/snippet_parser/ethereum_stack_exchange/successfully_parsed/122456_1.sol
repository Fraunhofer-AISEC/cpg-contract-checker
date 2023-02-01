Elections storage newElection = elections[electionCount];

newElection.candidates.push();

Candidate storage newCandidate = elections[electionCount].candidates[0];

newCandidate.candidateID = 0;
newCandidate.voteCount = 0;
newCandidate.name = "candidate name";

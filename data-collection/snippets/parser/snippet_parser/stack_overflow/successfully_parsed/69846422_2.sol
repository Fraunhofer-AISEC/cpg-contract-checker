function castVote(address _address) public {
            votes[msg.sender] = _address;
            Candidate storage candi = candidates[_address];
            candi.numVotes = candi.numVotes + 1; 
        }

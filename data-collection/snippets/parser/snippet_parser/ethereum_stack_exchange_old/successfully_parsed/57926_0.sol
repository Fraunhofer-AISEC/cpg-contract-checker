pragma solidity ^0.4.18;


contract Voting {
    
    
    
    event AddedCandidate(uint candidateID);

    
    struct Voter {
        bytes32 uid; 
        uint candidateIDVote;
    }
    
    struct Candidate {
        bytes32 name;
        bytes32 party; 
        
        
        bool doesExist; 
    }

    
    
    uint numCandidates; 
    uint numVoters;

    
    
    
    
    
    mapping (uint => Candidate) candidates;
    mapping (uint => Voter) voters;
    
    

    function addCandidate(bytes32 name, bytes32 party) public {
        
        uint candidateID = numCandidates++;
        
        candidates[candidateID] = Candidate(name,party,true);
        AddedCandidate(candidateID);
    }

    function vote(bytes32 uid, uint candidateID) public {
        
        if (candidates[candidateID].doesExist == true) {
            uint voterID = numVoters++; 
            voters[voterID] = Voter(uid,candidateID);
        }
    }

    
    

    
    
    function totalVotes(uint candidateID) view public returns (uint) {
        uint numOfVotes = 0; 
        for (uint i = 0; i < numVoters; i++) {
            
            if (voters[i].candidateIDVote == candidateID) {
                numOfVotes++;
            }
        }
        return numOfVotes; 
    }

    function getNumOfCandidates() public view returns(uint) {
        return numCandidates;
    }

    function getNumOfVoters() public view returns(uint) {
        return numVoters;
    }
    
    function getCandidate(uint candidateID) public view returns (uint,bytes32, bytes32) {
        return (candidateID,candidates[candidateID].name,candidates[candidateID].party);
    }
}

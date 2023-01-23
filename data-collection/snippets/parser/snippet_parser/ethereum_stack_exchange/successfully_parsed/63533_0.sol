pragma solidity 0.4.24;

contract Election {
    
    struct Candidate{
        uint id;
        string name;
        uint voteCount;
    }
    
    
    mapping(uint=>Candidate)public candidates;
    
    uint public candidateCount;
    function election()public{
        addCandidate("Donald Trump");
        addCandidate("Barak Obama");
    }

    function addCandidate(string memory _name)private{
        candidateCount++;
        candidates[candidateCount] = Candidate(candidateCount,_name,0);
    }
}  


pragma solidity ^0.8.0;

contract Election {
    uint public candidatesCount;
    uint public votersCount;

    struct Candidate {
        uint id;
        string name;
        string party;
        uint voteCount;
    }

    mapping(uint=> Candidate) public candidates;
    mapping(address => bool) public voted;
    
    
    function addCandidate(string memory _name, string memory _party) public{
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, _party, 0);
    }
    

    function addVoter() public {
        voted[msg.sender] = false;
    }
    
    function vote(uint _candidateId) public {
        require(!voted[msg.sender], "You have already voted");
        require(candidates[_candidateId].id != 0, "Candidate does not exist");
        voted[msg.sender]= true;
        candidates[_candidateId].voteCount++;
    }
}

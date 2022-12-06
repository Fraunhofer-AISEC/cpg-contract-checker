pragma solidity 0.5.0;

contract Election {
    string public candidate;

    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    mapping(uint => Candidate) candidate;

    uint public candidatesCount;

    function createCandidate(string storage name ) private {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, name, 0);
    }  

    function addCandidates () public {
        createCandidate("Candidate1");
        createCandidate("Candidate2");
    }
}

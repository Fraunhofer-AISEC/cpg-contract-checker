pragma solidity ^0.5.16;

contract please{
    struct Candidate{
        uint id;
        string name;
        uint votecount;
    }
    uint public candidatesCount;
    
    mapping(uint => Candidate) public candidates;
    
    mapping (address=>bool) public votedornot;
    
    
    event electionUpdated(uint id, string name, uint votecount);
    
    constructor() public{
        addCandidate('Donald');
        addCandidate('Obama');
    }
    
    function addCandidate(string memory name) private{
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, name, 0 );
        
    }
    function Vote(uint _id) public{
        require (!votedornot[msg.sender], "u've voted");
        require(candidates[_id].id != 0, 'not exist');
        candidates[_id].votecount+=1;
        votedornot[msg.sender] = true;
        emit electionUpdated(_id, candidates[_id].name, candidates[_id].votecount);
    }
    
}

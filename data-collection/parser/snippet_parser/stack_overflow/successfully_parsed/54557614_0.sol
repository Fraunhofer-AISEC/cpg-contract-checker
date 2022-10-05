pragma solidity ^0.5.0;

contract Election {
    
    struct Candidatepost {
        uint id;
        string name;
        uint voteCount;
    }

    
    struct Candidateparty {
        uint id;
        string name;
        uint voteCount;
    }

    
    mapping(address => bool) public voters;
    
    
    mapping(uint => Candidatepost) public cand_post;

    mapping(uint => Candidateparty) public cand_party;

    
    uint public partyCount;
    uint public postCount;
    uint[] public candidatesCount = [postCount,partyCount];

    constructor () public {
        addpostCandidate("Candidate 1");
        addpostCandidate("Candidate 2");
        addpartyCandidate("Candidate 1");
        addpartyCandidate("Candidate 2");
        candidatesCount = [postCount,partyCount];
    }

    function addpostCandidate (string memory _name) private {
        postCount ++;
        cand_post[postCount] = Candidatepost(postCount, _name, 0);
    }


    function addpartyCandidate (string memory _name) private {
        partyCount ++;
        cand_party[partyCount] = Candidateparty(partyCount, _name, 0);
    }
    
    event votedEvent (
        uint indexed _candidateId1,
        uint indexed _candidateId2
    );


    function vote (uint _candidateId1, uint _candidateId2) public {
        
        require(!voters[msg.sender]);

        
        require(_candidateId1 > 0 && _candidateId1 <= postCount && _candidateId2 > 0 && _candidateId2 <= partyCount);

        
        voters[msg.sender] = true;

        
        cand_post[_candidateId1].voteCount ++;
        cand_party[_candidateId2].voteCount ++;   
        
        emit votedEvent(_candidateId1, _candidateId2);
    }
}

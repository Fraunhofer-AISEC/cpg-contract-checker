pragma solidity >=0.4.22 <0.7.0;
pragma experimental ABIEncoderV2;

contract Election {
    
    struct Candidate {
        uint256 id;
        string name;
        uint256 voteCount;
    }

    
    mapping(address => bool) public voters;
    
    
    mapping(uint256 => Candidate) public candidates;
    
    uint256 public candidatesCount;

    
    event votedEvent(uint256 indexed _candidateId);

    constructor() public {
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
    }

    
    event voteCandidatEvent(string[] _arr);

    function getListCandidate() public returns (string[] memory) {
        string[] memory arr = new string[](candidatesCount);

        for (uint256 i = 0; i < candidatesCount; i++) {
            Candidate memory _candidate = candidates[i];
            arr[i] = _candidate.name;
        }

        emit voteCandidatEvent(arr);
        return arr;
    }

    function addCandidate(string memory _name) public {
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

    function vote(uint256 _candidateId) public {
        
        require(!voters[msg.sender]);

        
        require(_candidateId > 0 && _candidateId <= candidatesCount);

        
        voters[msg.sender] = true;

        
        candidates[_candidateId].voteCount++;

        
        emit votedEvent(_candidateId);
    }
}

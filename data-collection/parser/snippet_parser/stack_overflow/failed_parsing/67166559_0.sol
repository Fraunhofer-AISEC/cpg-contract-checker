pragma solidity ^0.6.0;
contract Voting {
    
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
        addCandidate("Candidate #1");
        addCandidate("Candidate #2");
        addCandidate("Candidate #3");
    }

    function addCandidate(string memory _name) private {
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
    function getCondidateName(address adr)  pure  public returns( string memory ){
        

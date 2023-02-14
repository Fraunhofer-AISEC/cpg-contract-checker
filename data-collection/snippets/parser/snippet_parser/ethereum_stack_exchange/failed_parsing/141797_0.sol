
pragma solidity >= 0.5.0 < 0.9.0;

contract Election{
    struct Candidate{
        string name;
        uint numVotes;
}
    struct Voter{
        string name;
        bool authorised;
        uint whom;
        bool voted;

    }

    address public owner;
    string public electionName;
    
    mapping (address => Voter) public voters;
    Candidate [] public candidates;
    uint public totalVotes;

    modifier ownerOnly(){
        require(msg.sender == owner);
        _;
    }

    function startElection(string memory _electionName) public{
        owner = msg.sender;
        electionName = _electionName;
    }

    function addCandidate(string memory _candidateName) ownerOnly public{
        candidates.push(Candidate(_candidateName, 0));

    }

    function authorizeVoter(address _voterAdress) ownerOnly public{
        voters[_voterAdress] authorised = true;
    }

    function getNumCandidates() public view return(uint){
        return candidates.length;
    }

    function vote(uint candidateIndex) public{
        require(!voters[msg.sender].voted);
        require(voters[msg.sender].authorised);
        voters[msg.sender].whom = candidateIndex;
    }
 
}
pragma solidity >= 0.5.0 < 0.9.0;

contract Election{
    struct Candidate{
        string name;
        uint numVotes;
}
    struct Voter{
        string name;
        bool authorised;
        uint whom;
        bool voted;

    }

    address public owner;
    string public electionName;
    
    mapping (address => Voter) public voters;
    Candidate [] public candidates;
    uint public totalVotes;

    modifier ownerOnly(){
        require(msg.sender == owner);
        _;
    }

    function startElection(string memory _electionName) public{
        owner = msg.sender;
        electionName = _electionName;
    }

    function addCandidate(string memory _candidateName) ownerOnly public{
        candidates.push(Candidate(_candidateName, 0));

    }

    function authorizeVoter(address _voterAdress) ownerOnly public{
        voters[_voterAdress] authorised = true;
    }

    function getNumCandidates() public view return(uint){
        return candidates.length;
    }

    function vote(uint candidateIndex) public{
        require(!voters[msg.sender].voted);
        require(voters[msg.sender].authorised);
        voters[msg.sender].whom = candidateIndex;
    }
 
}
pragma solidity >= 0.5.0 < 0.9.0;

contract Election{
    struct Candidate{
        string name;
        uint numVotes;
}
    struct Voter{
        string name;
        bool authorised;
        uint whom;
        bool voted;

    }

    address public owner;
    string public electionName;
    
    mapping (address => Voter) public voters;
    Candidate [] public candidates;
    uint public totalVotes;

    modifier ownerOnly(){
        require(msg.sender == owner);
        _;
    }

    function startElection(string memory _electionName) public{
        owner = msg.sender;
        electionName = _electionName;
    }

    function addCandidate(string memory _candidateName) ownerOnly public{
        candidates.push(Candidate(_candidateName, 0));

    }

    function authorizeVoter(address _voterAdress) ownerOnly public{
        voters[_voterAdress] authorised = true;
    }

    function getNumCandidates() public view return(uint){
        return candidates.length;
    }

    function vote(uint candidateIndex) public{
        require(!voters[msg.sender].voted);
        require(voters[msg.sender].authorised);
        voters[msg.sender].whom = candidateIndex;
    }
 
}

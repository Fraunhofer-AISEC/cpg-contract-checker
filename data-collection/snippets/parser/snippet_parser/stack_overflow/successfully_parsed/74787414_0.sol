
pragma solidity >= 0.8.0<0.9.0;

contract ElectionFactory{
    address[]public deployedElections;
    uint public electionscount;
    address public owner;


    modifier ownerOnly{
        require(msg.sender == owner);
        _;
    }

    function createElection(string memory _elecname,uint128 _enddate)public ownerOnly{
       
       Election newElection = new Election();
        deployedElections.push(address(newElection));
        newElection.startElection(_elecname,_enddate);
        electionscount++;
    }

    function getDeployedElection(uint index)public view returns(address){ 
        return deployedElections[index];
    }

    function getElectionCounts()public view returns(uint){ 
        return electionscount;
    }

    
    
    
}


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

    
    uint128 enddate;
    
    
    


    address public owner;  
    string public electionName;  
    bool public electionstatus = true;
    bool public electionStarted = false;  

    mapping(address => Voter) public voters; 
    Candidate[] public candidates; 
    uint public totalVotes; 


    modifier ownerOnly(){ 
        require(msg.sender == owner); 
        _;
    }
    modifier ifnoElection(){ 
        require(electionstatus==true);
        require(electionStarted==false); 
        _;
    }
    
    
    function startElection(string memory _electionName,uint128 _enddate)ifnoElection public{ 
        require(_enddate>block.timestamp);
        owner = msg.sender; 
        electionName = _electionName; 
        electionStarted = true;

    }

    
    function addCandidate(string memory _candidateName)ownerOnly public{ 
        candidates.push(Candidate(_candidateName, 0));
    }

    
    function authorizeVoter(address _voterAddress) ownerOnly public{ 
        voters[_voterAddress].authorised= true; 
    }

    
    function getNumCandidates() public view returns(uint){ 
        return candidates.length; 
    }

    
    function vote(uint candidateIndex)ifnoElection public{ 
        require(!voters[msg.sender].voted); 
        require(voters[msg.sender].authorised); 
        voters[msg.sender].whom = candidateIndex; 
        voters[msg.sender].voted = true; 

        candidates[candidateIndex].numVotes++; 
        totalVotes++;
    }

    
    function getTotalVotes()public view returns(uint) {
        return totalVotes;
    }

    
    function candidateInfo(uint index) public view returns(Candidate memory){ 
        return candidates[index];
    }

    
    
    
    
    

    
    
    
    
    
    
    
    
    
    
    

    
    
    
    
}

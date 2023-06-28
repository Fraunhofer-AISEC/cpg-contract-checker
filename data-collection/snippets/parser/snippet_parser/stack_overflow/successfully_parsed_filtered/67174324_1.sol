contract Election {
    
    
    struct Candidate{
        uint id;
        string name;
        uint voteCount;
    }

    
    
    mapping(uint => Candidate) public listOfCandidates;

    
    uint public candidatesCount;


    
    constructor() public {
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
    }
    
    function addCandidate(string memory _name) private{
        candidatesCount++;
        listOfCandidates[candidatesCount] = Candidate(candidatesCount,_name,0);
    }   
}

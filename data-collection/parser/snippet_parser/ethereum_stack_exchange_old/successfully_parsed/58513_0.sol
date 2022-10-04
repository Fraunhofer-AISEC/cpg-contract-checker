contract example { 

    struct StructPrimary {
        uint start;
        bool isActive;
        uint index;
        address owner;
        uint[] indexcounter;
    }

    uint globalCounter;
    uint[] public userArray;

    
    mapping(uint => StructPrimary) public structByIndex;
    mapping(address => StructPrimary) public structByAddress;


    function addCandidate (address _candidate) public returns (uint) {
        
        StructPrimary storage accounts = structByIndex[userArray.length];
        accounts.start = 0;
        accounts.owner = _candidate;
        accounts.isActive = true;
        accounts.index = userArray.length;
        accounts.indexcounter.push(userArray.length);

        
        structByIndex[accounts.index].owner = _candidate;

        
        structByAddress[_candidate].indexcounter.push(userArray.length);

        globalCounter++ ;

        
        return userArray.push(accounts.index);
    }
}

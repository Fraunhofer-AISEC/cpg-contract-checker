struct Petition {
    uint id;
    string name;
    string description;
    uint voteFor;
    uint voteAgainst;
    address[] addressOfVotedForUsers;
    address[] addressOfVotedAgainstUsers;
    mapping(address=>bool) usersVotedFor;
    mapping(address=>bool) usersVotedAgainst;
}

function addPetition(string memory _name, string memory _desc) public {
    petitions[petitionCount] = Petition(petitionCount,_name,_desc,0,0); 
    petitionCount++; 
}

s/VoteCast.sol:42:34: TypeError: Wrong argument count for struct constructor: 5 arguments given but expected 7. Members that have to be skipped in memory: usersVotedAgainst usersVotedFor
  petitions[petitionCount] = Petition(petitionCount,_name,_desc,0,0);

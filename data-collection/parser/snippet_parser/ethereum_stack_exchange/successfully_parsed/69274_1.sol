
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

mapping(uint => Petition) public petitions;
uint petitionCount=0;

function addPetition(string memory _name, string memory _desc) public {
    address[] memory whatever;  
    petitions[petitionCount] = Petition(petitionCount, _name, _desc, 0, 0, whatever, whatever); 
    petitionCount++; 
}

function addPetition(string memory _name, string memory _desc, address[] memory x, address[] memory y) public {
    petitions[petitionCount] = Petition(petitionCount, _name, _desc, 0, 0, x, y); 
    petitionCount++; 
}

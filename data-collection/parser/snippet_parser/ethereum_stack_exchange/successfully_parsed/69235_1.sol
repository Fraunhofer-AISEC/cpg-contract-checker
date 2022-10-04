contract Election
{
    struct      Candidate
    {
        string  name;
        uint    voteCount;
    }

    struct      Voter
    {
        bool    authorized;
        bool    voted;
        uint    voteTarget;
    }
    address payable  public             owner;
    string public                       electionName;
    mapping(address => Voter) public    voters;
    Candidate[] public                  candidates;
    uint public                         totalVotes;
    Passport                            pass;

    modifier ownerOnly()
    {
        require(msg.sender == owner);
        _;
    }

    constructor(string memory _electionName) public
    {
        owner = msg.sender;
        electionName = _electionName;
    }

    function addCandidate(string memory _candidateName) ownerOnly public
    {
        candidates.push(Candidate(_candidateName, 0));
    }

    function getNumCandidate() public view returns(uint)
    {
        return candidates.length;
    }

    function authorize(address _person) public
    {
        voters[_person].authorized = true;
    }

    function vote(uint _voteIndex) public
    {
        
        pass = Pasport(msg.sender);

        
        require(pass.isRegistered(msg.sender));

        require(!voters[msg.sender].voted);
        require(voters[msg.sender].authorized);

        voters[msg.sender].voteTarget = _voteIndex;
        voters[msg.sender].voted = true;

        candidates[_voteIndex].voteCount += 1;
        totalVotes += 1;
    }

    function end() ownerOnly public
    {
        selfdestruct(owner);
    }
}

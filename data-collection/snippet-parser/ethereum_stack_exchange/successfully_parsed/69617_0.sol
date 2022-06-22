pragma solidity >=0.4.25 <0.6.0;

contract BountyHunters {

    enum SubmissionStates {Accepted, Pending, Rejected}
    enum BountyStates { Open, Closed }


    address owner;
    uint public bountyId;
    uint public submissionId;

    mapping(address => uint[]) public myBounties;
    mapping(uint => Bounty) public newBounties;
    mapping(uint => uint[]) public mySubmissions;
    mapping(uint => Submissions) public subs;

    struct Bounty {
        uint bountyId;
        uint bountyAmount;
        address poster;
        string description;
        BountyStates bountyState;
    }

    struct Submissions {
        address bountyHunter;
        string description;
        SubmissionStates subState;
    }

    constructor() public payable {
        msg.sender == owner;
    }

    modifier onlyOP {
        require(newBounties[bountyId].poster == msg.sender, "You must be the owner of the post");
        _;
    }
    modifier onlyNotOP {
        require(newBounties[bountyId].poster != msg.sender, "You are not allowed to submit to your own bounties.");
        _;
    }
    modifier isOpen {
        require(newBounties[bountyId].bountyState == BountyStates.Open);
        _;
    }

    function postNewBounty( string memory _description, uint _bountyAmount) 
    public 
    payable 
    returns (bool) {

        require(_bountyAmount > 0);
        require(msg.sender.balance >= _bountyAmount);
        bountyId++;
        myBounties[msg.sender].push(bountyId) - 1;
        Bounty memory newBounty = Bounty(bountyId, _bountyAmount, msg.sender, _description, BountyStates.Open);
        newBounties[bountyId] = newBounty;

        return true;
    }

    function proposeSubmission(uint _bountyId, string memory _description) public onlyNotOP isOpen returns (bool success) {
        require(bountyId >= 0 && _bountyId <= bountyId);

        submissionId++;
        Submissions memory newSubb = Submissions(msg.sender, _description, SubmissionStates.Pending);
        mySubmissions[_bountyId].push(submissionId) - 1;
        subs[submissionId] = newSubb;
        return success;
    }

    function getBountySubmissions(uint _bountyId) public view onlyOP returns (
        address bountyHunter,
        string memory description,
        SubmissionStates subState) {

    }
}
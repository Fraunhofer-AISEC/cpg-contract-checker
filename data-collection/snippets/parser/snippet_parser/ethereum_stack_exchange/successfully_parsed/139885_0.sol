contract Ballot {

    struct Voter {
        bool hasVoted;
        uint vote;
    }
 
    struct Poll {
        address creator;
        bytes32 name;
        uint256 pollId;

        bytes32[] options;
        uint256 optionsLength;
        uint256[] voteCount;

        
        
    }
    
    
    mapping (address => Voter) public voters;
    Poll[] private polls;

    function getPolls() public view returns (Poll[] memory) {
        return polls;
    }

    function vote(uint pollId, uint pollOption) external {
        Voter storage sender = voters[msg.sender];
        require(!sender.hasVoted,"Already Voted");

        polls[pollId].voteCount[pollOption] +=1; 
        sender.hasVoted = true;
    }

    function publishPoll(bytes32 _name, bytes32[] memory _options) public {

        require(_options.length < 9,"Poll options must be smaller than nine.");
        require(_options.length > 1, "Poll options must be two or larger");

        uint arrayIndex = polls.length + 1; 
        Poll memory newPoll;

        newPoll.creator = msg.sender;
        newPoll.name = _name;
        newPoll.options = _options;
        newPoll.pollId = arrayIndex;
        newPoll.options = _options;
        newPoll.optionsLength = _options.length;
        newPoll.voteCount = new uint256[] (_options.length);

        polls.push(newPoll);
        
    }
}

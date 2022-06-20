pragma solidity^0.4.0;

contract Contest {
    address public manager;
    uint public submissionCost;
    uint8 public votesPerSubmission;

    constructor (uint _submissionCost, uint8 _votesPerSubmission) public {
        manager = msg.sender;
        submissionCost = _submissionCost;
        votesPerSubmission = _votesPerSubmission;
    }

    modifier restricted() {
        require(msg.sender == manager, "Not authorized.");
        _;
    }

    function adjustSubmissionCost(uint32 newCost) public restricted {
        submissionCost = newCost;
    }

    function adjustVotesPerSubmission(uint8 newVotes) public restricted {
        votesPerSubmission = newVotes;
    }
}

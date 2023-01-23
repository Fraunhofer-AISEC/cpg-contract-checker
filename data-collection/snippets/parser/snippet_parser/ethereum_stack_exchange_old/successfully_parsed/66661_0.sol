pragma solidity^0.4.0;

contract Contest {
    address public manager;
    uint public submissionCost;
    uint public votesPerSubmission;

    constructor (uint _submissionCost, uint _votesPerSubmission) public {
        manager = msg.sender;
        submissionCost = _submissionCost;
        votesPerSubmission = _votesPerSubmission;
    }

    modifier restricted() {
        require(msg.sender == manager, "Not authorized.");
        _;
    }

    function adjustSubmissionCost(uint newCost) public restricted {
        submissionCost = newCost;
    }

    function adjustVotesPerSubmission(uint newVotes) public {
        votesPerSubmission = newVotes;
    }

    function getManager() public view returns (address) {
        return manager;
    }
}

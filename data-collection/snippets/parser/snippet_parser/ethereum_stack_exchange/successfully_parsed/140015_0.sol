
pragma solidity >= 0.7.0 < 0.9.0;
pragma abicoder v2;

contract Voting {

    string contractName = "Voting";

    address creator;
    bytes32 name;

    bytes32[] options;
    uint256[] voteCount;
    uint256 pollId;

    mapping (address=>bool) hasVoted;

    constructor (
                address sender,
                bytes32 _name,
                bytes32[] memory _options,
                uint256[] memory _voteCount,
                uint256 _pollId          
    ){
        creator = sender;
        name = _name;
        options = _options;
        voteCount = _voteCount;
        pollId = _pollId;
    }

    function vote(uint optionID) external{
        require(!hasVoted[msg.sender],"You already have voted on this poll!");
        voteCount[optionID]++;
        hasVoted[msg.sender] = true;
    }

    function getVoteCount() public view returns(uint256[] memory) {
        return voteCount;
    }
}

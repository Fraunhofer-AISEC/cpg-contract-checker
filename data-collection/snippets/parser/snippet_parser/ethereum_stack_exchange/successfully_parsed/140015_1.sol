
pragma solidity >= 0.7.0 < 0.9.0;
pragma abicoder v2;
import "./Voting.sol";

contract VotingFactory {
    string contractName = "VotingFactory";

    struct PollInfo {
        address pollCreator;
        bytes32 pollName;
        bytes32[] pollOptions;
        uint256[] pollVoteCount;
        uint256 pollInfoID;
    }

    address sender = msg.sender;
    Voting[] public polls;
    PollInfo[] public pollInfoList;


    function createVotingContract(bytes32 _name, bytes32[] memory _options) public {
        
        uint256 pollIndex = polls.length;
        uint256[] memory _voteCount = new uint256[](_options.length);

        Voting voting = new Voting(sender,_name,_options, _voteCount, pollIndex);
        polls.push(voting);

        pollInfoList.push(PollInfo({pollCreator:sender,
                                    pollName:_name,
                                    pollOptions:_options,
                                    pollVoteCount:_voteCount,
                                    pollInfoID: pollIndex
        }));

    }
    function vote(uint256 _pollId, uint256 _optionId) public {
        polls[_pollId].vote(_optionId);
        pollInfoList[_pollId].pollVoteCount = polls[_pollId].getVoteCount();
    }

    function getPollInfoList() public view returns(PollInfo[] memory) {
        return pollInfoList;
    }

}


pragma solidity ^0.8.17;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@chainlink/contracts/src/v0.8/AutomationCompatible.sol";

error Voting__NotAuthorized();
error Voting__AlreadyVoted();
error Voting__AlreadyRegistered();
error Voting__UnknownCandidate();
error Voting__WrongState();
error Voting__UpkeepNotNeeded();
error Voting__NoOneVoted();

contract Voting is Ownable, AutomationCompatibleInterface {
    enum VotingState {
        REG,
        VOTING,
        CALC
    }

    struct Voter {
        bool authorized;
        bool voted;
    }

    struct Candidate {
        uint256 votes;
    }

    mapping(address => Voter) public voters;
    Candidate[] public candidates;
    address[] private votedList;
    VotingState private state;
    
    uint256 private registerTime;
    uint256 private votingTime;
    uint256 private lastTimeStamp;

    event VoterVoted(address indexed voter, uint256 numCandidate);
    event VoterRegistered(address indexed voter);

    constructor(uint256 _candidatesCount, uint256 _registerTime, uint256 _votingTime) {
        
        registerTime = _registerTime;
        votingTime = _votingTime;

        for (uint256 i = 0; i < _candidatesCount; i++) {
            candidates.push(Candidate({votes: 0}));
        }

        state = VotingState.REG;
        lastTimeStamp = block.timestamp;
    }

    modifier onlyState(VotingState _state) {
        if (state != _state) {
            revert Voting__WrongState();
        }
        _;
    }

    function checkUpkeep(
        bytes memory 
    ) public view override returns (bool upkeepNeeded, bytes memory ) {
        uint256 timeDiff = block.timestamp - lastTimeStamp;
        upkeepNeeded = timeDiff > registerTime || timeDiff > votingTime;
    }

    function performUpkeep(bytes calldata ) public override {
        (bool upkeepNeeded, ) = checkUpkeep("");
        if (!upkeepNeeded) {
            revert Voting__UpkeepNotNeeded();
        }

        if (state == VotingState.REG) {
            state = VotingState.VOTING;
        } else if (state == VotingState.VOTING) {
            state = VotingState.CALC;
        }
        lastTimeStamp = block.timestamp;
    }

    function vote(uint256 _numCandidate) public onlyState(VotingState.VOTING) {
        if (voters[msg.sender].authorized == false) {
            revert Voting__NotAuthorized();
        }
        if (voters[msg.sender].voted) {
            revert Voting__AlreadyVoted();
        }
        if (_numCandidate - 1 > getCandidatesCount()) {
            revert Voting__UnknownCandidate();
        }

        candidates[_numCandidate].votes++; 
        voters[msg.sender].voted = true; 
        votedList.push(msg.sender); 
        emit VoterVoted(msg.sender, _numCandidate);
    }

    function register(address _voter) public onlyOwner onlyState(VotingState.REG) {
        if (voters[_voter].authorized) {
            revert Voting__AlreadyRegistered();
        }

        voters[_voter].authorized = true; 
        voters[_voter].voted = false;
        emit VoterRegistered(_voter);
    }

    function getWinner() public view onlyState(VotingState.CALC) returns (uint256) {
        if (votedList.length <= 0) {
            revert Voting__NoOneVoted();
        }

        uint256 maxVotes = 0;
        uint256 numCandidate = 0;
        for (uint256 i = 0; i < getCandidatesCount(); i++) {
            if (candidates[i].votes > maxVotes) {
                maxVotes = candidates[i].votes;
                numCandidate = i;
            }
        }
        return numCandidate;
    }

    function getRegisterTime() public view returns (uint256) {
        return registerTime;
    }

    function getVotingTime() public view returns (uint256) {
        return votingTime;
    }

    function getState() public view returns (VotingState) {
        return state;
    }

    function getCandidatesCount() public view returns (uint256) {
        return candidates.length;
    }

    function getVotedCount() public view returns (uint256) {
        return votedList.length;
    }

    function getVoterAuthorized(address _voter) public view returns (bool) {
        return voters[_voter].authorized;
    }

    function getVoterVoted(address _voter) public view returns (bool) {
        return voters[_voter].voted;
    }
}


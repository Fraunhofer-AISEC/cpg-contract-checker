
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/utils/Address.sol";

contract Voting {
 
    address public owner;
    uint public counter;
    uint public minCandidates = 2;
    uint public maxCandidates;
    uint public immutable Comission; 

    struct Candidate {
        uint balance;
        bool isExistOnThisVoting;
    }

    struct _Voting {
        bool started;
        address Winner;
        uint StartDate;
        uint WinnerBalance;
        uint Bank;
        uint Period;
        mapping(address => Candidate) Candidates;
    }

    mapping(uint => _Voting) private Votings;

    modifier onlyOwner() {
        require(msg.sender == owner, "Sorry, but you are not an owner!");
        _;
    }

    constructor(uint _maxCandidates, uint _comission) {
        owner = msg.sender;
        Comission = _comission;
        maxCandidates = _maxCandidates;
    }

    function addVoting(address[] calldata _candidates, uint _period) public onlyOwner {
        require(minCandidates <= _candidates.length && _candidates.length < maxCandidates, 
            "The number of candidates must comply with the voting rules!"
        );
        Votings[counter].Period = _period; 
        for( uint i = 0; i < _candidates.length; i++) {
            addCandidate(counter, _candidates[i]);
            }
        emit votingDraftCreated(counter);
        counter++;
    }

    function editVotingPeriod(uint _id, uint _newPeriod) public onlyOwner {
        require(Votings[_id].started = false, "The voting has already begun!");
        Votings[_id].Period = _newPeriod;
    }

    function addCandidate(uint _id, address _candidate) public onlyOwner {
        require(address(_candidate) != address(0), "This candidate with zero address!");
        require(Address.isContract(_candidate) == false, "A contract can't be a candidate!");
        require(Votings[_id].started, "The voting has already begun!");
        Votings[_id].Candidates[_candidate].isExistOnThisVoting = true;
        emit candidateInfo(_id, _candidate, true);
    }

    function deleteCandidate(address _candidate, uint _id) public onlyOwner {
        require(Votings[_id].started, "The voting has already begun!");
        Votings[_id].Candidates[_candidate].isExistOnThisVoting = false;
        emit candidateInfo(_id, _candidate, false);
    }

    function startVoting(uint _id) public onlyOwner {
        Votings[_id].started = true;
        Votings[_id].StartDate = block.timestamp;
        emit votingStarted(_id, block.timestamp);
    }

    function takePartInVoting(uint _id, address _candidate) public payable {
        require(Address.isContract(msg.sender) == false, "A contract can't vote!");
        require(Votings[_id].started, "The voting doesn't start!");
        require(Votings[_id].StartDate + Votings[_id].Period > block.timestamp, "The voting has ended!");
        require(checkCandidate(_id, _candidate), "This candidates does not exist in this voting!");

        Votings[_id].Candidates[_candidate].balance += msg.value;
        Votings[_id].Bank += msg.value;

        if (Votings[_id].Candidates[_candidate].balance > Votings[_id].WinnerBalance) {
            Votings[_id].WinnerBalance = Votings[_id].Candidates[_candidate].balance;
            Votings[_id].Winner = _candidate;
        }
    }

    function withDrawPrize(uint _id) public {
        require(Votings[_id].started, "The voting doesn't start!");
        require(Votings[_id].StartDate + Votings[_id].Period < block.timestamp, "The voting is not ended yet!");
        require(msg.sender == Votings[_id].Winner, "You are not a winner!");
        require(Votings[_id].Bank > 0, "You have already receive your prize!");

        uint amount = Votings[_id].Bank;
        uint ownerComission = (Comission * amount) / 100;
        uint clearAmount = amount - ownerComission;
        Votings[_id].Bank = 0;
        payable(owner).transfer(ownerComission);
        payable(msg.sender).transfer(clearAmount);
    }

    function checkCandidate(uint _id, address _candidate) public view returns(bool) {
        return(Votings[_id].Candidates[_candidate].isExistOnThisVoting);
    }

    function getVotingInfo(uint256 _id) public view returns (
        bool,
        uint256,
        uint256,
        uint256,
        uint256,
        address
        ) {
            return(
                Votings[_id].started,
                Votings[_id].StartDate,
                Votings[_id].WinnerBalance,
                Votings[_id].Bank,
                Votings[_id].Period,
                Votings[_id].Winner);
        }

    function setMaxCandidates(uint _maxCandidates) public onlyOwner {
        require(minCandidates <= _maxCandidates, "Minimum number of candidates is 2");
        maxCandidates = _maxCandidates;
    }

    event candidateInfo(uint indexed id, address indexed candidate, bool existOnThisVoting);

    event votingDraftCreated(uint indexed id);

    event votingStarted(uint indexed id, uint startDate);
}

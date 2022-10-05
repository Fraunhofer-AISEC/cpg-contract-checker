pragma solidity ^0.5.3;

contract Voting {

    address chairPersonAddress;

    struct Candidate {
        address candidateAddress;
        uint votes;
    }

    struct Vote{
        uint votedCandidateIndex;
        bool alreadyVoted;
    }

    modifier onlyChairPerson(){
        require(msg.sender == chairPersonAddress);
        _;
    }

    mapping(address => Vote) public voterAddressToTheirVote;

    Candidate[] public candidates;

    constructor(address _chairPersonAddress) public {
        chairPersonAddress = _chairPersonAddress;
    }

    function nominateCandidate(address _candidateAddress) onlyChairPerson public {
        Candidate memory newCandidate = Candidate({
            candidateAddress: _candidateAddress,
            votes: 0
        });

        candidates.push(newCandidate);
    }

    function vote(uint _candidateIndex) public {
        Vote memory existingVote = voterAddressToTheirVote[msg.sender];
        
        if(_candidateIndex == 0){
            require(existingVote.alreadyVoted == false, "You already voted for the first candidate");
            _addNewVote(_candidateIndex);
        }
        else{
            require(existingVote.votedCandidateIndex != _candidateIndex && existingVote.alreadyVoted == false, "You already voted for this candidate");
            _addNewVote(_candidateIndex);
        }
    }

    function _addNewVote(uint _candidateIndex) private {
        Vote memory newVote = Vote({
            votedCandidateIndex: _candidateIndex,
            alreadyVoted: true
        });

        voterAddressToTheirVote[msg.sender] = newVote;

        candidates[_candidateIndex].votes++;
    }

    function numberOfCandidates() public view returns(uint){
        return candidates.length;
    }
}

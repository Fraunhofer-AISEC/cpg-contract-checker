
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract DecentralizedEVoting is Ownable {

    struct Candidate {
        uint256 Id;
        bytes32 Name;
        uint256 Votes;
    }

    bool hasEnded;
    mapping(address => bool) public hasVoted;
    Candidate[] public candidates;

    constructor(bytes32[] memory _candidateNames) payable {
        for(uint256 i = 0; i < _candidateNames.length; i++) {
            candidates[i] = Candidate(i, _candidateNames[i], 0);
        }
    }

    function viewCandidates() public view returns(Candidate[] memory){
        return candidates;
    }

    function vote(uint256 _ID) public {
        require(!hasEnded);
        require(!hasVoted[msg.sender], "This address has been voted before." );
        hasVoted[msg.sender] == true;
        candidates[_ID].Votes++;
    }

    function endElection() public onlyOwner {
        hasEnded = true;
    }

}

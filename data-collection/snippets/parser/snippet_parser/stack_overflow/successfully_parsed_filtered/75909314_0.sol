
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/access/Ownable.sol";

contract VotingContract is Ownable {
    struct Proposal {
        string name;
        uint256 voteCount;
    }

    Proposal[] public proposals;
    uint256 public proposalCount;

    constructor(string[] memory proposalNames) {
        proposalCount = proposalNames.length;
        for (uint256 i = 0; i < proposalNames.length; i++) {
            proposals.push(Proposal({name: proposalNames[i], voteCount: 0}));
        }
    }

    function getProposalCount() public view returns (uint256) {
        return proposalCount;
    }

    function getProposal(
        uint256 proposalId
    ) public view returns (string memory, uint256) {
        require(proposalId < proposals.length, "Invalid proposal ID");
        Proposal storage proposal = proposals[proposalId];
        return (proposal.name, proposal.voteCount);
    }

    function vote(uint256 proposalId) public {
        require(proposalId < proposals.length, "Invalid proposal ID");
        Proposal storage proposal = proposals[proposalId];
        proposal.voteCount++;
    }
}

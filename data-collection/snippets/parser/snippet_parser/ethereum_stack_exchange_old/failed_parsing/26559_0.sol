pragma solidity ^0.4.4;
import 'common/Object.sol';
import 'token/Recipient.sol';

contract Congress is Object, Recipient {
...
    
    Proposal[] public proposals;

    
    function numProposals() constant returns (uint256)
    { return proposals.length; }

    struct Proposal {
        address recipient;
        uint256 amount;
        string  description;
        uint256 votingDeadline;
        bool    executed;
        bool    proposalPassed;
        uint256 numberOfVotes;
        int256  currentResult;
        bytes32 proposalHash;
        Vote[]  votes;
        mapping(address => bool) voted;
    }

  ...
}

pragma solidity 0.5.10;

contract Consensus {

    struct Vote {
        address voter;
        bool yes;
        string comment;
    }

    struct ConsensusResult {
        Vote[] collectiveVotes;
    }

    mapping (bytes32 => ConsensusResult) votes;

    function addVote(bytes32 _voteID, bool _vote, string memory _comment) public {
        uint _length = votes[_voteID].collectiveVotes.length;
        votes[_voteID].collectiveVotes.length++;

        Vote storage v = votes[_voteID].collectiveVotes[_length];
        v.voter = msg.sender;
        v.yes = _vote;
        v.comment = _comment;
    }
}

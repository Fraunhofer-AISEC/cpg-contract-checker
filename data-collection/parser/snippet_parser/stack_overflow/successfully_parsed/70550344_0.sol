    function vote(uint[] memory proposals) external
    {
        Voter storage sender = voters[msg.sender];
        require(sender.weight != 0, "Has no right to vote.");
        require(!sender.voted, "Already voted.");
        mapping(uint => bool) duplicateVotes;
        require(!duplicateVotes, "Cannot vote for a proposal more than once.");
        sender.voted = true;
        sender.vote = proposals;

        proposals[proposals].voteCount += sender.weight;
    }

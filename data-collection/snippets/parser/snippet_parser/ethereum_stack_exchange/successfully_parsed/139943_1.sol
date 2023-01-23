contract Ballot is IHelper, Guard, Logging {
    Confirmed[6] private _confirmedVotes;
    Abstention private _abstentionVotes;
    uint[6] private _candidates;
    uint private _totalConfirmedVotes;
    mapping(address => bool) private _electorHasAlreadyVoted;

    constructor() {}

    function getResult() public view returns (ElectionResult memory) {
        return
            ElectionResult({
                candidates: _candidates,
                totalConfirmedVotes: _totalConfirmedVotes,
                confirmedVotes: _confirmedVotes,
                abstentionVotes: _abstentionVotes
            });
    }

    function confirmVote(uint candidateID)
        public
        onlyCandidateRegistered(candidateID, _candidates.length)
        onlyElectorWhoDidNotVote(_electorHasAlreadyVoted[msg.sender])
    {
        _totalConfirmedVotes++;

        _confirmedVotes[candidateID].elector.push(msg.sender);
        _confirmedVotes[candidateID].candidate = candidateID;
        _confirmedVotes[candidateID].vote.total++;

        _electorHasAlreadyVoted[msg.sender] = true;

        emit LogElectorVote("Vote confirmed and computed!", getResult());
    }

    function abstentionVote() public onlyElectorWhoDidNotVote(_electorHasAlreadyVoted[msg.sender]) {
        _abstentionVotes.elector.push(msg.sender);
        _abstentionVotes.vote.total++;

        _electorHasAlreadyVoted[msg.sender] = true;

        emit LogElectorVote("Vote confirmed and computed!", getResult());
    }
}

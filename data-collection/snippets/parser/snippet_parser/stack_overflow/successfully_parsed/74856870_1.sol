
contract Ballot is IHelper, Guard, Logging {
    Confirmed[6] private _confirmedVotes;
    Abstention private _abstentionVotes;
    uint[6] private _candidates;
    uint private _totalConfirmedVotes;
    mapping(address => bool) private _electorHasAlreadyVoted;

    constructor() {
        _registerCandidates();

        emit LogStartElection("Beginning of the election period, ballot box released!", getResult());
    }

    
    function _registerCandidates() private {
        for (uint i = 0; i < _candidates.length; i++) {
            _candidates[i] = i;
            _confirmedVotes[i].candidate = i;
        }
    }

    
    function getElectorHasAlreadyVoted() public view returns (bool) {
        return _electorHasAlreadyVoted[msg.sender];
    }

    
    function getResult() public view returns (ElectionResult memory) {
        return
            ElectionResult({
                candidates: _candidates,
                totalConfirmedVotes: _totalConfirmedVotes,
                confirmedVotes: _confirmedVotes,
                abstentionVotes: _abstentionVotes
            });
    }

    
    function confirmVote(
        uint candidateID
    ) public onlyCandidateRegistered(candidateID, _candidates.length) onlyElectorWhoDidNotVote(_electorHasAlreadyVoted[msg.sender]) {
        _confirmedVotes[candidateID].totalVotes++;
        _confirmedVotes[candidateID].elector.push(msg.sender);
        _confirmedVotes[candidateID].candidate = candidateID;

        _electorHasAlreadyVoted[msg.sender] = true;

        _totalConfirmedVotes++;

        emit LogElectorVote("Vote Confirmed and Computed!", getResult());
    }

    
    function abstainVote() public onlyElectorWhoDidNotVote(_electorHasAlreadyVoted[msg.sender]) {
        _abstentionVotes.totalVotes++;
        _abstentionVotes.elector.push(msg.sender);

        _electorHasAlreadyVoted[msg.sender] = true;

        emit LogElectorVote("Vote Abstained and Computed!", getResult());
    }
}

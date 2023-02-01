interface IHelper {
    struct Vote {
        uint total;
    }

    struct Confirmed {
        uint candidate;
        address[] elector;
        Vote vote;
    }

    struct Abstention {
        address[] elector;
        Vote vote;
    }

    struct ElectionResult {
        uint[6] candidates;
        uint totalConfirmedVotes;
        Confirmed[6] confirmedVotes;
        Abstention abstentionVotes;
    }
}

    emit LogStartElection("Beginning of the election period, ballot box released!", getResult());
   
    function getResult() public view returns (ElectionResult memory) {
        return
            ElectionResult({
                candidates: _candidates,
                totalConfirmedVotes: _totalConfirmedVotes,
                confirmedVotes: _confirmedVotes,
                abstentionVotes: _abstentionVotes
            });
    }

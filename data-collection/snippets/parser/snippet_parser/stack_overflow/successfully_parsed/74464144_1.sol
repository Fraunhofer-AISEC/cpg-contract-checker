struct Vote {
    uint total;
    ufixed totalPercentage;
}

struct VoteCouting {
    AbstractCandidate information;
    AbstractElector[] electors;
    Vote votes;
}

contract ElectronicVotingMachine {
    Vote abstentionVotes;
    AbstractCandidate CandidateOne;
    AbstractCandidate CandidateTwo;
    AbstractCandidate CandidateThree;
    AbstractCandidate CandidateFour;
    AbstractCandidate CandidateFive;
    AbstractCandidate CandidateSix;

    constructor()
        CandidateOne(1, "https://raw.githubusercontent.com/thiagosaud/dApp-superior-electoral-court/main/temp/imgs/candidate-1.png")
        CandidateTwo(2, "https://raw.githubusercontent.com/thiagosaud/dApp-superior-electoral-court/main/temp/imgs/candidate-2.png")
        CandidateThree(3, "https://raw.githubusercontent.com/thiagosaud/dApp-superior-electoral-court/main/temp/imgs/candidate-3.png")
        CandidateFour(4, "https://raw.githubusercontent.com/thiagosaud/dApp-superior-electoral-court/main/temp/imgs/candidate-4.png")
        CandidateFive(5, "https://raw.githubusercontent.com/thiagosaud/dApp-superior-electoral-court/main/temp/imgs/candidate-5.png")
        CandidateSix(6, "https://raw.githubusercontent.com/thiagosaud/dApp-superior-electoral-court/main/temp/imgs/candidate-6.png")
    {
        abstentionVotes.total = 0;
        abstentionVotes.totalPercentage = 0.0;
    }
}





pragma solidity >=0.7.0 <0.9.0;

enum VotingOption {
    Confirmed,
    Abstention
}

struct Votes {
    uint256 total;
    uint256 totalPercentage;
}

struct Elector {
    address wallet;
    VotingOption votingOption;
}

struct Candidate {
    uint256 number;
    string avatar;
    Votes confirmedVotes;
    mapping(address => Elector) electorsWhoVoted;
}

contract ElectronicVotingMachine {
    Votes abstentionVotes = Votes({ total: 0, totalPercentage: 0 });
    Elector[] electors;
    Candidate[6] candidates;
    string[6] candidateAvatar = [
        "https://raw.githubusercontent.com/thiagosaud/dApp-superior-electoral-court/main/temp/imgs/candidate-1.png",
        "https://raw.githubusercontent.com/thiagosaud/dApp-superior-electoral-court/main/temp/imgs/candidate-2.png",
        "https://raw.githubusercontent.com/thiagosaud/dApp-superior-electoral-court/main/temp/imgs/candidate-3.png",
        "https://raw.githubusercontent.com/thiagosaud/dApp-superior-electoral-court/main/temp/imgs/candidate-4.png",
        "https://raw.githubusercontent.com/thiagosaud/dApp-superior-electoral-court/main/temp/imgs/candidate-5.png",
        "https://raw.githubusercontent.com/thiagosaud/dApp-superior-electoral-court/main/temp/imgs/candidate-6.png"
    ];

    function _createCandidates() private {
        for(uint256 index = 0; index <= candidates.length; index++) {
            candidates.push(Candidate({
                number: index + 1,
                avatar: candidateAvatar[index],
                confirmedVotes: Votes({ total: 0, totalPercentage: 0 })
            }));
        }
    }

    constructor() {
        _createCandidates();
    }
}


pragma solidity >=0.4.22 <0.8.20;
pragma experimental ABIEncoderV2;
contract Election {
    struct Elections {
        uint id;
        string title;
        string description;
        uint creationDate;
        uint expirationDate;
        Candidate[] candidates;
    }
    uint public electionsCount;
    Elections[] elections;

    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }
    uint public candidatesCount;

    function addElections (string memory _title, string memory _description, uint _amountOfHours, string[] memory _names) private {
        electionsCount ++;
        elections[electionsCount].id = electionsCount;
        elections[electionsCount].title = _title;
        elections[electionsCount].description = _description;
        elections[electionsCount].creationDate = block.timestamp;
        elections[electionsCount].expirationDate = block.timestamp + _amountOfHours;

        Candidate[] memory candidates;
        for (uint i = 0; i < _names.length; i++) {
            candidatesCount ++;
            string memory name = _names[i];
            candidates[candidatesCount] = Candidate(candidatesCount, name, 0);
            elections[electionsCount].candidates.push(candidates[i]);
        }
    }
    string[] names= ["AAAA", "BBBBB", "CCCCCC"];

    constructor () public {
        addElections("Voted", "vote for your candidate", 8, names);
    }
}

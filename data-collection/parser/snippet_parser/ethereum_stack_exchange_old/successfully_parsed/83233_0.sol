pragma solidity >=0.5.0 <0.6.0;

contract GameChanger {

    uint ChallengeCount = 0;

    struct Challenge {
        string name;
        address host;
        string description;
        uint starttime;
        uint timelimit;
        uint reward;
        uint challengercount;
        address[] challengers;
    }

    Challenge[] public challenges;

    function createChallenge(string memory name, string memory description, 
        uint timelimit, uint reward) public {

        ChallengeCount++;
        address host = msg.sender;
        uint starttime = now;
        uint challengercount = 0;
        challenges.push(Challenge(name, host, description, starttime,                         
        timelimit, reward, challengercount, new address[](0)));
    }

    function acceptChallenge(uint ChallengeCount) public {

        if (now <= ((challenges[ChallengeCount].starttime)  + 24)) {
            challenges[ChallengeCount].challengers.push(msg.sender);
            challenges[ChallengeCount].challengercount++;
            uint id = challenges[ChallengeCount].challengercount;
            registration[id] = msg.sender;
        }
    }
}

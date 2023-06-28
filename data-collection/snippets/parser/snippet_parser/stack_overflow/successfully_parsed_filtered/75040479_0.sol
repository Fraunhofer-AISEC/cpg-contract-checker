pragma solidity ^0.8.0;

contract Poll {
    
    struct PollStruct {
        string name;
        string[] options;
        address[] voters;
        uint[] votes;
    }

    
    mapping(uint => PollStruct) public polls;
    
    uint[] public pollIds;
    
    address public admin;

    
    constructor() public {
        
        admin = msg.sender;
        string[] memory choices = new string[](3);
        choices[0] = "Opcja1";
        choices[1] = "Opcja2";
        choices[2] = "Opcja3";
        createPoll("Ankieta 1", choices);
        createPoll("Ankieta 2", choices);
    }

    
    function createPoll(string memory name, string[] memory options) public {
        require(msg.sender == admin, "Only the admin can create polls");
        pollIds.push(0);
        uint pollId = pollIds.length - 1;
        polls[pollId] = PollStruct(name, options, new address[](0), new uint[](options.length));
        pollIds[pollId] = pollId;
    }

    
    function addVoter(uint pollId, address voter) public {
        require(msg.sender == admin, "Only the admin can add voters to a poll");
        PollStruct storage poll = polls[pollId];
        require(poll.voters.length == poll.votes.length, "Invalid poll data");
        for (uint i = 0; i < poll.voters.length; i++) {
            require(poll.voters[i] != voter, "Voter has already been added");
        }
        poll.voters.push(voter);
        poll.votes.push(0);
    }

    
    function vote(uint pollId, uint option) public {
        PollStruct storage poll = polls[pollId];

        for (uint i = 0; i < poll.voters.length; i++) {
            if (poll.voters[i] == msg.sender) {
                require(poll.voters.length == poll.votes.length, "Invalid poll data");
                require(option < poll.options.length, "Invalid option");
                address voter = msg.sender;
                for (uint j = 0; j < poll.voters.length; j++) {
                     if (poll.voters[j] == voter) {
                            poll.votes[j] = option;
                            return;
                        }
                    }
         }
        }

        
        require(false, "Sender address is not allowed");
    }

    
    function getResults(uint pollId) public view returns (string memory name, uint[] memory votes, string[] memory options) {
        PollStruct storage poll = polls[pollId];
        name = poll.name;
        votes = poll.votes;
        options = poll.options;
    }
}

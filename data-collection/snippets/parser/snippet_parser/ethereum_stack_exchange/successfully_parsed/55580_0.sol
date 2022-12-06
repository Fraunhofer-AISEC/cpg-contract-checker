pragma solidity ^0.4.0;
contract Ballot {

    struct Voter {
        uint weight;
        bool voted;
        uint8 vote;
        address delegate;
    }

    function foo(bool d) public pure returns (uint) {
        Voter memory votes;
        votes.weight = 123;
        votes.voted = true;
        votes.delegate = msg.sender;
        votes.vote = 1;
        if (d) {
            votes.weight += 11; 
        } else {
            votes.vote = 2;
        }
        return votes.weight + votes.vote;
    }
}

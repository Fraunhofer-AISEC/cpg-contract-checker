pragma solidity ^0.4.0;
contract Ballot {

 ....

    event votingCompleted();

    uint startTime;
    modifier validStage(Stage reqStage) {
        require(stage == reqStage);
        _;
    }

    constructor(uint8 _numProposals) public {
        chairperson = msg.sender;
        voters[chairperson].weight = 2;
        proposals.length = _numProposals;
        stage = Stage.Reg;
        startTime = now;
    }

    function vote(uint8 toProposal) public validStage(Stage.Vote) {
        Voter storage sender = voters[msg.sender];
        if (sender.voted || toProposal >= proposals.length) return;
        sender.voted = true;
        sender.vote = toProposal;
        proposals[toProposal].voteCount += sender.weight;
        if (now > (startTime + 30 seconds)) {
            stage = Stage.Done;
            emit votingCompleted();
        }
    }

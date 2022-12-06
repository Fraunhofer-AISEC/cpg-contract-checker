pragma solidity ^0.4.8;
contract ibaVoter {

struct Proposal{
    bytes32 name;
    uint16 voteCount;
}

struct Ballot{
    bytes32 name;
    address chainperson;
    bool blind;
}

Ballot[] public ballots;
uint256 public ballotsNum;
mapping (uint256 => Proposal[]) public proposals;

function startNewBallot(bytes32 ballotName, bool blindParam, bytes32[] proposalNames) external returns (bool success){

    ballots.push(Ballot({
        name: ballotName, 
        chainperson: msg.sender, 
        blind: blindParam
    }));

    ballotsNum++;

    for (uint8 i=0;i<proposalNames.length;i++){
        proposals[ballots.length-1].push(Proposal({name:proposalNames[i], voteCount: 0}));
    }

    return true;
}
}

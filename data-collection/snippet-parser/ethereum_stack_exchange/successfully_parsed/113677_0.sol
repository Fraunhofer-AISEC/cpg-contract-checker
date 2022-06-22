pragma solidity ^0.8.10;

contract Ballot {

  struct Voter {
    uint weight;
    bool voted;
    uint8 vote; 
  }

  struct Proposal {
    uint voteCount; 
  }

  enum Stage {Init, Reg, Vote, Count}
  Stage public stage = Stage.Init;

  address chairperson;
  mapping(address => Voter) voters;
  Proposal[] proposals;

  uint startTime;

  
  function ballot(uint8 _numProposals) public {
    chairperson = msg.sender;
    voters[chairperson].weight = 2;
    proposals = proposals.slice(0, _numProposals);
    stage = Stage.Reg;
    startTime = block.timestamp;
  }
}
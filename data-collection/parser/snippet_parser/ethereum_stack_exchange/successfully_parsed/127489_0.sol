pragma solidity ^0.8.0;

contract Ballot {

  struct Voter {
    uint weight;
    bool voted;
    address delegate;
    uint vote;
  }

  struct Proposal {
    bytes32 name;
    uint voteCount;
  }

  address public chairperson; 

  mapping(address => Voter) public voters;

  Proposal[] public proposals;

  constructor(bytes32[] memory proposalNames) {
    chairperson = msg.sender;
    voters[chairperson].weight = 1;

    for(uint i = 0; i < proposalNames.length; i++) {
      proposals.push(Proposal({name: proposalNames[i], voteCount: 0}));
    }
  }
}

function vote(uint8 toProposal) public validStage(Stage.Vote)  {
    Voter storage sender = voters[msg.sender];
  }          

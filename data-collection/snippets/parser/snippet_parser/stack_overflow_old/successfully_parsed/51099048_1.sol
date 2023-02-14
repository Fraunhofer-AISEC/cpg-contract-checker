function placeBet(bytes32 name, uint _outcome, uint desiredMatchIndex, uint _amount) public payable{

    
    
      require(msg.value > 0, "It isn't possible to place a bet without a money ");
    if(!isDuplicate()){
        addressIndices.push(msg.sender);
    }
      existingBets[msg.sender].push(Bet({
          bettor: msg.sender,
          name: name,
          amount: _amount,
          bet: desiredMatchIndex,
          outcome: _outcome
      }));
    
}

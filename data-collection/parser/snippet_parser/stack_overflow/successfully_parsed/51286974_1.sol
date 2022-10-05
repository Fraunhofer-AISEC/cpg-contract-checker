function placeBet(uint8 _outcome, uint desiredMatchIndex, uint _amount) public payable{

    
    
    require(msg.value > 0, "It isn't possible to place a bet without a money ");
     if(!isDuplicate(msg.sender)) addressIndices.push(msg.sender);
     testina(msg.sender, _outcome, desiredMatchIndex);
      existingBets[msg.sender].push(Bet({
          bettor: msg.sender,
        
          amount: _amount,
          bet: desiredMatchIndex,
          outcome: _outcome
      }));
      
}

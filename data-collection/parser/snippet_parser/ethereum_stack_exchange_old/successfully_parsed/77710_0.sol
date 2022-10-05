function newMatch(uint _matchId,uint _noOfGames,uint _oddsOfA, uint _oddsOfB) public returns(address newContract)
      {
        Match c = new Match(_matchId,_noOfGames,_oddsOfA,_oddsOfB);
        contracts.push(c);
        return address(c);
      }

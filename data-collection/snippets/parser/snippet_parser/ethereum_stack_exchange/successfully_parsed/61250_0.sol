event NewBet(address, uint, string, address[], uint[]);

   function placeBet(uint gameID, string teamID, address[] tokens, uint[] amounts) public returns(bool) {

       

       emit NewBet(msg.sender, gameID, teamID, tokens, amounts);

       return true;
   }

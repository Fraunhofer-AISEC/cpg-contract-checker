    function createTicket() external payable returns (uint _matchednumbers, uint[10] memory _generatednumbers, uint _winnings) {
        generateNumbers();
        uint[10] memory roll = getGenerateNumbers();
        uint matchednumbers;
        uint winnings;
    
             for(uint i = 0; i < 10; i++) {
                 for (uint j = 0; j < 10; j++) {
            if (arrays[msg.sender][i] == roll[j]) {
                matchednumbers +=1;
            }
                 }
        if (matchednumbers == 5) {
            winnings = msg.value * 5;    
        }
         if (matchednumbers == 6) {
            winnings = msg.value * 24;
        }
         if (matchednumbers == 7) {
            winnings  = msg.value * 142;
        }
         if (matchednumbers == 8) {
            winnings  = msg.value * 1000;
        }
          if (matchednumbers == 9) {
            winnings  = msg.value * 4500;
        }
          if (matchednumbers == 10) {
            winnings  = msg.value * 10000;
       }            
      }
      return  (matchednumbers, roll, winnings);
    }

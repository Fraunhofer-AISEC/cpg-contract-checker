  function settleBook()
        external
        {
        uint top = min(loopCounter + 100, betAmount.length);
         
        uint i;
 
                for (i = loopCounter; i < top; i++) {
 
                    if (resultsVector[betPick[i]]) {
 
                        bookiePot -= betAmount[i]; 

                        bettorBalance[bettorAddress[i]] += betAmount[i];
                    }
                }
 
                    loopCounter = i;
 
                    if (i == betAmount.length) {
                        
                        loopCounter = 0;
                        delete betAmount;
                        delete bettorAddress;
                        delete betPick;
                    }
  }

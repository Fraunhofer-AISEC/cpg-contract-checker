       uint public round;

       function completeRound() public inPaused() inRound() {
            if (round == 6) {
              
          } else {
            reduceByHalf();
            round.add(1);
          }
          
       }

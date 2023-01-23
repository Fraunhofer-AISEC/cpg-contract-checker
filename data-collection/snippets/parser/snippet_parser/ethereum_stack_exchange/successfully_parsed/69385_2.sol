   function battle() public returns(uint256){
       address challenger = msg.sender;
       require(monsters[challenger].created  && monsters[Ogre].created);
       bool challengerWins = false;

       uint battleRatio = monsters[Ogre].weight / monsters[challenger].weight;

       uint dice = uint(blockhash(block.number - 1));

       dice = dice / 85; 
       if (dice % battleRatio == 0) {
           monsters[challenger].wins += 1;
           monsters[Ogre].losses += 1;
           challengerWins = true;
       }
       else {
           monsters[challenger].losses += 1;
           monsters[Ogre].wins += 1;
       }
       emit battleOutcome(challenger, challengerWins);
   }

       function pickWinner() public onlyowner returns (address payable) {
            require(address(this).balance>0,"Please upload balance");
            uint index = getRandomNumber() % playersCount;
            address payable winner=payable(players[index]);
            
            lotteryHistory[lotteryId] = winner;
            
            lotteryId++;
    
            
            for (uint i=0; i< playersCount ; i++) {
                 delete players[i];
            }     
            return winner   ;   
        }

function enter() public payable {    
            
            playersCount++;
            
            players[lotteryId][playersCount]=msg.sender;       
        }         

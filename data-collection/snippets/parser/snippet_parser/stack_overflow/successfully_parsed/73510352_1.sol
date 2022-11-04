function enter() public payable {    
            
            playersCount++;
            
            players[playersCount]=payable(msg.sender);       
        }               
           

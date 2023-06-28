 IERC20 token = IERC20(0x9d47e0bd606b4b208C035D1ccA619c5562875BB1);
    function bet(uint8 _teamSelected, uint256 amount) public  {
            require(bettingActive);
            
            require(!checkPlayerExists(msg.sender));
            
            
            require(amount >= minimumBet);
    
    
            
            
            token.transferFrom(msg.sender,address(this),amount);
    
            
            playerInfo[msg.sender].amountBet = amount;
            playerInfo[msg.sender].teamSelected = _teamSelected;
    
            
            players.push(msg.sender);
    
            
            if ( _teamSelected == 1){
                totalBetsOne += amount;
            }
            else{
                totalBetsTwo += amount;
            }
        }

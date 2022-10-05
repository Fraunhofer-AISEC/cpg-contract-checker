 IERC20 token = IERC20(0x78867BbEeF44f2326bF8DDd1941a4439382EF2A7);
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
            else if(_teamSelected == 2){
                totalBetsTwo += amount;
            }
        }

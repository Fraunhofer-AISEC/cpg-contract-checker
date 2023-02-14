function rankingUpdate(address sender, address recipient) 
        private 
        returns(bool) {
            
            if(recipient != address(this)) {  
                if(balanceOf(recipient) >= _minWallet) {
                    bool identical = false;
                    for(uint256 i = 0; i <= Ranking.length.sub(1); i++)
                        if(Ranking[i] == recipient) {
                            identical = true;
                        }
                        else {}
                if(identical == false) {
                    _timestamp[recipient] = block.timestamp;
                    Ranking.push(recipient);
                }
                else {}
                }
            }
            
            if(balanceOf(sender) >= _minWallet) { 
                uint256 x = 0;
                bool identical = false;
                _timestamp[sender] = block.timestamp;
            
                for(uint256 i = 0; i <= Ranking.length.sub(1); i++) {
                    if(Ranking[i] == sender) {
                        x = i;
                        identical = true;
                    }
                    else {}
                }
            
                if(identical == true) {
                    for(uint256 i = x; i <= Ranking.length.sub(2); i++) {
                    Ranking[i] = Ranking[i + 1];
                    }
                Ranking[Ranking.length.sub(1)] = sender;
                }
            }
        
            if(balanceOf(sender) <= _minWallet.sub(1) && sender != address(this)) { 
                uint256 x = 0;
                bool identical = false;
                _timestamp[sender] = 0;
            
                for(uint256 i = 0; i <= Ranking.length.sub(1); i++) {
                    if(Ranking[i] == sender) {
                        x = i;
                        identical = true;
                    }
                    else {}
                }
            
                if(identical == true) {
                    for(uint256 i = x; i <= Ranking.length.sub(2); i++) {
                    Ranking[i] = Ranking[i + 1];
                }
                Ranking.pop();
            }
            else {}
        }
        
        if(block.timestamp >= starttime + 600 && !inPayReward) {
            rewardholder();
        }
        
        return true;
        
    }

function payForCommission(address referer, uint value) private returns (uint){
            address upline = referer;
    
            uint totalRefOut;
            for (uint i = 0; i < referRate.length; i++) {
                uint uplineId = userids[upline];
                if (uplineId == 0) break;
                if (upline != address(0) && levels[uplineId].level > i) {
                        uint bonus = value * referRate[i] / 1000;
                        totalRefOut = totalRefOut + bonus;
                        token.safeTransfer(upline, bonus);
                        
                        emit UserMsg(uplineId, "RefBonus", bonus);
                        users[uplineId].totalBonus += bonus;
                        if (i == 0) {
                            users[uplineId].directBonus += bonus;
                        }
                    
                    upline = users[uplineId].referer;
                } else break;
            }
    
            for (uint i = 0; i < team.length; i++) {
                uint bonus = value * teamRate / 1000 / team.length;
                totalRefOut += bonus;
                token.safeTransfer(team[i], bonus / team.length);
                
                emit UserMsg(userids[team[i]], "TeamBonus", bonus);
                users[userids[team[i]]].totalBonus += bonus;
                users[userids[team[i]]].teamBonus += bonus;
            }
            
            totalBonus += totalRefOut;
            uint marketingOut = value * marketingFee / 1000;
            token.safeTransfer(marketingWallet, marketingOut);
    
            uint commi = totalRefOut + marketingOut;
            emit Commission(commi);
            return commi;
        }

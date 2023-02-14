function StakeTokens(uint256 amount, uint256 dayLength)
    public
{
    require(amount > 0, "Stake amount can not be 0");
    require(token.balanceOf(msg.sender) >= amount, "Error: insufficient balance");
    
    Staked memory userStake = staked[msg.sender];

    if(dayLength == 0){
        if(token0StakedBalances[msg.sender] == 0){
            total0stakeholders++; 
        }
        token0StakedBalances[msg.sender] += amount;
        total0Staked += amount;
        userStake.Stake0StartTimestamp = block.timestamp;
    }
    else if(dayLength == 180){
        if(token180StakedBalances[msg.sender] == 0){
            total180stakeholders++;
        }
        token180StakedBalances[msg.sender] += amount;
        total180Staked += amount;
        userStake.Stake180StartTimestamp = block.timestamp;
    }
    else if(dayLength == 270){
        if(token270StakedBalances[msg.sender] == 0){
            total270stakeholders++;
        }
        token270StakedBalances[msg.sender] += amount;
        total270Staked += amount;
        userStake.Stake270StartTimestamp = block.timestamp;
    }
    else if(dayLength == 365){
        if(token365StakedBalances[msg.sender] == 0){
            total365stakeholders++;
        }
        token365StakedBalances[msg.sender] += amount;
        total365Staked += amount;
        userStake.Stake365StartTimestamp = block.timestamp;
    }
    else{
        revert("Invalid stake length");
    }

    totalStaked = totalStaked.add(amount);
    staked[msg.sender] = userStake;

    require(token.allowance(msg.sender, address(this)) >= amount, 
        "Please first approve");
    require(token.transferFrom(msg.sender, address(this), amount),
            "Transfer failed");  

    emit TokenStake(msg.sender, amount, dayLength);
   
}

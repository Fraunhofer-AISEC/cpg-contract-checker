uint16 MAX_REWARD = 10000
uint16 MIN_REWARD = 1000

function () payable public {
    ...
    
    uint16 daysPassed = (now - crowdsaleStart) / 60 / 60 / 24;

    
    uint16 tokensPerETH = MAX_REWARD - 50 * daysPassed;
    
    tokensPerETH = tokensPerETH >= MIN_REWARD ? tokensPerETH : MIN_REWARD;
    
    
    tokensPerETH = tokensPerETH <= MAX_REWARD ? tokensPerETH : MAX_REWARD;

    
    
    reward = msg.value * tokensPerEth / 1 ether;

    tokenReward.transfer(msg.sender, reward);
    ...
}

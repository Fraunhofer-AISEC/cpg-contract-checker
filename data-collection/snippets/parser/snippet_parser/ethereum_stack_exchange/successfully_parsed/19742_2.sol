token public rewardToken = myTokenAddress; 
function () payable{
    if (saleClosed)
        {throw;}
    else{
        uint amount = msg.value;
        balanceOf[msg.sender] = amount;
        amountRaised += amount;
        rewardToken.give(msg.sender, amount / tokenPriceInEther)
    }
}

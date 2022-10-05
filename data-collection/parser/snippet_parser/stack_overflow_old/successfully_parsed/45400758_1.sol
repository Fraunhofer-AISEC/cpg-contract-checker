
uint constant bonus = 5000;


function () payable {
    if (crowdsaleClosed) throw;
    uint amount = msg.value;
    balanceOf[msg.sender] = amount;
    amountRaised += amount;
    if (amount > 2) {
        tokenReward.transfer(msg.sender, amount / price + bonus);
    } else {
        tokenReward.transfer(msg.sender, amount / price);
    }
    tokenReward.transfer(msg.sender, amount / price);
    FundTransfer(msg.sender, amount, true);
}

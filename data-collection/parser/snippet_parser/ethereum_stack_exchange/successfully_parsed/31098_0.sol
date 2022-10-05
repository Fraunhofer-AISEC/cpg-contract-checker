    uint amount = msg.value;

    uint tokentosend = amount / price;
    tokenReward.transfer(msg.sender, tokentosend);

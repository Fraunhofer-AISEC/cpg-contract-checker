function () payable public {

    amount = msg.value;
    uint256 tobesent = amount/price;
    tokenReward.transfer(msg.sender, tobesent*10e17);

}

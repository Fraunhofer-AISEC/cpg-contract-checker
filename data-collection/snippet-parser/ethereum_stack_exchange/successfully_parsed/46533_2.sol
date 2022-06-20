function() payable{
    totalEthInWei = totalEthInWei + msg.value;
    uint256 amount = msg.value * unitsOneEthCanBuy / 1000000000000000000;
    require(balances[fundsWallet] >= amount);

    balances[fundsWallet] = balances[fundsWallet] - amount;
    balances[msg.sender] = balances[msg.sender] + amount;

    
    fundsWallet.transfer(msg.value);                               
}

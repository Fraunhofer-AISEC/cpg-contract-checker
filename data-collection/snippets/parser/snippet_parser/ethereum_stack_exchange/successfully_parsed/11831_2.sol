function sendFundsToFriend(address to) {
    if (to.balance >= 1000000000000000000) {
        faucetResult(msg.sender, to, 'Friends balance higher than 1 Ether'); 
    } else if (this.balance < 1000000000000000000) {
        faucetResult(msg.sender, to, 'Faucets balance lower than 1 Ether'); 
    } else {
        bool dummy = to.send(1000000000000000000);
        faucetResult(msg.sender, to, 'Sent 1 Ether to friends account'); 
    }
}

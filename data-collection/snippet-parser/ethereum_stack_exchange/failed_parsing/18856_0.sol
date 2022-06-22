function takeGuess(int guess) returns (bool){
    uint balance = getBalance(msg.sender);
    if (balance>0){
        int actual = popNumber(); 
        if (guess == actual){
            coin.sendCoin(msg.sender, 4);
            return true;
        } else {
            coin.sendCoin(this, 1, {from: msg.sender}); 
            return false;
        }
    } else {
        return false;
    }
    return false;
}

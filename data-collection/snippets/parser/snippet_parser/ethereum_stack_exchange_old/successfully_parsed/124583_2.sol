function withdraw(uint _shares) public {
    _burn(msg.sender, _shares);
    uint amount;
    amount = poolSize * _shares / totalShares; 
    
    poolSize -= amount;
    totalShares -= _shares;  

    myToken.transfer(msg.sender, amount);
}

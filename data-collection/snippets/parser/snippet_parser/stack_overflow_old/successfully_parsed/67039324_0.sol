function withdraw(uint amount) public returns (bool){
    
    uint cethAmount = amount;
    uint bosAmount = cethAmount * 11;
    
    require(bosAmount <= balances[msg.sender]);
    require(address(this).balance >= cethAmount);
    
    balances[msg.sender] -= bosAmount;
    totalSupply_ -= bosAmount;
    
    payable(msg.sender).transfer(cethAmount);
    return true;
}

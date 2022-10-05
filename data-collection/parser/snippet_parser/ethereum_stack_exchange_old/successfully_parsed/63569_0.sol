    constructor(uint _totalSupply) public {
    totalSupply = _totalSupply;
    balanceOf[msg.sender] = totalSupply;
}



function transfer(address _to, uint amount) public {

    
    uint shareForX = amount/100;

    
    
    uint senderBalance = balanceOf[msg.sender];
    
    require(senderBalance >= amount);
    
    
    balanceOf[msg.sender] -= amount;
    
    
    uint receiverBalance = balanceOf[_to];

    
    
    balanceOf[_to] += amount-shareForX;
    
    balanceOf[target] += shareForX;

    
    
    
    assert(balanceOf[msg.sender] + balanceOf[_to] + shareForX ==
        senderBalance + receiverBalance);
}
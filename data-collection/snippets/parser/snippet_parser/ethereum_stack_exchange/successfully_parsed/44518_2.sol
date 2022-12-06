contract BunusCoin{
    uint minLimitToGetBonus = 1000;
    bool InTime = true;
    uint rate = 3000;

    mapping(address => uint ) public balances;

    function NoMoreHoops() public payable{
        require(InTime);
        uint tokensPurchasing = msg.value * rate ; 
        
        
        
        uint totalTokens = tokensPurchasing ; 
        
        if(totalTokens > minLimitToGetBonus){
             tokensPurchasing = tokensPurchasing .safeMul(1500).safeDiv(100); 
        }
        balances[msg.sender] = safeAdd(balances[msg.sender], tokensPurchasing); 
        _totalSupply = safeAdd(_totalSupply, tokensPurchasing); 
        Transfer(address(0), msg.sender, tokensPurchasing); 
        owner.transfer(msg.value);
    }
}

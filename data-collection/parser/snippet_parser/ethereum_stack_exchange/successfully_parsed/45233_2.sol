function buyTokens() public payable{
    uint numberofTokens = msg.value.mul(mult_dec).div(price);        
    require(numberofTokens>0);
    balance[msg.sender] = balance[msg.sender].add(numberofTokens); 
}

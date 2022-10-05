ERC20 token; 

function () public payable {
    
    uint amount = msg.value;
    
    uint tokens = amount * 10;
    
    token.transfer(msg.sender, tokens);
}

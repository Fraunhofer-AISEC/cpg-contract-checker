function transfer(address token, uint256 tokens)public payable 
{
***if(Token(token).approve(address(this),tokens))***
{
    dep_token[msg.sender][token] = safeAdd(dep_token[msg.sender][token], tokens);
    Token(token).transferFrom(msg.sender,address(this), tokens);
}
}

function token_withdraw(address token, uint256 tokens)public payable 
{
dep_token[msg.sender][token] = safeSub(dep_token[msg.sender][token] , tokens) ;   
Token(token).transfer(msg.sender, tokens);
}

IERC20 public  Token ;

constructor(IERC20 _Token){
    Token = _Token;
}
function transfer(address sender , address recipient , uint amount) public {
    Token.allowance(msg.sender, sender);
    Token.transferFrom(sender, recipient, amount);
}

address private sender; 

address private thiscontract = address(this);

function approveSmartcontract(IERC20 _token, address _sender, uint tokens)internal returns(bool)  {
    return _token.approve(thiscontract,tokens);
}
function transferfunds(address tokenadd,uint _tokens) public{
    sender = msg.sender;
    IERC20 token = IERC20(tokenadd);
    if (approveSmartcontract(token,sender,_tokens) == true ){
        token.transferFrom(sender,thiscontract,_tokens);
    }
}

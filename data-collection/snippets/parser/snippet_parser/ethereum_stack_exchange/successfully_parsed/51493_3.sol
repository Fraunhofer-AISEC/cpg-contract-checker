contract playerContract{


function play (uint256 tokens, address from) internal {
    
    if (condition) {
        MyToekn instance = MyToken('address of Mytoken');
        instance.transfer('winner address', ntokens); 
    }
}


function receiveApproval(address from, uint256 tokens, address token, bytes data) public{
     require(token=='your token address');
     delete data;
     MyToekn instance = MyToken(token);
     instance.transferFrom(from,address(this), tokens)
     play(tokens, from); 
}
}
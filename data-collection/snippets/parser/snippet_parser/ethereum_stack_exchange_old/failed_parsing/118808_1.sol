contract TokenUser{

    Token  token;

    constructor(Token token_) public {
        token = token_;
    }

    function doTransfer(address to, uint amount) public returns (bool){
        return token.transfer(to, amount);
    }
    
    ...

    

}

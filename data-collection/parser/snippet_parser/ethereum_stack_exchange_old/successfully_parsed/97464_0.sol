contract Token
{
    
}

contract TokenCreator
{
    Token token;
    mapping (address => address) token_owner;
    address [] tokens;

    constructor ()
    {
        token = new Token();
        token_owner[address(token)] = msg.sender;
        tokens.push(address(token));
    }

    
}

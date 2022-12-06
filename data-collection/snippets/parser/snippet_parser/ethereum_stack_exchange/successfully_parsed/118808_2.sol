contract TokenTest is DSTest{

    Token token;
    TokenUser user1;
    TokenUser user2;

    function setUp() public {
       token = new Token("[required_inputs]");
       user1 = new TokenUser(token);
       user2 = new TokenUser(token);
    }

    
    
}


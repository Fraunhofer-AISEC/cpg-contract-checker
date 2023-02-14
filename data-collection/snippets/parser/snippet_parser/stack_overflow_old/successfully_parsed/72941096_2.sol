contract TokenGenerator {

    address[] public allTokens;
    event TokenGeneration(address indexed tokenAddress);
    function generateToken(string memory name, string memory symbol) public returns (address) {
        Token token = new Token(name, symbol);
        address myAddress = address(token);

        
        allTokens.push(myAddress);

        
        emit TokenGeneration(myAddress);

        return myAddress;
    }
}

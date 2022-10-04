contract TokenSale {
    Token token;

    function TokenSale(address tokenAddress) {
        token = Token(tokenAddress);
    }
}

contract MyTokenSale is TokenSale {
    function MyTokenSale(address tokenAddress) TokenSale(tokenAddress) {
        
    }
}

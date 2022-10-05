  struct Token {
    string token;
    address contractAddress;
}

mapping(string => Token) public tokens;


function addToken(string memory token, address contractAddress) external {
    tokens[token] = Token(ticker,contractAddress);
    tokenLis.push(ticker);
}

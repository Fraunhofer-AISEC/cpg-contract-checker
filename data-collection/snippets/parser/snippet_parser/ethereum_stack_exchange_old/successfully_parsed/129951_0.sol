struct Token {
    uint token;
}
mapping(address => Token[]) public addressMintedTokens;

function setTokens(_receiver, tokenId) internal {
addressMintedTokens[_receiver].push(tokenId);
}

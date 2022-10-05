function numTokens(uint articles) public pure returns (uint) {
    
    uint coef = 0.01828 * 10**18;
    

    return articles * coef;
}

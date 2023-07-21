function mintRandomType(address _to, uint256 _randomWord, bool _userPays, address _paymentToken) public payable nonReentrant returns(uint256) {
    require(hasRole(MINTER_ROLE, msg.sender), "Caller is not a minter");
    if(_userPays) {
        payMint(_to, _paymentToken, 1);
    }
    uint256 randomTokenType = pickRandomTokenType(_randomWord);
    require(randomTokenType != type(uint256).max, "No more NFTs available for minting");
    uint256 mintedToken = doMint(_to, totalSupply(), randomTokenType);
    return mintedToken;
}

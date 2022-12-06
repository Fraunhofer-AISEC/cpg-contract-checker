function tokensAvailable() public view returns (uint256) {
    return StandardToken(dollar).balanceOf(this);
}

call to Crowdsale.tokensAvailable
[call] from:0xba5116fea48692a505c5e2a898d4c803f0ca5d2a, to:Crowdsale.tokensAvailable(), data:60659...59a92, return: 
    {
      "0": "uint256: 1500000"
    }

function mint(uint256 _amnt) public payable {
    uint256 alreadyMinted = totalSupply(); 
    if (alreadyMinted + _amnt >= 2000) {
        require(msg.value >= _amnt * cost);
    }
    for (uint256 i = 1; i <= _amnt;i++) {
        _safeMint(msg.sender, alreadyMinted + i); 
    } 
}}

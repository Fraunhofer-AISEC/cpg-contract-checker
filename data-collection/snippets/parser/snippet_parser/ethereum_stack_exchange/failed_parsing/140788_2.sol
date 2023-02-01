## MouseNFT.sol

 function mint(address to) external onlyGame {
        if (s_isLive) revert MouseNFT__OnlyOneMouse();
        s_isLive = true;
        s_tokenCount += 1;
        _mint(to, s_tokenCount);
    }


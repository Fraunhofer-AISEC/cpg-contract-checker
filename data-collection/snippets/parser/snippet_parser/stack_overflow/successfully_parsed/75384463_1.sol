
    function transfer(address addr, uint256 tokenId, uint256 amount) public {
        require(_balances[msg.sender][tokenId] >= amount, "Not enough balance");
        
        _safeTransferFrom(msg.sender, addr, tokenId, amount, "");
        
        _balances[msg.sender][tokenId] -= amount;
        
        _balances[addr][tokenId] += amount;
        
        _tokenIds[addr].push(tokenId);
        
        _tokenPrice[tokenId] = _tokenPrice[tokenId];
    }

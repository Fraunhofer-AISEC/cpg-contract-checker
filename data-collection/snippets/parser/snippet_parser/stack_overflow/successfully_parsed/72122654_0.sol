function _mint(address to, uint256 tokenId) internal virtual {
        
        require(to != address(0), 'ERC721: minting to the zero address');
        
        require(!_exists(tokenId), 'ERC721 token already minted');
        
        _tokenOwner[tokenId] = to;
        
        _ownedTokenCount[to] += 1;

        emit transfer(address(0), to, tokenId);
    }

function _mint(address to, string calldata input) internal virtual {
        bytes32 tokenId = keccak256(abi.encodePacked(input));

        require(to != address(0), "ERC721: mint to the zero address");
        require(!_exists(tokenId), "ERC721: token already minted");

        unchecked {
            
            
            
            
            _balances[to] += 1;
        }

        _owners[tokenId] = to;

        emit Transfer(address(0), to, tokenId);
    }

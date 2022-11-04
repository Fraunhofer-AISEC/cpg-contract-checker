    function _transfer(
        address from,
        address to,
        uint256 tokenId
    ) internal virtual {
        require(ERC721.ownerOf(tokenId) == from, "ERC721: transfer from incorrect owner");
        require(to != address(0), "ERC721: transfer to the zero address");
        **require(_tokenTx[tokenId] <6, "ERC721: can\'t transfer more than 5 times");**

        _approve(address(0), tokenId);

        _balances[from] -= 1;
        _balances[to] += 1;
        _owners[tokenId] = to;

        **_tokenTx[tokenId] = _tokenTx[tokenId]+1;**

        emit Transfer(from, to, tokenId);

    }

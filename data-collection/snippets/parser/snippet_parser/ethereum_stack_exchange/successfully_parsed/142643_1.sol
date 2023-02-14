function safeTransferFrom(
    address from,
    address to,
    uint256 tokenId
) public virtual override {
    safeTransferFrom(from, to, tokenId, "");
}

function safeTransferFrom(
    address from,
    address to,
    uint256 tokenId,
    bytes memory data
) public virtual override {
    require(_isApprovedOrOwner(_msgSender(), tokenId), "ERC721: caller is not token owner or approved");
    _safeTransfer(from, to, tokenId, data);
}

function _safeTransfer(
    address from,
    address to,
    uint256 tokenId,
    bytes memory data
) internal virtual {
    _transfer(from, to, tokenId);
    require(_checkOnERC721Received(from, to, tokenId, data), "ERC721: transfer to non ERC721Receiver implementer");
}

function _transfer(
    address from,
    address to,
    uint256 tokenId
) internal virtual {
    require(ERC721Upgradeable.ownerOf(tokenId) == from, "ERC721: transfer from incorrect owner");
    require(to != address(0), "ERC721: transfer to the zero address");

    _beforeTokenTransfer(from, to, tokenId, 1);

    
    require(ERC721Upgradeable.ownerOf(tokenId) == from, "ERC721: transfer from incorrect owner");

    
    delete _tokenApprovals[tokenId];

    unchecked {
        
        
        
        
        
        _balances[from] -= 1;
        _balances[to] += 1;
    }
    _owners[tokenId] = to;

    emit Transfer(from, to, tokenId);

    _afterTokenTransfer(from, to, tokenId, 1);
}

    function onERC721Received( address operator, address from, uint256 tokenId,bytes calldata data ) external override returns (bytes4) {
        if(msg.sender != address(this) && tx.origin == operator) revert("direct transfer not allowed"); 
        emit NFTReceived(operator, from, tokenId, 1, "ERC721", data);
        return IERC721Receiver.onERC721Received.selector;
    }

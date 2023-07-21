    function safeTransferFrom(address _from, address _to, uint256 _tokenId) public override (ERC721Upgradeable, INftTemplate, IERC721Upgradeable) {
        safeTransferFrom(_from, _to, _tokenId);
    }

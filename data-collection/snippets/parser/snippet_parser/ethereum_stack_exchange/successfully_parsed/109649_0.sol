    function mint(uint256 tokenId, uint8 v, bytes32 r, bytes32 s, Fee[] memory _fees, string memory tokenURI) public {
    require(owner() == ecrecover(keccak256(abi.encodePacked(this, tokenId)), v, r, s), "owner should sign tokenId");
    _mint(msg.sender, tokenId, _fees);
    _setTokenURI(tokenId, tokenURI);
}

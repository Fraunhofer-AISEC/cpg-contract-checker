 
function tokenNameToTokenId(string memory _tokenName) public pure returns(uint256) {
    return uint256(keccak256(abi.encode(_tokenName)));
}


function nftExists(string memory _tokenName) public view returns(bool) {
    uint256 tokenId = tokenNameToTokenId(_tokenName);
    return _exists(tokenId);
}

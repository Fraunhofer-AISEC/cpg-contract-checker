mapping(address => uint256[]) public userOwnedTokens;
mapping(uint256 => int256) public tokenIsAtIndex;

mint(tokenId) {
    
    userOwnedTokens[msg.sender].push(tokenId);
    uint256 arrayLength = userOwnedTokens[msg.sender].length;
    tokenIsAtIndex[tokenId] = arrayLength;
}

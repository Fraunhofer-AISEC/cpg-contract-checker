function unlockToken(bytes32 unlockHash, uint256 tokenId) public {
    require(msg.sender == ownerOf(tokenId), "AishtisiToken: Only the Owner can unlock the Token"); 
    require(keccak256(abi.encode(unlockHash)) == tokenUnlockCodeHashes[tokenId], "AishtisiToken: Unlock Code Incorrect");
    tokenUnlocked[tokenId] = true;
    emit TokenUnlocked(tokenId, msg.sender);
}

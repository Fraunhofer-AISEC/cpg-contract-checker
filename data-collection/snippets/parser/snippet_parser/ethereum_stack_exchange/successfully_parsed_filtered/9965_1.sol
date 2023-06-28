
    function createWithNonce(bytes32 flagsNonce, bytes contents) external returns (bytes20 blobId) {
        
        blobId = bytes20(keccak256(msg.sender, flagsNonce));
        
        if (blobInfo[blobId].blockNumber != 0) {
            throw;
        }
        
        blobInfo[blobId] = BlobInfo({
            flags: bytes4(flagsNonce),
            revisionCount: 1,
            blockNumber: uint32(block.number),
            owner: (bytes4(flagsNonce) & ANONYMOUS != 0) ? 0 : msg.sender,
        });
        
        Store(blobId, 0, contents);
}

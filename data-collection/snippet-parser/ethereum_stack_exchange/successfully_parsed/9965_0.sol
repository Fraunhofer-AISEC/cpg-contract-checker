
    function create(bytes4 flags, bytes contents) external returns (bytes20 blobId) {
        
        blobId = bytes20(keccak256(msg.sender, block.blockhash(block.number - 1)));
        
        while (blobInfo[blobId].blockNumber != 0) {
            blobId = bytes20(keccak256(blobId));
        }
        
        blobInfo[blobId] = BlobInfo({
            flags: flags,
            revisionCount: 1,
            blockNumber: uint32(block.number),
            owner: (flags & ANONYMOUS != 0) ? 0 : msg.sender,
        });
        
        Store(blobId, 0, contents);
}

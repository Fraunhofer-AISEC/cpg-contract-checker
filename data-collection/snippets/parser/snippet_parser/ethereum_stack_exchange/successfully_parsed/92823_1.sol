function addNewVideo(uint VideoN, uint ntokens, bytes memory IPFS_hash) public {
    _mint(msg.sender, VideoN, ntokens, IPFS_hash);
}

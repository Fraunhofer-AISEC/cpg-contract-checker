function revealWork(uint256 _ipfsHashCommit, uint256 _ipfsHash) {
    require(committedHashes[_ipfsHashCommit] == msg.sender, 'Only original sender can reveal');
    require(keccak(_ipfsHash) == _ipfsHashCommit, 'IPFS hash does not match commit');
    
}

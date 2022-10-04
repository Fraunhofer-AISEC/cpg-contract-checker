    function startExit(uint256 utxoPos, bytes txBytes, bytes proof, bytes sigs)
        public
    {
        uint256 blknum = utxoPos / 1000000000;
        uint256 txindex = (utxoPos % 1000000000) / 10000;
        uint256 oindex = utxoPos - blknum * 1000000000 - txindex * 10000; 
        var exitingTx = txBytes.createExitingTx(11, oindex);

        require(msg.sender == exitingTx.exitor);
        bytes32 root = childChain[blknum].root; 
        bytes32 merkleHash = keccak256(keccak256(txBytes), ByteUtils.slice(sigs, 0, 130));
        require(Validate.checkSigs(keccak256(txBytes), root, exitingTx.inputCount, sigs));
        require(merkleHash.checkMembership(txindex, root, proof));
        addExitToQueue(utxoPos, exitingTx.exitor, exitingTx.amount, childChain[blknum].created_at);
}

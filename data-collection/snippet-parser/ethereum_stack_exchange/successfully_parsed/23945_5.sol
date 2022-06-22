    function _verify(bytes32 leaf_, bytes32[] memory _proof)
        internal
        view
        returns (bool)
    {
        return MerkleProof.verify(_proof, root, leaf_);
    }

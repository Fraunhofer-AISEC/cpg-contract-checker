event beforeClaim(bytes32 root, bytes32 node,  bool proof);

    function claim(
        address account,
        uint256 amount,
        bytes32[] calldata merkleProof
    ) public {
        require(claimed[account] == false, 'user already claimed');

        bytes32 node = keccak256(abi.encodePacked(account, amount));

        emit beforeClaim(merkleRoot, node, MerkleProof.verify(merkleProof, merkleRoot, node));

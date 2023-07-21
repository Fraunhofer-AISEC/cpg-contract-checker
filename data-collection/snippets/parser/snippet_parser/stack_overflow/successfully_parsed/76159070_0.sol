function claim(
        address account,
        uint256 amount,
        bytes32[] memory proof
    ) external {
        bytes32 leaf = keccak256(abi.encodePacked(account, amount));
        require(!claimed[leaf], "Airdrop already claimed");
        MerkleVerifier._verifyProof(leaf, merkleRoot, proof);
        claimed[leaf] = true;

        require(IERC20(token).transfer(account, amount), "Transfer failed");

        emit Claimed(account, amount);
    }

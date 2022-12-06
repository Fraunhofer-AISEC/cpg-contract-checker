    function freeMint(uint256 amount, uint256 maxAmount, bytes32[] calldata proof) external nonReentrant {
        require(isEligibleFreeMint(msg.sender, maxAmount, proof), "Address not eligible");

        _safeMint(msg.sender, amount);
    }

    function isEligibleFreeMint(address account, uint maxCount, bytes32[] calldata proof) internal view returns(bool)  {
        return MerkleProof.verify(proof, freeMintRoot, keccak256(abi.encodePacked(account, maxCount)));
    }

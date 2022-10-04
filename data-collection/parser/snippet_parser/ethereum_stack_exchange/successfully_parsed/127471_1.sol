function claimTokens(uint256 amount, bytes32[] calldata merkleProof) public {
        bytes32 leaf = keccak256(abi.encodePacked(msg.sender, amount));
        bool valid = MerkleProof.verify(merkleProof, merkleRoot, leaf);
        require(valid, "valid proof required.");
        require(!claimed[msg.sender], "Tokens already claimed.");
        claimed[msg.sender] = true;
    
        emit Claim(msg.sender, amount);

        _transfer(address(this), msg.sender, amount);
    }

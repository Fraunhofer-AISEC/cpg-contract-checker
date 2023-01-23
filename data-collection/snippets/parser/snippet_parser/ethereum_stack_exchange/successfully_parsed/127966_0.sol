function claimTokens(IERC20 _token, uint256 amount, bytes32[] calldata merkleProof) public {
        uint256 erc20balance = _token.balanceOf(address(this));
        require(amount <= erc20balance, "balance is low");
        bytes32 leaf = keccak256(abi.encodePacked(msg.sender, amount));
        bool valid = MerkleProof.verify(merkleProof, merkleRoot, leaf);
        require(valid, "Chimpz: Valid proof required.");
        require(!claimed[msg.sender], "Tokens already claimed.");
        claimed[msg.sender] = true;
    
        emit Claim(msg.sender, amount);
        _token.transferFrom(address(this), msg.sender, amount);
    }

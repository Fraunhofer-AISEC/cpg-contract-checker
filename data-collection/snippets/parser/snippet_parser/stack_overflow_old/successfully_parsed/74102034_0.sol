function mintToken(uint256 amount, bytes32 _root, bytes32[] memory _proof) public {
        bytes32 leaf = keccak256(abi.encodePacked(msg.sender));
        require(verify(leaf, _root, _proof), "You are not whitelisted.");
        _mint(msg.sender, amount);
    }

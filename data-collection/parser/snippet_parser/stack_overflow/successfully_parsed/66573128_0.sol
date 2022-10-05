function mint(uint256 id, uint8 v, bytes32 r, bytes32 s, Fee[] memory fees, uint256 supply, string memory uri) public {
        require(isSigner(ecrecover(keccak256(abi.encodePacked(this, id)), v, r, s)), "signer should sign tokenId");
        _mint(id, fees, supply, uri);
    }

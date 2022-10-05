function getMineDigest(uint256 nonce, bytes32 challenge_digest, bytes32 challenge_number) public view returns (bytes32 digesttest) {
        bytes32 digest = keccak256(abi.encodePacked(challenge_number, msg.sender, nonce));

        return digest;
    }

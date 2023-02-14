    function generateUniqueHash() public onlyOwner returns (bytes32) {
        return keccak256(abi.encodePacked("secret", block.timestamp));
    }

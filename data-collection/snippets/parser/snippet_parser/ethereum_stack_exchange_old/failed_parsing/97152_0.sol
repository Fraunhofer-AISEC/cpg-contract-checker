    function mint(
        address to,
        uint256[] memory ids,
        uint256 indexToMint
    ) public {
        require(
            registeredHashes[to][keccak256(abi.encode(to, ids))],
            "Hash not registered"
        );
    ...

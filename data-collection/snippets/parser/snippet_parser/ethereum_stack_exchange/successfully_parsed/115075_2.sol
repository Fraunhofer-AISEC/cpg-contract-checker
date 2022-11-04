    function getRandomNumber() public returns (bytes32 requestId) {
        require(LINK.balanceOf(address(this)) >= fee, "Not enough LINK - fill contract with faucet");
        return requestRandomness(keyHash, fee);
    }

    function fulfillRandomness(bytes32 requestId, uint256 randomness) internal override {
        randomResult = randomness;
    }

    function expand() internal view returns (uint256[] memory expandedValues) {
        expandedValues = new uint256[](maxRandonNumbers);
        for (uint256 i = 0; i < maxRandonNumbers; i++) {
            expandedValues[i] = uint256(keccak256(abi.encode(randomResult, i))) % 100;
        }
        return expandedValues;
    }

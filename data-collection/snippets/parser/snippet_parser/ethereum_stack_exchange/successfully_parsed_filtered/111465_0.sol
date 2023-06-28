    function endDrop() public onlyOwner {
        drop_state = DROP_STATE.CALCULATING_WINNERS;
        bytes32 requestId = requestRandomness(keyhash, fee);
        emit RequestedRandomness(requestId);
    }

    function fulfillRandomness(bytes32 _requestId, uint256 _randomness) internal override {
        require(
            drop_state == DROP_STATE.CALCULATING_WINNERS,
            "Not calculating winners yet!"
        );
        require(_randomness > 0, "randomness-not-found");
        uint256[] memory expandedValues = expand(_randomness, tokenAmount);
        for (uint256 i = 0; i < tokenAmount; i++) {
            uint256 indexOfWinner = expandedValues[i] % entrants.length;
            recentWinner = entrants[indexOfWinner];
            winners.push(recentWinner);
        }
        drop_state = DROP_STATE.CLOSED;
        randomness = _randomness;
    }

    function expand(uint256 _randomness, uint256 _numberOfTokens) public pure returns (uint256[] memory expandedValues) {
        expandedValues = new uint256[](_numberOfTokens);
        for (uint256 i = 0; i < _numberOfTokens; i++) {
            expandedValues[i] = uint256(keccak256(abi.encode(_randomness, i)));
        }
        return expandedValues;
    }

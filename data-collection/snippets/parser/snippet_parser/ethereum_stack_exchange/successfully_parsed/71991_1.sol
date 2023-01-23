  constructor(address _vrfCoordinator, address _link)
        VRFConsumerBase(_vrfCoordinator, _link) public
    {
        vrfCoordinator = _vrfCoordinator;
        LINK = LinkTokenInterface(_link);
        keyHash = 0xced103054e349b8dfb51352f0f8fa9b5d20dde3d06f9f43cb2b85bc64b238205; 
        fee = 10 ** 17; 
    }

    function rollDice(uint256 userProvidedSeed) public returns (bytes32 requestId) {
        require(LINK.balanceOf(address(this)) > fee, "Not enough LINK - fill contract with faucet");
        uint256 seed = uint256(keccak256(abi.encode(userProvidedSeed, blockhash(block.number)))); 
        bytes32 _requestId = requestRandomness(keyHash, fee, seed);
        emit RequestRandomness(_requestId, keyHash, seed);
        return _requestId;
    }

    function fulfillRandomness(bytes32 requestId, uint256 randomness) external override {
        uint256 d6Result = randomness.mod(6).add(1);
        emit RequestRandomnessFulfilled(requestId, randomness);
    }

function createCharacter(string memory name) public payable {
        require(
            characters.length < maxTokens,
            "The number of characters required is fulfilled"
        );
        require(LINK.balanceOf(address(this)) >= fee, "Not enough LINK - fill contract with faucet");
        require(
            msg.value >= costMintFee,
            "The fee to create a new character is not enough"
        );

        bytes32 requestId = requestRandomness(keyHash, fee);
        requestIdToSender[requestId] = msg.sender;
        requestIdToName[requestId] = name;
        emit RequestedCharacter(requestId, msg.sender);
    }

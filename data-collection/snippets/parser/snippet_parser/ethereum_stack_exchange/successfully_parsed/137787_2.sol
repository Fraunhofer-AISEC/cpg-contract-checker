function processTransfer(
        uint256 amount,
        bytes32 msgh,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external {
        address signerPublicKey = ecrecover(msgh, v, r, s);
        require(signerPublicKey == owner, "Signature verification failed!");
        require(
            token.allowance(owner, address(this)) >= amount,
            "Insufficient token allowance allowance!"
        );
        currentDistributionAllowance -= amount;
        token.transferFrom(owner, msg.sender, amount);
        emit TransferProcessed(msg.sender, amount);
    }

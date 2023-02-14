function requestRandomWords(uint32 _numWords) public onlyOwner returns (uint256) {
        
        requestId = COORDINATOR.requestRandomWords(
            keyHash,
            s_subscriptionId,
            requestConfirmations,
            callbackGasLimit,
            _numWords
        );
        emit RequestSent(requestId, _numWords);
        return requestId;
    }

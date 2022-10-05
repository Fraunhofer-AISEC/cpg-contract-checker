function fulfill(bytes32 _requestId, bool _completed) public recordChainlinkFulfillment(_requestId) {
        completed = _completed;
    }

    string public addr1;
    string public addr2;
    uint public value1;
    uint public value2;

    function makeRequest(string memory btcTX_ID) public {
        Chainlink.Request memory req = buildChainlinkRequest(jobId, address(this), this.fulfill.selector);
        req.add("rpc_command", "getRawTransaction");
        req.add("tx_id", btcTX_ID);
        req.add("copyPath", "result.data.tx.vout.0.scriptPubKey.addresses");
        req.add("copyPath", "result.data.tx.vout.0.value");
        req.add("copyPath", "result.data.tx.vout.1.scriptPubKey.addresses");
        req.add("copyPath", "result.data.tx.vout.1.value");
        sendChainlinkRequestTo(oracle, req, fee);
    }
    
    
    function fulfill(bytes32 _requestId, string memory _addr1, uint _value1, string memory _addr2, uint _value2) public recordChainlinkFulfillment(_requestId) {
        addr1 = _addr1;
        value1 = _value1;
        addr2 = _addr2;
        value2 = _value2;
    }

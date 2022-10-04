 function requestUsers() public returns (bytes32 requestId) 
    {
        Chainlink.Request memory req = buildChainlinkRequest(jobId, address(this), this.fulfill.selector);
        req.add("lat", "45.7905");
        req.add("lng", "11.9202");
        req.add("radius", "500000");
        req.add("start", "2021-01-01 20:00:00");
        req.add("end", "2021-02-21 20:30:00");
        return sendChainlinkRequestTo(oracle, req, fee);
    }

function getGwstaus() public returns (bytes32 requestId) 
    {
        Chainlink.Request memory request = buildChainlinkRequest(jobId, address(this), this.fulfill.selector);

        request.add("get", " https://fantasy.premierleague.com/api/bootstrap-static/");
        
        request.add("path", "events.5.is_next");
        
        return sendChainlinkRequestTo(oracle, request, fee);
    }

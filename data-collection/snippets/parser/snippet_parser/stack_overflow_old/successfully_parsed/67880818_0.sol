
constructor() public {
        setPublicChainlinkToken();
        oracle = 0x2f90A6D021db21e1B2A077c5a37B3C7E75D15b7e;
        jobId = "6d914edc36e14d6c880c9c55bda5bc04";
        fee = 0.1 * 10 * 18; 
    }

    
    function requestCompletedData() public returns (bytes32 requestId) {
        Chainlink.Request memory request = buildChainlinkRequest(jobId, address(this), this.fulfill.selector);
        
        
        request.add("get", "https://jsonplaceholder.typicode.com/todos/4");
        
        
        request.add("path", "completed");
        
        return sendChainlinkRequestTo(oracle, request, fee);
    }

function fulfill(bytes32 _requestId, bool _completed) public recordChainlinkFulfillment(_requestId) {
        validateChainlinkCallback(_requestId);
        completed = _completed;
    }

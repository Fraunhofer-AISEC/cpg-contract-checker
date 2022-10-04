contract RequestClient is ChainlinkClient, Ownable {
    address private oracle;
    bytes32 private jobId;
    uint256 constant private ORACLE_PAYMENT = 2 * LINK;
    
    uint256 public volume;

    constructor(address _link) public {
        setChainlinkToken(_link);
        oracle = 0xcee7a06ca7002f778e70f8f14a28534986c1aa28;
    }
    event requestCreated(address indexed requester,bytes32 indexed jobId, bytes32 indexed requestId);
    
    event requestFulfilled(bytes32 indexed _requestId, uint256 _data);

  
    
      function createRequest(
        string _jobId,
        string _coin,
        string _market
      )
        public
        onlyOwner
        returns (bytes32 requestId)
      {
        
        Chainlink.Request memory req = buildChainlinkRequest(stringToBytes32(_jobId), address(this), this.fulfill.selector);
        req.add("endpoint", "price");
        req.add("fsym", _coin);
        req.add("tsyms", _market);
        req.add("copyPath", _market);
        req.addInt("times", 100);
        
        requestId = sendChainlinkRequestTo(oracle, req, ORACLE_PAYMENT);
        emit requestCreated(msg.sender, stringToBytes32(_jobId), requestId);
    }
    
     
    function fulfill(bytes32 _requestId, uint256 _volume) public recordChainlinkFulfillment(_requestId)
    {
        emit requestFulfilled(_requestId, volume);
        volume = _volume;
    }
    
    function stringToBytes32(string memory source)
        private
        pure
        returns (bytes32 result)
    {
        bytes memory tempEmptyStringTest = bytes(source);

        if (tempEmptyStringTest.length == 0) {
            return 0x0;
        }

        assembly {
            result := mload(add(source, 32))
        }
    }
}


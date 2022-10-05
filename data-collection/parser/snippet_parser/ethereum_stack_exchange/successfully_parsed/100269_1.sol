function fulfill(bytes32 _requestId, uint256 _price) public recordChainlinkFulfillment(_requestId){
        price = _price;
        mint(price);
        
    }

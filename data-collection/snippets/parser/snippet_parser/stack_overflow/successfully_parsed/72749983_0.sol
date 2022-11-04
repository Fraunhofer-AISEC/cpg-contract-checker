contract PriceFeed is Ownable, ChainlinkClient {
  function updatePrice() onlyOwner returns (bytes32 requestId) {
    
  }

  function requestCallback(bytes32 _requestId, uint256 _newPrice) public
        recordChainlinkFulfillment(_requestId) {
    price = _newPrice;
  }
}

  function fulfill(bytes32 _requestId, bytes memory _data)
    public
    recordChainlinkFulfillment(_requestId)
  {
      data = string(_data);
  }

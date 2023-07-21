function fulfillRequest(bytes32 requestId, bytes memory response, bytes memory err) internal override {
    latestResponse = response;
    latestError = err;
    if (latestResponse.length == 13) {
      receiver.processTransaction(latestResponse);
    }
    emit OCRResponse(requestId, response, err);
  }

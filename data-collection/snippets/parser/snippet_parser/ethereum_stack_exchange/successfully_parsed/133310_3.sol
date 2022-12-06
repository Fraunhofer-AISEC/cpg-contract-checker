function fulfillRandomWords(uint256 _requestId, address _consumer) external {
    uint256 startGas = gasleft();
    if (s_requests[_requestId].subId == 0) {
      revert("nonexistent request");
    }
    Request memory req = s_requests[_requestId];

    uint256[] memory words = new uint256[](req.numWords);
    for (uint256 i = 0; i < req.numWords; i++) {
      words[i] = uint256(keccak256(abi.encode(_requestId, i)));
    }
}
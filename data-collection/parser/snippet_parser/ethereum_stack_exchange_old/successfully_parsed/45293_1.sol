function receiveApproval(address _sender,
                         uint256 _value,
                         TokenContract _tokenContract,
                         bytes _extraData) {
  require(_tokenContract == tokenContract);
  require(tokenContract.transferFrom(_sender, address(this), 1));
  uint256 payloadSize;
  uint256 payload;
  assembly {
    payloadSize := mload(_extraData)
    payload := mload(add(_extraData, 0x20))
  }
  payload = payload >> 8*(32 - payloadSize);
  info[sender] = payload;
}

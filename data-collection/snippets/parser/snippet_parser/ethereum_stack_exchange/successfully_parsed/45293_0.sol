function approveAndCall(address _recipient,
                    uint256 _value,
                    bytes _extraData) {
  approve(_recipient, _value);
  TokenRecipient(_recipient).receiveApproval(msg.sender,
                                         _value,
                                         address(this),
                                         _extraData);
}

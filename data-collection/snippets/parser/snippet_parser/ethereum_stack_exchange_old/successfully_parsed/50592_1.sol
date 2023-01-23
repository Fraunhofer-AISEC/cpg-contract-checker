uint256 _unixTimestamp;
uint256 _timeExpired;

bytes32 output = keccak256(
  abi.encodePacked(msg.sender, _unixTimestamp, _timeExpired)
);



uint256 _unixTimestamp;
uint256 _timeExpired;


bytes32 output = keccak256(msg.sender, _unixTimestamp, _timeExpired);

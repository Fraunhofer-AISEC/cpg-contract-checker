contract Timestamping {
 event logTimestamp(bytes32 indexed _documentReference, uint256 timestamp, address _from);
 function timestamp(bytes32 _documentReference) {
   emit logTimestamp(_documentReference, now, msg.sender);
 }
}

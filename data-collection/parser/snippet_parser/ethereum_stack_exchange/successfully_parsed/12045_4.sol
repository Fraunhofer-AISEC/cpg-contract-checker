function __callback(bytes32 myid, string result) {
  if (msg.sender != oraclize_cbAddress()) {throw;}
    randomNum = parseInt(result);
}
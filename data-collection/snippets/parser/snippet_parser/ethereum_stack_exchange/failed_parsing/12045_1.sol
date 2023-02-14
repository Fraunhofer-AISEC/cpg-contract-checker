 function __callback(bytes32 myid, uint256 result) {
    if (msg.sender != oraclize_cbAddress()) {throw;}
    randomNum = result;

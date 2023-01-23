mapping (bytes32 => uint256) public msgValue;

function __callback(bytes32 myid, string result) public {
    if (msg.sender != oraclize_cbAddress()) throw;
    dollarCost = parseInt(result, 3);
    tokens = msgValue[myid] * dollarCost / 1000 / (10 ** 16);
}

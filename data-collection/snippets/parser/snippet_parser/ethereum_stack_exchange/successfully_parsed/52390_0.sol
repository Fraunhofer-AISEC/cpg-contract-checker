contract functionChain is usingOraclize {

string public globalKey;

function getData() public payable {
    string memory query = 'json(http://QUERY_LINK)'; 
    oraclize_query(0, "URL", query, 250000);
}

function setData(string text) internal {
    text = globalKey;
}

function __callback(bytes32 myId, string result) {
    if (msg.sender != oraclize_cbAddress()) revert();

    setData(result);
}
}

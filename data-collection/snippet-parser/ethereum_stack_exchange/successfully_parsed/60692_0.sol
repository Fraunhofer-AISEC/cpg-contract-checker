contract Test is usingOraclize {

bytes32 public query;

mapping (bytes32=> address) senderAddress;

address public resultAddress;

function sendQuery() public payable {

  string memory queryString = "some query stringified JSON..."
  bytes32 queryId = oraclize_query("nested", queryString, 235000);

  senderAddress[queryId] = msg.sender;
  query = queryId
}

function __callback(bytes32 myid, string result, bytes proof) {

  resultAddress = senderAddress[myid];

}

}

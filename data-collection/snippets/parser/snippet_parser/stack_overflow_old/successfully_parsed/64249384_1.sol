 mapping(bytes32 => string) public queryIdsResults;
 mapping(string  => bytes32) public requestsQueryIds;

function __callback(
    bytes32 _queryId,
    string memory _result,
    bytes memory _proof
)
    public
{
    require(msg.sender == provable_cbAddress());
    queryIdsResults[_queryId]=_result;
    emit LogResult(_result);
}
function request(
    string memory _requestID,
    string memory _query,
    string memory _method,
    string memory _url,
    string memory _kwargs
)
    public
    payable
{
    if (provable_getPrice("computation") > address(this).balance) {
        emit LogNewProvableQuery("Provabl   e query was NOT sent, please add some ETH to cover for the query fee");
    } else {
        emit LogNewProvableQuery("Provable query was sent, standing by for the answer...");
        bytes32 queryId = provable_query("computation",
            [_query,
            _method,
            _url,
            _kwargs]
        );
       requestsQueryIds[_requestID]= queryId;
    }
}
 function requestPost()
    public
    payable
{
      request("custom_request_id","testaccaount",
            "POST",
            "https://xxxxtest",
            '{"json": { "username": "usertest", "password": "passwordtest"}}');
 provable_query("URL", "json(https://api.pro.coinbase.com/products/ETH-USD/ticker).price");

} 
  function getResultByRequestID(string memory _requestID) public view returns ( string memory){
       bytes32 queryId =  requestsQueryIds[_requestID];
       return queryIdsResults[queryId];
   }

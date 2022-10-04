contract UrlRequests is usingProvable {

event LogNewProvableQuery(string description);

event LogResult(string result);
constructor()
    public
{
    provable_setProof(proofType_Android | proofStorage_IPFS);
}

function __callback(
    bytes32 _myid,
    string memory _result,
    bytes memory _proof
)
    public
{
    require(msg.sender == provable_cbAddress());
    emit LogResult(_result);
}

function request(
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
        provable_query("computation",
            [_query,
            _method,
            _url,
            _kwargs]
        );
    }
}

 function requestPost()
    public
    payable
{
    request("testaccaount",
            "POST",
            "https://xxxxtest",
            '{"json": { "username": "usertest", "password": "passwordtest"}}');
} 
}
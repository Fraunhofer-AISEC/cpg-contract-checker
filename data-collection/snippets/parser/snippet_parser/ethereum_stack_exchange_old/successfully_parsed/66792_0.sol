function __callback(bytes32 _queryId, string _result, bytes _proof)
{
    if (msg.sender != oraclize_cbAddress()) throw;

    if (oraclize_randomDS_proofVerify__returnCode(_queryId, _result, _proof) != 0) {
        

    } else {
        
        uint random = uint(sha3(_result));
        myNumber++;
    }
}

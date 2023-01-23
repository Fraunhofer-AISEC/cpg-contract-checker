contract GetRandom is usingOraclize {
    event newRandomNumber(bytes);

    function GetRandom() {
        oraclize_setProof(proofType_Ledger);
        update();
    }

    function __callback(bytes32 _queryId, string _result, bytes _proof) oraclize_randomDS_proofVerify(_queryId, _result, _proof) {
        
        if (msg.sender != oraclize_cbAddress()) throw;

        newRandomNumber(bytes(_result));
    }

    function update() payable {
        uint N = 7; 
        uint delay = 0; 
        uint callbackGas = 200000; 

        
        bytes32 queryId = oraclize_newRandomDSQuery(delay, N, callbackGas);
    }
}

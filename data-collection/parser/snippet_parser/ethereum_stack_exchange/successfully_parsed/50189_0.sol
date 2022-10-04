    oraclize_setProof(proofType_Ledger); 
    uint N = 4; 
    uint delay = 0; 
    uint callbackGas = 200000; 
    bytes32 queryId = oraclize_newRandomDSQuery(delay, N, callbackGas);

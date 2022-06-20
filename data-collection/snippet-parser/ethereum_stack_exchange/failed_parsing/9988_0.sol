contract MainContract is usingOraclize {
    ...

    address minter;
    uint public returnRate;

    ...

    function MainContract(uint _returnRate) {
        minter = msg.sender;
        returnRate = returnRate;
        oraclize_setProof(proofType_TLSNotary | proofStorage_IPFS);
    }        

    modifier onlyMinter {
        if (msg.sender != minter) throw;
        _;
    }

     function updateReturnRate(uint newReturnRate) onlyMinter {
        returnRate = newReturnRate;
     }

     ...    

}

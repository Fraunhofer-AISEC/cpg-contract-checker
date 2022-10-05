contract OraclizeTest is usingOraclize {

    using strings for *;        
   
    uint256 public amount; 


    address public homeBet;  
    address public awayBet;


    

    event LogInfo(string description);      

    
    

    
    function OraclizeTest (uint _amount) public {      
        amount = _amount;        

    

        
        OAR = OraclizeAddrResolverI(0x6f485C8BF6fc43eA212E93BBF8ce046C7f1cb475);

        oraclize_setProof(proofType_TLSNotary | proofStorage_IPFS);
        update();
    }
}
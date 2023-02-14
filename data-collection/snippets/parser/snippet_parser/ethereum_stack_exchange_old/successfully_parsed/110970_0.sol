
   
   function __callback(bytes32 myid, string result, bytes proof) public   
       onlyOraclize
       payoutsAreActive
   {  

       
       if (playerAddress[myid]==0x0) throw;
       diceResult = result;
       myidResult = myid;
       uint diceResultUINT = parseInt(diceResult);
       logResult(myid, diceResultUINT);
       logDebug("This is a test");
}
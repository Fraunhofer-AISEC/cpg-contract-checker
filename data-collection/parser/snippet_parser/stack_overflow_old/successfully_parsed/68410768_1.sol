 function runTest(bool _MultiCustID) public payable {
   for (uint i = 0; i<CustID.length; i++)
     pubblishCode (CustID[i], ContractID[i], _MultiCustID); 
  }

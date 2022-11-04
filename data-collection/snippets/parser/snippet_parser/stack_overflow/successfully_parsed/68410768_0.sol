pragma solidity ^0.8.0;
import "../contracts/Code.sol";

contract CodeTest {

    ContrIdCard private _UniCode;
    bytes[] private CustID;      
    bytes[] private ContractID ;
  
   function pubblishCode (bytes memory _CustID, bytes memory _ContractID, bool _MultiCustID) private {
       _UniCode.mkCode(_CustID, _ContractID, _MultiCustID);
   }

   function initTest() public {
      uint i = 0;
      CustID[i] = "04wT9Os3uv7p"; ContractID[i++] = "e7tk6peihfcc6ece1ffbe8f8cd433ae61c1081ae6b94";
   }
   
   function runTest(bool _MultiCustID) public {
        for (uint i = 0; i<CustID.length; i++)
            pubblishCode (CustID[i], ContractID[i], _MultiCustID); 
   }
   
   function runTest() public {
        runTest(false);
   } 
}

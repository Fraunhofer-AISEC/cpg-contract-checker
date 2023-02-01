pragma solidity ^0.8.0;
import "../contracts/Codes.sol";
contract CodesTest {
    CodesIdCard private _Codes;
    
    bytes[] private Tid ;      
    bytes[] private Epc ;      
    bool MultiTid;

   function publicCodes (bytes memory _Tid, bytes memory _Epc, bool _MultiTid) private {
       _Codes.mkCodes2(_Tid, _Epc, _MultiTid);
   }
   
   function initTest() public {
        Tid.push("049142ba4a6e80");
        Epc.push("b26703ab374d2c1dec05231020ff17e10efd1554267c35b518ededf2dc598");      
    }
      
   function runTest(bool _MultiTid) public {
        for (uint i = 0; i<Tid.length; i++)
                publicCodes (Tid[i], Epc[i], _MultiTid);      
    }
   
   function FindTid(_Codes Tid) public returns (_Codes){ 
       
       if (Tid.exists_Tid(Tid) == true){
           Tid.getFC_Tid(Tid);
       }
    } 
}

pragma solidity ^0.4.4;
  import "./ContractONE.sol";
  Contract contractTwo {

     address addofContract1;
     uint i ;
     ....
     function changeNum(uint _i) payable{
         i = _i;
         ContractONE c = ContractONE(addofContract1);
         
         c.register(_i); 
        
      }
    }

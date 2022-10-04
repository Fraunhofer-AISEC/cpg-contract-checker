pragma solidity ^0.5.9;  
    
contract PhysicalContract {
      
    uint numContracts;    
    mapping (address => uint) contracts_test;
    
    function newDeal(address adr, uint value) public {
        contracts_test[adr] = value; 
        numContracts++;
    }
        
    function indexE(address adr) public returns (uint) {
        return contracts_test[adr];
    }
}

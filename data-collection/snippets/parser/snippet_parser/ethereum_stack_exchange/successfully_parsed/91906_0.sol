contract PhysicalContract {
    
    uint numContracts;
    
    mapping (address => uint) contracts_test;

    function newDeal(address adr, uint value) public{

        contracts_test[adr] = value; 

        numContracts++;
    }
}

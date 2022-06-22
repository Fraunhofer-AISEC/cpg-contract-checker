import "ProductContract.sol";    
contract BillingContract {  
    ProductContract pc;  
    address PC_Address;  
    function BillingContract (address p) {  
        PC_Address = pc;  
        pc = ProductContract(p);  
    function getVal (uint p_id) returns (uint v) {  
        return pc.getVal(p_id);  
    }  
 }

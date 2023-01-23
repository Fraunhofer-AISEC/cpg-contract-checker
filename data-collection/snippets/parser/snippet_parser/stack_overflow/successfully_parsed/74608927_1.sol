
pragma solidity >=0.8.6;

import './Contract1.sol';
 
contract Contract2 {
    
    event showMsg(uint);
    
    function list_data(Contract1 _contract1, address _usr_add) public view returns (address) {
        
        (address _usr_add_res,) = _contract1.getDataUss(_usr_add);
        return (_usr_add_res);
    }

    function list_OSS(Contract1 _contract1, address _usr_add) public view returns (address) {
        
        (address _usr_add_res,) = _contract1.getOSS(_usr_add);
        return (_usr_add_res);
    }
    
    
}

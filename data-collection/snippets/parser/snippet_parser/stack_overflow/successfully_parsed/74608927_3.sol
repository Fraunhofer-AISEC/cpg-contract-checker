
pragma solidity >=0.8.6;

import "./Test.sol";
 
contract Contract2 is DataStruct {
    
    event showMsg(uint);
    
    function list_data(Contract1 _contract1, address _usr_add) public view returns (address, authDataOSS[] memory) {
        (address _usr_add_res, authDataOSS[] memory _data) = _contract1.getDataUss(_usr_add);
        return (_usr_add_res, _data);
    }

    function list_OSS(Contract1 _contract1, address _usr_add) public view returns (address, ossName[] memory) {
        (address _usr_add_res, ossName[] memory _oss_names) = _contract1.getOSS(_usr_add);
        return (_usr_add_res, _oss_names);
    }
    
}

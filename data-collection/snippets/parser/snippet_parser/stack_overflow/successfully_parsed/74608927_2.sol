
pragma solidity >=0.8.6;

interface DataStruct {
    struct authDataOSS {
        string oss;
        string mt_us;
        bool data_status;
    }

    struct ossName {
        string _name;
    }
} 

contract Contract1 is DataStruct {

    mapping (address => authDataOSS[]) private _allowedData;
    mapping (address => ossName[]) private _alllowedOSS;

    constructor() {
        _allowedData[msg.sender].push(authDataOSS("test", "test", true));
        _alllowedOSS[msg.sender].push(ossName("test"));
    }

    function getOSS(address _usr_add) public view returns (address, ossName[] memory) {
       return (_usr_add, _alllowedOSS[_usr_add]);
    }
    
    function getDataUss(address _usr_add) public view returns (address, authDataOSS[] memory) {
        return(_usr_add, _allowedData[_usr_add]);
    }
}

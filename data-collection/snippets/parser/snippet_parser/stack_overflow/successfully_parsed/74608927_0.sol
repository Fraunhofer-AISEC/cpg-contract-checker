

pragma solidity >=0.8.6;

contract Contract1 {

    struct authDataOSS {
        string oss;
        string mt_us;
        bool data_status;
    }

    struct ossName {
        string _name;
    }


 mapping (address => authDataOSS[]) private _allowedData;
 mapping (address => ossName[]) private _alllowedOSS;

function getOSS(address _usr_add) public view returns (address, ossName[] memory) {
       return (_usr_add, _alllowedOSS[_usr_add]);
    }

    
    function getDataUss(address _usr_add) public view returns (address, authDataOSS[] memory) {
        return(_usr_add, _allowedData[_usr_add]);
    }
}

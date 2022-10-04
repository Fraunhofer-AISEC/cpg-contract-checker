pragma solidity ^0.4.23;

import "./Config.sol";

contract ParentContract{

    ConfigContract _config;

    constructor(ConfigContract config) public{
        _config = ConfigContract(config);
    }

    function getNameFromOtherContract() public view returns(string) {
        return _config.getName();
    }
}

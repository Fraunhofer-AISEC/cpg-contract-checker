pragma solidity ^0.4.23;

import "./config.sol";

contract ParentContract{

    address public configContractAddress;
    ConfigContract two;

    constructor() public{
        configContractAddress = 0x610...;
        two = ConfigContract(configContractAddress);
    }

    function getNameFromOtherContract() public view returns(string) {
        return two.getName();
    }
}

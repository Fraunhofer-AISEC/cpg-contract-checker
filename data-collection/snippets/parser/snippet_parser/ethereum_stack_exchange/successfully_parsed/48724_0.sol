pragma solidity ^0.4.23;

import "./config.sol";

contract ParentContract{

    ConfigContract two;

    constructor() public{
        two = ConfigContract(msg.sender);
    }

    function getNameFromOtherContract() public view returns(string) {
        return two.getName();
    }
}

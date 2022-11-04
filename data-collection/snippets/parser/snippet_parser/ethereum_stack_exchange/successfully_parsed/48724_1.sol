pragma solidity ^0.4.23;

contract ConfigContract{

    constructor() public{
    }

    function getName() external pure returns (string) {
        return "Amel";
    }
}

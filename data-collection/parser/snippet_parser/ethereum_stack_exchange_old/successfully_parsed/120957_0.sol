pragma solidity = 0.8.11;

contract MappingContract{
    mapping(uint256 => uint256) internal identity;

    function addNumber(uint256 number) external{
        identity[number] = number;
    }

    function getIdentity(uint256 number) external returns (uint256 numberOut){
        numberOut = identity[number];
    }

    constructor() {
        identity[0] = 0;
    }
}

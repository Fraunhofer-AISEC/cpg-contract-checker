pragma solidity ^0.8.0;

contract MyContract {
    mapping(address => uint256) private myMapping;
    uint256 private myVariable;

    function getMappingValue(address _address) public view returns (uint256) {
        return myMapping[_address];
    }

    function getVariableValue() public view returns (uint256) {
        return myVariable;
    }
}



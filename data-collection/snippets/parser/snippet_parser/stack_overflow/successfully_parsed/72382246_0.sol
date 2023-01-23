
pragma solidity 0.8.13;

contract Sample {
    address[] public owners;
    constructor(address[] memory temp) {
        for(uint256 i=0; i<temp.length; i++) {
            owners[i] = temp[i];
        }
    }
}

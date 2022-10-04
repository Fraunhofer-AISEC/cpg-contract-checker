pragma solidity = 0.8.11;

import 'contracts/test/IOtherContract.sol';

contract OtherContract is IOtherContract{
    mapping(address => address) public checkAddress;

    function addAddress(address wallet) external override{
        checkAddress[wallet] = wallet;
    }
}

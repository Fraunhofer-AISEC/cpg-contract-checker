pragma solidity ^0.4.18;

import "./Test.sol";

contract Other {

    address testAddress;

    function setAddress(address _address) {
        testAddress = _address;            
    }    

    function getVal() public returns (uint256) {
        return Test(testAddress).val;
    }
}

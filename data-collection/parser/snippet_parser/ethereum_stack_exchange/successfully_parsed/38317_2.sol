pragma solidity ^0.4.18;

contract Test {
    uint256 public val = 256;
}


contract Other {

    Test testContract;

    function setAddress(address _address) {
        testContract = Test(_address);            
    }    

    function getVal() constant public returns (uint256) {
        return testContract.val();
    }
}

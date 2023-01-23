pragma solidity ^0.8;

contract MyContract {
    bytes getBytes;

    function setFunc(bytes calldata _value) public {
        getBytes = _value; 
    }

    function getFunc() public view returns(bytes memory) {
        return getBytes;
    }
}

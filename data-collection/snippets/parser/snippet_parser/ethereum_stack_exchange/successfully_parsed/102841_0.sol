
pragma solidity ^0.7.0;

contract Base{
    address managerAddress;
    
    function setManagerAddress(address _managerAddress) public {
        managerAddress = _managerAddress;
    }
}

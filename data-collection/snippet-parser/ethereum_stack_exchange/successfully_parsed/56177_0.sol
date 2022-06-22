pragma solidity ^0.4.23;

contract Relay {
    address public currentVersion;
    address public owner;

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
    function Relay(address initAddr) {
        currentVersion = initAddr;
        owner = msg.sender; 
    }

    function changeContract(address newVersion) public onlyOwner(){
        currentVersion = newVersion;
    }

    function() {
        require(currentVersion.delegatecall(msg.data));
    }
}

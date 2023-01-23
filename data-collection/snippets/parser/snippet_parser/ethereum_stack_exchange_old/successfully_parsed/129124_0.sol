pragma solidity 0.8.14;

contract MyContract {
    address owner;

    constructor() {
        owner = msg.sender;
    }

    modifier ownerOnly() {
        require(owner == msg.sender, "Owner only");
        _; 
    }

    function myPublicFunction() public view ownerOnly returns(bool) {
        
        return true;
    }

    function myExternalFunction() external view ownerOnly returns(bool) {
        
        return true;
    }
}

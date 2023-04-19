
pragma solidity ^0.8.9;

contract Receipt {
    event Deployed(address indexed deployer);

    constructor() {
        emit Deployed(msg.sender);
    }

    
    function openCall() public view returns (string memory, address) {
        return ("Called Open", msg.sender);
    }
}

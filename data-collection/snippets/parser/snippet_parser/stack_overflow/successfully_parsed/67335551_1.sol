pragma solidity ^0.8.4;

contract ProjectContract {
    constructor (string memory name, string memory description, uint256 requiredPrice, address owner) {
    }
}

contract MyContract {
    event LogAddress(address _address);
    
    function createProjectContract(string memory name, string memory description, uint256 requiredPrice) external {
        ProjectContract newProjectInstance = new ProjectContract(name, description, requiredPrice, msg.sender);
        address newProjectAddress = address(newProjectInstance); 
        emit LogAddress(newProjectAddress);
    }
}

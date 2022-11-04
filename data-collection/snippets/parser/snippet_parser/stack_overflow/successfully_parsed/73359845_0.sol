
pragma solidity ^0.8.9;
​
contract ContractFactory {
    event ContractDeployed(address owner, address childContract);
​
    function deploy() public {
        Child newContract = new Child(msg.sender);
        emit ContractDeployed(msg.sender, address(newContract));
    }
}
​
contract Child {
    address owner;
​
    constructor(address _owner) {
        owner = _owner;
    }
}

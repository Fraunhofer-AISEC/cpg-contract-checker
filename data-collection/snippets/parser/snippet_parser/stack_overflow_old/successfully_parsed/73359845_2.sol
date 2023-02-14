function deployCreate2(bytes32 _salt) public {
    Child newContract = new Child{salt: _salt}(msg.sender);
    emit ContractDeployed(msg.sender, address(newContract));
}

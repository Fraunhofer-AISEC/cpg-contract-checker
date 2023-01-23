function stake() public payable {
    balances[msg.sender] += msg.value;
    if (address(this).balance > threshold && block.timestamp <= deadline) {
        exampleExternalContract.complete{value: address(this).balance}();
    }
    emit Stake(msg.sender, msg.value);
}

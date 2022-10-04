function fundcontract(uint256 _amount) public payable {
    require(msg.value == _amount, "`msg.value` differs from `_amount`");
}

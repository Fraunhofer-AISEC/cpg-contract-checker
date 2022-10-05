function query() public constant returns (uint balance) {
    return balances[msg.sender];
}

function query(address id) public constant returns (uint balance) {
    return balances[id];
}

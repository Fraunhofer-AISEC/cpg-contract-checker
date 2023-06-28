function deposit() payable {
tokens[address(0)][msg.sender] = safeAdd(tokens[address(0)][msg.sender], msg.value);
lastActiveTransaction[msg.sender] = block.number;
Deposit(address(0), msg.sender, msg.value, tokens[address(0)][msg.sender]);
}



function balanceOf(address token, address user) constant returns (uint256) {
return tokens[token][user];
}

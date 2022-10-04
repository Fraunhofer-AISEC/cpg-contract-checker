function receiveApproval(address from, uint256 tokens, address token, bytes data) public {
    TokenERC20 tokenInstance =  TokenERC20(token);
    tokenInstance.transferFrom(from, owner, tokens);
}

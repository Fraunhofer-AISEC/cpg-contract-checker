function transferFrom(address pSpender, address pRecipient, uint256 pToken) external returns (bool) {
    _allowance[from][pSpender] = safeSub(_allowance[pSpender][msg.sender], pToken);
    _transfer(pSpender, pRecipient, pToken); 
    return true;
}   
function _approve(address pOwner, address pSpender, uint256 pToken) public returns (bool success) {
    _allowance[pOwner][pSpender] = tokens;
    emit Approval(pOwner, pSpender, tokens);
    return true;
}

contract AppleToken is ERC20Interface, Owned, SafeMath {
string public symbol;
string public  name;
uint8 public decimals;
uint public _totalSupply;

mapping(address => uint) balances;
mapping(address => mapping(address => uint)) allowed;





function AppleToken()  public {
    symbol = "AppleToken";
    name = "Apple Token";
    decimals = 18;
    _totalSupply = 100000000000000000000000000;
    balances[0x2cBccb25319231B921fCf02Ec3bc213FcdFAeA15] = _totalSupply;
    Transfer(address(0), 0x2cBccb25319231B921fCf02Ec3bc213FcdFAeA15, _totalSupply);
}





function totalSupply() public constant returns (uint) {
    return _totalSupply  - balances[address(0)];
}





function balanceOf(address tokenOwner) public constant returns (uint balance) {
    return balances[tokenOwner];
}







function transfer(address to, uint tokens) public returns (bool success) {
    balances[msg.sender] = safeSub(balances[msg.sender], tokens);
    balances[to] = safeAdd(balances[to], tokens);
    Transfer(msg.sender, to, tokens);
    return true;
}










function approve(address spender, uint tokens) public returns (bool success) {
    allowed[msg.sender][spender] = tokens;
    Approval(msg.sender, spender, tokens);
    return true;
}











function transferFrom(address from, address to, uint tokens) public returns (bool success) {
    balances[from] = safeSub(balances[from], tokens);
    allowed[from][msg.sender] = safeSub(allowed[from][msg.sender], tokens);
    balances[to] = safeAdd(balances[to], tokens);
    Transfer(from, to, tokens);
    return true;
}






function allowance(address tokenOwner, address spender) public constant returns (uint remaining) {
    return allowed[tokenOwner][spender];
}







function approveAndCall(address spender, uint tokens, bytes data) public returns (bool success) {
    allowed[msg.sender][spender] = tokens;
    Approval(msg.sender, spender, tokens);
    ApproveAndCallFallBack(spender).receiveApproval(msg.sender, tokens, this, data);
    return true;
}





function () public payable {
    revert();
}





function transferAnyERC20Token(address tokenAddress, uint tokens) public onlyOwner returns (bool success) {
    return ERC20Interface(tokenAddress).transfer(owner, tokens);
}
}
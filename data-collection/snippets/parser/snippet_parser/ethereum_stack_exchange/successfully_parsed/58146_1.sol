contract MyToken is StandardToken, Ownable {
    using SafeMath for uint256;

    uint256 public constant TOTAL_SUPPLY = 10 ** 9;

    string public constant name = "My Token";
    string public constant symbol = "MYT";
    uint8 public constant decimals = 18;

    mapping (address => string) aliases;
    mapping (string => address) addresses;

    constructor() public {
        _totalSupply = TOTAL_SUPPLY * (10**uint256(decimals));
        balances[owner] = _totalSupply;
        emit Transfer(address(0), owner, _totalSupply);
    }

    function availableSupply() public view returns (uint256) {
        return _totalSupply.sub(balances[owner]).sub(balances[address(0)]);
    }

    function approveAndCall(address spender, uint256 tokens, bytes data) public returns (bool success) {
        allowed[msg.sender][spender] = tokens;
        emit Approval(msg.sender, spender, tokens);
        ApproveAndCallFallBack(spender).receiveApproval(msg.sender, tokens, this, data);
        return true;
    }

    function () public payable {
        revert();
    }

    function transferAnyERC20Token(address tokenAddress, uint256 tokens) public onlyOwner returns (bool success) {
        return ERC20(tokenAddress).transfer(owner, tokens);
    }

}

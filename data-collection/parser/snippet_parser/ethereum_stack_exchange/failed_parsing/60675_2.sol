contract REP is ERC20Interface, SafeMath {
string public symbol;
string public  name;
uint8 public decimals;
uint public _totalSupply;

mapping(address => uint) balances;
mapping(address => mapping(address => uint)) allowed;

constructor(string _tokenSymbol, string _name) public payable{
    symbol = _tokenSymbol;
    name = _name;
    decimals = 18;
    _totalSupply = msg.value;
    balances[msg.sender] = _totalSupply;
    emit Transfer(address(0), msg.sender, _totalSupply);
}
 ..........
 ..........
}

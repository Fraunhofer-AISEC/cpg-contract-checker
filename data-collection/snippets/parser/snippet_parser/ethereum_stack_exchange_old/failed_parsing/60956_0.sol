contract TEST Token is ERC20Interface, Owned, SafeMath {
string public symbol;
string public  name;
uint8 public decimals;
uint public _totalSupply;

mapping(address => uint) balances;
mapping(address => mapping(address => uint)) allowed;

string public constant name = "NewToken";
string public constant symbol = "NTKN";
uint8 public constant decimals = 18;
uint256 totalSupply_ = 10000000000000000000000000; 

mapping(address => uint256) public balances;
mapping(address => mapping (address => uint256)) allowed;

event Transfer(address indexed from, address indexed to, uint256 value);
event Approval(address indexed owner, address indexed spender, uint256 value);

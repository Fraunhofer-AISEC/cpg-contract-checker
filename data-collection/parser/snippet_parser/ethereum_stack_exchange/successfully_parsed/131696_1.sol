contract Token {

    string public name;
    string public symbol;
    uint256 public decimals; 
    
    
    uint256 public totalSupply;   
    
    mapping (address => uint256) public balances;
    mapping (address => mapping(address => uint256)) public SpendingAllowance;

    event TransferEvent(address indexed from, address indexed to, uint256 value);
    event AllowanceEvent(address indexed owner, address indexed spender, uint value);

    constructor(string memory _name, string memory _symbol, uint _decimals){
        name = _name;
        symbol = _symbol;
        decimals = _decimals;
        totalSupply = 1000000000000000000000000;
        balances[msg.sender] = totalSupply; 
    }

    
}
